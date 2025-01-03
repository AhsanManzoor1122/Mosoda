import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:another_flushbar/flushbar.dart';

class Utils {
  void showToastMessage(String message, Color color, ToastGravity gravity) {
    Fluttertoast.showToast(
        msg: message,
        timeInSecForIosWeb: 1,
        fontSize: 15,
        backgroundColor: color,
        gravity: gravity);
  }

  void showFlushbarWithTitle(
      BuildContext context, String message, Color bgColor) {
    Flushbar(
      animationDuration: const Duration(seconds: 2),
      flushbarPosition: FlushbarPosition.TOP,
      messageText: Text(
        message,
        style: const TextStyle(color: Colors.white),
      ),
      backgroundColor: bgColor,
      icon: Icon(
        bgColor == Colors.green ? Icons.check_circle : Icons.error,
        color: Colors.white,
        size: 30.0,
      ),
      duration: const Duration(seconds: 3),
    ).show(context);
  }
}
