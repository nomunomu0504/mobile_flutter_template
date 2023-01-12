import 'package:simple_logger/simple_logger.dart';

final logger = SimpleLogger()
  ..setLevel(
    Level.FINEST, // FINEST以上の場合ログ出力
    stackTraceLevel: Level.SEVERE, // SEVERE以上の場合stackTraceを出力
    includeCallerInfo: !const bool.fromEnvironment('dart.vm.product'), // リリースビルドではfalseにする
  )
  ..onLogged = (log, info) {
    // nothings
  }
  ..formatter = (LogInfo info) {
    return '${info.time} '
        '[${info.level}] '
        '${info.callerFrame ?? 'caller info not available'}: '
        '${info.message} ';
  }
  ..mode = LoggerMode.log;
