import 'dart:convert';
import 'dart:io';
import 'package:mosoda/Data/Network/base_api_services.dart';
import 'package:http/http.dart' as http;
import 'package:mosoda/Data/Response/app_exception.dart';

class NetworkApiServices extends BaseApiServices {
  @override
  Future getGetApiResponse(String url, header) async {
    dynamic jsonResponse;
    try {
      var response = await http
          .get(Uri.parse(url), headers: header)
          .timeout(const Duration(seconds: 10));
      jsonResponse = returnResponse(response);
    } on SocketException {
      throw FetchDataException("No Internet Connection");
    }
    return jsonResponse;
  }

  @override
  // ignore: unnecessary_overrides
  Future getPostApiResponse(String url, data, header) async {
    dynamic jsonResponse;
    try {
      var response = await http
          .post(Uri.parse(url), body: data, headers: header)
          .timeout(const Duration(seconds: 10));
      jsonResponse = returnResponse(response);
      print(response.statusCode);
    } on SocketException {
      throw FetchDataException("No Internet Connection");
    }
    return jsonResponse;
  }

  dynamic returnResponse(http.Response response) {
    switch (response.statusCode) {
      case 200:
        dynamic responseJson = jsonDecode(response.body);
        print("Status Code ${response.statusCode}");
        return responseJson;
      case 404:
        throw BadRequestException(response.body.toString());
      case 400:
        throw BadRequestException(response.body.toString());
      default:
        throw Exception();
    }
  }
}
