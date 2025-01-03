import 'package:flutter/material.dart';
import 'package:mosoda/Utils/Routes/routes_name.dart';
import 'package:mosoda/View/Authorization/MainOnBoard.dart';
import 'package:mosoda/View/Authorization/OtpScreen.dart';
import 'package:mosoda/View/Authorization/RegisterWithPhone.dart';
import 'package:mosoda/View/Authorization/SignupByEmail.dart';
import 'package:mosoda/View/OtherScreens/AddLocation.dart';
import 'package:mosoda/View/OtherScreens/Dashboard.dart';
import 'package:mosoda/View/OtherScreens/Location.dart';
import 'package:mosoda/View/OtherScreens/ServiceScreen.dart';
import 'package:mosoda/View/OtherScreens/SubCategory.dart';

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
        return MaterialPageRoute(
            builder: (BuildContext context) => const Servicescreen());
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
