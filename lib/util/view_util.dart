import 'package:firebase_crashlytics/firebase_crashlytics.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_template/error/app_error.dart';
import 'package:flutter_template/logger/logger.dart';
import 'package:flutter_template/util/dialog_util.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

Future<void> handleError(
  BuildContext context,
  WidgetRef ref,
  Object error, {
  StackTrace? stackTrace,
}) async {
  logger.severe(error);

  // CrashlyticsにnonFatalエラーを送信
  await FirebaseCrashlytics.instance.recordError(error, stackTrace);

  if (error is AppError) {
    switch (error.type) {
      case AppErrorType.dummyError:
        await showAlertDialog(
          context: context,
          message: "Dummy Error Title",
          note: "Dummy Error Detail",
        );
        break;
      case AppErrorType.apiTimedOut:
        await showAlertDialog(
          context: context,
          message: "エラーが発生しました",
          note: "サーバーとの通信でタイムアウトが発生しました。\n通信環境のよいところで再度お試しください。",
        );
        break;
      case AppErrorType.apiOffline:
        await showAlertDialog(
          context: context,
          message: "エラーが発生しました",
          note: "通信ができません。\nネットワーク設定を確認してください。",
        );
        break;
      case AppErrorType.apiNoContent:
        // metaがAPIから取得できない場合はエラーを握りつぶしておく
        break;
      case AppErrorType.apiBadRequest:
        await showAlertDialog(
          context: context,
          message: "エラーが発生しました",
          note: "サーバーとの通信でエラーが発生しました。\nしばらくしてから再度お試しください。\n(エラーコード: 40000)",
        );
        break;
      case AppErrorType.apiUnauthorized:
        await showAlertDialog(
          context: context,
          message: "エラーが発生しました",
          note: "サーバーとの通信でエラーが発生しました。\nしばらくしてから再度お試しください。\n(エラーコード: 40100)",
        );
        break;
      case AppErrorType.apiForbidden:
        await showAlertDialog(
          context: context,
          message: "エラーが発生しました",
          note: "サーバーとの通信でエラーが発生しました。\nしばらくしてから再度お試しください。\n(エラーコード: 40300)",
        );
        break;
      case AppErrorType.apiNotFound:
        await showAlertDialog(
          context: context,
          message: "エラーが発生しました",
          note: "サーバーとの通信でエラーが発生しました。\nしばらくしてから再度お試しください。\n(エラーコード: 40400)",
        );
        break;
      case AppErrorType.apiInternalServerError:
        await showAlertDialog(
          context: context,
          message: "エラーが発生しました",
          note: "サーバーとの通信でエラーが発生しました。\nしばらくしてから再度お試しください。\n(エラーコード: 50000)",
        );
        break;
      case AppErrorType.apiUnknown:
        await showAlertDialog(
          context: context,
          message: "エラーが発生しました",
          note: "サーバーとの通信でエラーが発生しました。\nしばらくしてから再度お試しください。\n(エラーコード: 99999)",
        );
        break;
    }
  } else {
    await showAlertDialog(
      context: context,
      message: "システムエラーが発生しました。",
    );
  }
}
