import 'package:mosoda/Resources/api_url.dart';

class Globals {
  static String userToken = "";
  static String? username;
  static String? userPhone;
  static String? userEmail;
  static int? userId;
  static String? userPhoto;

  static Map<String, String> header() {
    return {
      'key': Apiurl.apiKey,
      if (userToken.isNotEmpty) 'token': userToken,
    };
  }

  static Map<String, String> headerWithoutToken() {
    return {'key': Apiurl.apiKey};
  }
}
