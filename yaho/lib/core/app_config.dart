class AppConfig {
  static AppConfig? _instance;
  final Map<String, dynamic>? configs;

  final String _baseUrl = 'baseUrl';

  AppConfig._internal({
    required this.configs,
  });

  static AppConfig? get instance {
    return _instance;
  }

  factory AppConfig({
    required Map<String, dynamic> configs,
  }) {
    _instance ??= AppConfig._internal(
      configs: configs,
    );
    return _instance ??
        AppConfig(
          configs: {},
        );
  }

  String get baseUrl => configs?[_baseUrl] ?? '';
}
