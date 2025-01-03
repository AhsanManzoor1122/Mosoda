import 'package:mosoda/Data/Network/base_api_services.dart';
import 'package:mosoda/Data/Network/network_api_services.dart';
import 'package:mosoda/Data/Response/app_exception.dart';
import 'package:mosoda/Globals.dart';
import 'package:mosoda/Resources/apiUrl.dart';
import 'package:mosoda/Utils/Routes/routes_name.dart';

class AuthRepository {
  BaseApiServices services = NetworkApiServices();

  Future<dynamic> signUpEmail(dynamic data) async {
    try {
      dynamic response = await services.getPostApiResponse(
          Apiurl.signUpEmail, data, Globals.header());
      return response;
    } catch (e) {
      throw FetchDataException(e.toString());
    }
  }

  Future<dynamic> loginEmail(dynamic data) async {
    try {
      dynamic response = await services.getPostApiResponse(
          Apiurl.loginEmail, data, Globals.header());
      return response;
    } catch (e) {
      throw FetchDataException(e.toString());
    }
  }
}
