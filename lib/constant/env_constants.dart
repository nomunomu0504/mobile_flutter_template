import 'package:enum_to_string/enum_to_string.dart';

enum AppEnv {
  development,
  production,
}

class EnvConstants {
  const EnvConstants({
    required this.dummy,
  });

  static EnvConstants? _instance;

  final String dummy;

  factory EnvConstants.of() {
    if (_instance != null) return _instance!;

    final flavor = EnumToString.fromString(
      AppEnv.values,
      const String.fromEnvironment("FLAVOR"),
    );

    switch (flavor) {
      case AppEnv.development:
        _instance = EnvConstants._development();
        break;
      case AppEnv.production:
        _instance = EnvConstants._production();
        break;
      default:
        _instance = EnvConstants._development();
    }

    return _instance!;
  }

  factory EnvConstants._development() {
    return const EnvConstants(
      dummy: "",
    );
  }

  factory EnvConstants._production() {
    return const EnvConstants(
      dummy: "",
    );
  }
}
