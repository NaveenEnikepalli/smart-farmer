import 'api_config.dart';

class AppConfig {
  // Delegate to ApiConfig for better organization
  static String get baseUrl => ApiConfig.baseUrl;
  static String get pricesUrl => ApiConfig.pricesUrl;
  static String get fetchPricesUrl => ApiConfig.fetchPricesUrl;
  static bool get isDevelopment => ApiConfig.isDev;
  static bool get isProduction => !ApiConfig.isDev;
  static String get environment => ApiConfig.environment;
  
  // Legacy support - keeping these for backward compatibility
  static const String localhostUrl = 'http://localhost:5000';
  static const String productionUrl = 'https://myapp-backend.onrender.com';
}
