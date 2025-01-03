abstract class BaseApiServices {
  Future<dynamic> getGetApiResponse(String url, dynamic header) async {}
  Future<dynamic> getPostApiResponse(
      String url, dynamic data, dynamic header) async {}
}
