import 'package:mosoda/Data/Network/base_api_services.dart';
import 'package:mosoda/Data/Network/network_api_services.dart';
import 'package:mosoda/Data/Response/app_exception.dart';
import 'package:mosoda/Resources/api_url.dart';
import 'package:mosoda/globals.dart';

class CatRepository {
  BaseApiServices services = NetworkApiServices();

//Category Listing
  Future<dynamic> categories(dynamic data) async {
    try {
      var response = services.getPostApiResponse(
          Apiurl.categoriesListing, data, Globals.headerWithoutToken());

      return response;
    } catch (e) {
      throw FetchDataException(e.toString());
    }
  }

//SubCategories Using Category id
  Future<dynamic> subCategories(dynamic data) {
    try {
      var response = services.getPostApiResponse(
          Apiurl.subCategoriesListing, data, Globals.headerWithoutToken());
      return response;
    } catch (e) {
      throw FetchDataException(e.toString());
    }
  }

//Service Listing by SubCategory id
  Future<dynamic> service(dynamic data) async {
    try {
      var response = services.getPostApiResponse(
          Apiurl.serviceListingBySubCategory, data, Globals.header());
      return response;
    } catch (e) {
      throw FetchDataException(e.toString());
    }
  }
}
