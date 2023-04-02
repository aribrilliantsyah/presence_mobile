class ApiConstant {
  static String baseUrl = "http://192.168.8.108:3000";
  // static String baseUrl = "http://192.168.0.128:3000";
  static String path = "api/v1";
  static String baseApi = '$baseUrl/$path';
  static int timeout = 10;

  static List<String> tokenInvalidMessage = [
    'token:is invalid',
    'user:not found (token invalid)',
    'token:is invalid'
  ];
}
