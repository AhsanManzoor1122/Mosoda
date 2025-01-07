import 'package:flutter/material.dart';
import 'package:mosoda/globals.dart';
import 'package:mosoda/Repository/auth_repository.dart';
import 'package:mosoda/Utils/Routes/routes_name.dart';
import 'package:mosoda/Utils/utils.dart';
import 'package:shared_preferences/shared_preferences.dart';

class AuthViewModel with ChangeNotifier {
  final repo = AuthRepository();

  Future<void> signUpEmail(dynamic data, BuildContext context) async {
    try {
      final result = await repo.signUpEmail(data); // Await the async call
      var user = result['data'];

      // Save user data to SharedPreferences
      await saveUserData(user['token'], user['id'], user['name'], user['email'],
          user['phone'], user['photo']);

      // Get updated user data and store it in Globals
      await getData();

      if (context.mounted) {
        Utils().showFlushbarWithTitle(
          context,
          result['message'].toString(),
          Colors.green,
        );

        await Future.delayed(const Duration(seconds: 2));
        if (context.mounted) {
          Navigator.pushNamed(context, RoutesName.dashboardScreen);
        }
      }
    } catch (error) {
      if (context.mounted) {
        Utils().showFlushbarWithTitle(
          context,
          error.toString(),
          Colors.red,
        );
      }
    }
  }

  Future<void> loginEmail(dynamic data, BuildContext context) async {
    try {
      final result = await repo.loginEmail(data);
      //Get Json Data
      final userData = result['data'];
      final user = userData['user'];
      //Save User Data to Shared Preferences
      await saveUserData(userData['token'], user['id'], user['name'],
          user['email'], user['phone'], user['photo']);
      //Get User Data from Shared Preferences
      await getData();
      if (context.mounted) {
        Utils().showFlushbarWithTitle(
          context,
          result['message'].toString(),
          Colors.green,
        );

        await Future.delayed(const Duration(seconds: 2));
        if (context.mounted) {
          Navigator.pushNamed(context, RoutesName.dashboardScreen);
        }
      }
    } catch (e) {
      if (context.mounted) {
        Utils().showFlushbarWithTitle(context, e.toString(), Colors.red);
      }
      throw e.toString();
    }
  }

  Future<void> saveUserData(
    String? token,
    int? id,
    String? name,
    String? email,
    String? phone,
    String? photo,
  ) async {
    SharedPreferences pref = await SharedPreferences.getInstance();
    pref.setString('token', token ?? "");
    pref.setString('name', name ?? "");
    pref.setString('email', email ?? "");
    pref.setInt('id', id ?? 0);
    pref.setString('photo', photo ?? "");
    pref.setString('phone', phone ?? "");
  }

  Future<void> getData() async {
    SharedPreferences pref = await SharedPreferences.getInstance();

    Globals.userId = pref.getInt('id');
    Globals.userToken = pref.getString("token") ?? "";
    Globals.username = pref.getString("name");
    Globals.userEmail = pref.getString("email");
    Globals.userPhone = pref.getString("phone");
    Globals.userPhoto = pref.getString("photo");
  }
}
