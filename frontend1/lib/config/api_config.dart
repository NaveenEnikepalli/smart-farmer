class ApiConfig {
  // Environment toggle - change this to switch between dev and production
  static const bool isDev = true; // set to false for production

  // Local development backend (for testing on same network)
  static const String localBaseUrl = "http://192.168.29.152:5000";
  
  // Production backend (will be updated after Render deployment)
  static const String prodBaseUrl = "https://myapp-backend.onrender.com";

  // Automatically returns the correct URL based on environment
  static String get baseUrl => isDev ? localBaseUrl : prodBaseUrl;

  // API endpoints
  static const String pricesEndpoint = '/api/prices';
  static const String fetchPricesEndpoint = '/api/prices/fetch';

  // Full API URLs
  static String get pricesUrl => '$baseUrl$pricesEndpoint';
  static String get fetchPricesUrl => '$baseUrl$fetchPricesEndpoint';

  // Environment info for debugging
  static String get environment => isDev ? 'Development' : 'Production';
  static String get currentUrl => baseUrl;
}
