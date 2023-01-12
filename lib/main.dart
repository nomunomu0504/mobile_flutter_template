import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_crashlytics/firebase_crashlytics.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:firebase_remote_config/firebase_remote_config.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_template/logger/logger.dart';
import 'package:flutter_template/repository/local/shared_preference_manager.dart';
import 'package:flutter_template/store/universal_link/universal_link_store.dart';
import 'package:flutter_template/value_object/universal_link/universal_link.dart';
import 'package:flutter_template/view/router/routes.dart';
import 'package:flutter_template/view/style/app_theme.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:intl/intl.dart';
import 'package:route_observer_mixin/route_observer_mixin.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:timezone/data/latest.dart';
import 'package:uni_links/uni_links.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  // DateFormat initialize
  //----------------------------------------------------------------
  // MaterialAppのsupportedLocales,localizationsDelegatestと衝突するためコメントアウト
  //----------------------------------------------------------------
  //await initializeDateFormatting('ja_JP');
  //----------------------------------------------------------------
  Intl.defaultLocale = 'ja_JP';

  // TimeZone initialize
  initializeTimeZones();

  // Firebase
  await Firebase.initializeApp();

  // RemoteConfig
  await FirebaseRemoteConfig.instance.setConfigSettings(
    // NOTE: サーバー最終取得時刻から5分経過していたら、最新データを取得しにいく
    RemoteConfigSettings(
      fetchTimeout: const Duration(seconds: 10),
      minimumFetchInterval: const Duration(seconds: 0),
    ),
  );

  await FirebaseRemoteConfig.instance.fetchAndActivate();

  // Crashlytics
  await FirebaseCrashlytics.instance.setCrashlyticsCollectionEnabled(true);

  // Messaging
  await FirebaseMessaging.instance.requestPermission();

  // Pass all uncaught errors to Crashlytics.
  Function originalOnError = FlutterError.onError!;
  FlutterError.onError = (errorDetails) async {
    await FirebaseCrashlytics.instance.recordFlutterError(errorDetails);
    // Forward to original handler.
    originalOnError(errorDetails);
  };

  //RiverPodを利用する為、ProviderScopeでAppを囲む
  runApp(
    ProviderScope(
      overrides: [
        sharedPreferencesProvider.overrideWithValue(
          await SharedPreferences.getInstance(),
        ),
      ],
      child: RouteObserverProvider(
        child: const MyApp(),
      ),
    ),
  );
}

class MyApp extends ConsumerStatefulWidget {
  const MyApp({
    Key? key,
  }) : super(key: key);

  @override
  ConsumerState<MyApp> createState() {
    return _MyAppState();
  }
}

class _MyAppState extends ConsumerState<MyApp> with WidgetsBindingObserver {
  @override
  void initState() {
    super.initState();

    // アプリ立ち上げ時にStackされていたMessageを取得
    FirebaseMessaging.instance.getInitialMessage().then((RemoteMessage? event) {
      if (event == null) return;
      logger.info("initial message received opened app: ${event.notification?.title}");
      logger.info(event.notification?.body);
      logger.info(event.data);
    });

    // Push通知を購読
    FirebaseMessaging.onMessage.listen((RemoteMessage event) {
      logger.info("message received: ${event.notification?.title}");
      logger.info(event.notification);
      logger.info(event.data);
    });

    // Push通知でアプリが開かれば場合の処理
    FirebaseMessaging.onMessageOpenedApp.listen((RemoteMessage event) {
      logger.info("message received opened app: ${event.notification?.title}");
      logger.info(event.notification?.body);
      logger.info(event.data);
    });

    _initializeUniversalLinks();

    WidgetsBinding.instance.addObserver(this);
  }

  void handleUniversalLink(WidgetRef ref, String? link) {
    // リンクによってアプリが開かれたか
    if (link == null) return;

    String? shareRoomId = RegExp(r'<YOUR_REG_EXP>').firstMatch(link)?.group(1);

    logger.info("==================================================");
    logger.info("linkStream listen link: $link");
    logger.info("==================================================");

    ref.read(universalLinkGlobalStoreProvider.notifier).setUniversalLink(
          UniversalLink(
            shareRoomId: shareRoomId,
          ),
        );
  }

  void _initializeUniversalLinks() async {
    final initialLink = await getInitialLink();
    handleUniversalLink(ref, initialLink);

    linkStream.listen((String? link) async {
      logger.info("linkStream listen");
      handleUniversalLink(ref, link);
    });
  }

  @override
  void dispose() {
    WidgetsBinding.instance.removeObserver(this);
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: AppTheme.themeData,
      onGenerateRoute: (settings) => Routes.routes(
        settings.name!,
        arguments: settings.arguments,
      ),
      supportedLocales: const [Locale('ja', 'JP')],
      navigatorObservers: [RouteObserverProvider.of(context)],
      localizationsDelegates: const [
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
        DefaultCupertinoLocalizations.delegate
      ],
    );
  }

  @override
  void didChangeAppLifecycleState(AppLifecycleState state) {
    super.didChangeAppLifecycleState(state);
    switch (state) {
      case AppLifecycleState.inactive:
        break;
      case AppLifecycleState.resumed:
        break;
      case AppLifecycleState.paused:
        break;
      case AppLifecycleState.detached:
        break;
    }
  }
}
