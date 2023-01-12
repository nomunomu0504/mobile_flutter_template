import 'package:flutter/material.dart';
import 'package:flutter_template/view/main/main_page.dart';
import 'package:flutter_template/view/splash/splash_page.dart';

class Routes {
  /// アプリルート
  static const root = '/';

  /// スプラッシュ画面
  static const splash = '/Splash';

  /// メイン画面
  static const main = '/Main';

  static Route<dynamic> routes(String? routeName, {Object? arguments}) {
    final RouteSettings settings = RouteSettings(name: routeName, arguments: arguments);
    switch (routeName) {
      case root:
        return MaterialPageRoute(settings: settings, builder: (_) => const SplashPage());
      case main:
        return MaterialPageRoute(settings: settings, builder: (_) => const MainPage());
      default:
        throw Exception('Unknown route: ${settings.name}');
    }
  }
}
