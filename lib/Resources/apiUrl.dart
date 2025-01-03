import 'package:mosoda/Globals.dart';

class Apiurl {
  static const baseUrl = "https://mosoda.logic-valley.com/api/";

  static const apiKey = "HY3hAgMk3IMktRDhOHYdZXSk3anBk3UR";
  static const placesApiKey = "AIzaSyAo1tx_kum39FZGBE1lbe1xvl2HdiQKrGI";
  static const signUpEmail = "${baseUrl}user/email-signup";
  static const loginEmail = "${baseUrl}user/login-email";
  static const signUpPhone = "${baseUrl}user/phone-signup";
  static const requestOtp = "${baseUrl}user/request-otp";
  static const verifyOtp = "${baseUrl}user/verify-otp";
  static const userLocationListing = "user/listing-location";
  static const createUserLocation = "user/create-location";
  static const setDefaultLocation = "user/default-location";
  static const updateLocation = "user/update-location";
  static const deleteLocation = "user/delete-location";
  static const categoriesListing = "${baseUrl}categories/listing";
  static const subCategoriesListing = "${baseUrl}subcategories/listing";
  static const subCategoriesByVendor = "vendors/subcategories_of_category";
  static const vendorsListingByCategories = "vendors/listing_by_categories";
  static const vendorsListingBySubCat = "vendors/listing_by_sub_categories";
  static const vendorsListingByService = "vendors/listing_by_services";
  static const vendorsListingAll = "vendors/listing";
  static const vendorsTimings = 'vendors/timings-by-date';
  static const servicesListing = "services/listing";
  static const serviceListingBySubCategory = "{$baseUrl}services/listing";
  static const servicesByVendorSubCat = "vendors/services_of_sub_category";
  static const subServicesByVendorService = "vendors/sub_services_of_service";
  static const orders = "user/orders";
  static const products = 'products/listing';
  static const servicesHome = 'home/home-listing';
  static const notificationListing = "notification/listing";
  static const userTokenExpire = 'user/token-expire';
  static const emailSignIn = '${baseUrl}user/email-signup-signin';
  static const homeListingUrl = 'classified/home-listing';
  static const subCategoriesFromVendorconst =
      "vendors/subcategories_of_category";
  static const servicesFromSubCategoryVendorconst =
      "vendors/services_of_sub_category";
  static const homeItemsconst = "home/home-items";
  static const orderAPIconst = "user/orders";
  static const subServicesFromServicesconst = "vendors/sub_services_of_service";
  static const subCategoriesFromCategoryconst = "subcategories/listing";
  static const servicesFromSubCategoryconst = "services/listing";
  static const vendorListingconst = "vendors/listing_by_sub_categories";
  static const vendorProductsBySubCategoriesconst = "products/listing";
  static const occasionTypesconst = "home/occasion-types";
  static const orderCheckconst = "user/order-check";
}
