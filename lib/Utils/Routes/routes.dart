import 'package:flutter/material.dart';
import 'package:mosoda/Utils/Routes/routes_name.dart';
import 'package:mosoda/View/Authorization/main_on_boarding_Screen.dart';

import 'package:mosoda/View/Authorization/otp_screen.dart';
import 'package:mosoda/View/Authorization/phone_register_screen.dart';
import 'package:mosoda/View/Authorization/signup_email_screen.dart';

import 'package:mosoda/View/OtherScreens/Location.dart';

import 'package:mosoda/View/OtherScreens/SubCategory.dart';
import 'package:mosoda/View/OtherScreens/add_location_screen.dart';
import 'package:mosoda/View/OtherScreens/dashboard_screen.dart';
import 'package:mosoda/View/OtherScreens/service_screen.dart';

class Routes {
  static Route<dynamic> generateRoute(RouteSettings setting) {
    //final argume = setting.arguments;
    switch (setting.name) {
      case RoutesName.mainOnBoardingScreen:
        return MaterialPageRoute(
            builder: (BuildContext context) => const MainOnBoardingScreen());
      case RoutesName.signupScreen:
        return MaterialPageRoute(
            builder: (BuildContext context) => const SignUpEmailScreen());
      case RoutesName.phoneRegisterScreen:
        return MaterialPageRoute(
            builder: (BuildContext context) => const SignUpPhoneScreen());
      case RoutesName.otpScreen:
        return MaterialPageRoute(
            builder: (BuildContext context) => const OTPScreen(
                  varificationId: "",
                ));
      case RoutesName.dashboardScreen:
        return MaterialPageRoute(
            builder: (BuildContext context) => DashboardScreen());
      case RoutesName.addlocation:
        return MaterialPageRoute(
            builder: (BuildContext context) => AddLocationScreen());
      case RoutesName.location:
        return MaterialPageRoute(
            builder: (BuildContext context) => const LocationScreen());
      case RoutesName.subCategory:
        final arguments = setting.arguments as Map<String, dynamic>;
        final catid = arguments['catId'];
        return MaterialPageRoute(
            builder: (BuildContext context) => Subcategoryscreen(catid: catid));
      case RoutesName.service:
        final argument = setting.arguments as Map<String, dynamic>;
        final sub_cat_id = argument['subCatId'];
        return MaterialPageRoute(
            builder: (BuildContext context) =>
                Servicescreen(subCatId: sub_cat_id));
      default:
        return MaterialPageRoute(builder: (_) {
          return const Scaffold(
            body: Center(
              child: Text("No Route Defined"),
            ),
          );
        });
    }
  }
}
