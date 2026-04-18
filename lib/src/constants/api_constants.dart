import 'package:agricola_core/src/config/environment.dart';

class ApiConstants {
  static const String apiVersion = 'v1';

  // API doesn't currently use versioning prefix
  static const String apiPrefix = 'api/$apiVersion';
  static const String cropEndpoint = '$apiPrefix/crops';

  static const String profilesEndpoint = '$apiPrefix/profiles';
  static const String analyticsEndpoint = '$apiPrefix/analytics';
  static const String inventoryEndpoint = '$apiPrefix/inventory';
  static const String marketplaceEndpoint = '$apiPrefix/marketplace';
  static const String harvestsEndpoint = '$apiPrefix/harvests';
  static const String ordersEndpoint = '$apiPrefix/orders';
  static const String cropCatalogEndpoint = '$apiPrefix/crop-catalog';
  static const String purchasesEndpoint = '$apiPrefix/purchases';
  static const String feedbackEndpoint = '$apiPrefix/feedback';
  static const String lossCalculatorEndpoint = '$apiPrefix/loss-calculator';
  static const String cropAvailabilityEndpoint = '$apiPrefix/crop-availability';

  // Timeout configuration from environment
  static Duration get requestTimeout => EnvironmentConfig.apiTimeout;
  static const Duration connectionTimeout = Duration(seconds: 15);

  /// Base URL from environment config.
  ///
  /// Platform-specific overrides (e.g. Android emulator → 10.0.2.2)
  /// should be applied by the consuming app, not here.
  static String get baseUrl => EnvironmentConfig.apiBaseUrl;

  /// Health check endpoint
  static String get healthEndpoint => '/health';

  /// Full health check URL
  static String get healthUrl => '$baseUrl$healthEndpoint';
}
