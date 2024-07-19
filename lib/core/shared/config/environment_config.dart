/// EnvironmentType Enum
///
/// Defines the available environment types for the application. Each type is
/// associated with a short [env] string that represents the environment.
enum EnvironmentType {
  development('dev');
  final String env;

  /// Creates an [EnvironmentType] with the provided [env] string.
  const EnvironmentType(this.env);
}

/// EnvironmentConfig Class
///
/// Manages the configuration for the application's environment, including the
/// [environment] type and the [apiBase] URL.
///
/// Example usage:
///
/// ```dart
/// final config = EnvironmentConfig(
///   environment: EnvironmentType.development.env,
///   apiBase: 'https://api.example.com',
/// );
/// ```
class EnvironmentConfig {
  final String environment;
  final String apiBase;

  /// Creates an [EnvironmentConfig] with the provided [environment] and [apiBase].
  EnvironmentConfig({
    required this.environment,
    required this.apiBase,
  });
}