import 'package:flutter/material.dart';

import 'package:fluttertoast/fluttertoast.dart';
import 'package:mosoda/Resources/Components/Button.dart';
import 'package:mosoda/Resources/Components/theme_data.dart';

class OTPScreen extends StatefulWidget {
  final String varificationId;
  const OTPScreen({super.key, required this.varificationId});

  @override
  // ignore: library_private_types_in_public_api
  _OTPScreenState createState() => _OTPScreenState();
}

class _OTPScreenState extends State<OTPScreen> {
  final _otpControllers = List.generate(6, (_) => TextEditingController());
  //final String correctOTP = '1234';

  @override
  void initState() {
    super.initState();
    // EasyLoading.init();
    // EasyLoading.show(status: 'Processing...');

    // Future.delayed(const Duration(seconds: 3), () {
    //   for (int i = 0; i < correctOTP.length; i++) {
    //     _otpControllers[i].text = correctOTP[i];
    //   }
    //   EasyLoading.dismiss();
    // });
  }

  // Future<void> _verifyOTP() async {
  //   EasyLoading.show(status: 'Verifying...');
  //   Future.delayed(Duration(seconds: 3), () {
  //     EasyLoading.dismiss();
  //     int enteredOTP = int.parse(_otpControllers.map((e) => e.text).join());
  //     _userData = Apihandler.verifyOTP(
  //         widget.code, widget.deviceName, widget.emailOrPhone, widget.PhoneNo);

  //     if (widget.code == enteredOTP) {
  //       ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
  //         content: Text(
  //           "OTP Verified Successfully",
  //           style: TextStyle(color: Colors.green),
  //         ),
  //       ));
  //       Navigator.push(context,
  //           MaterialPageRoute(builder: (context) => DashboardScreen()));
  //     } else {
  //       ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
  //         content: Text(
  //           'Invalid OTP! Please try again.',
  //           style: TextStyle(color: Colors.red),
  //         ),
  //       ));
  //     }
  //   });
  // }

  @override
  void dispose() {
    for (var controller in _otpControllers) {
      controller.dispose();
    }
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final screenHeight = MediaQuery.of(context).size.height;
    final screenWidth = MediaQuery.of(context).size.width;

    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        title: const Text('Verify OTP'),
      ),
      body: Stack(
        children: [
          // Positioned(
          //   top: screenHeight * 0.05,
          //   left: screenWidth * 0.25,
          //   right: screenWidth * 0.25,
          //   child: Container(
          //     height: screenHeight * 0.2,
          //     decoration: const BoxDecoration(
          //       image: DecorationImage(
          //         image: AssetImage("assets/barber.png"),
          //         fit: BoxFit.contain,
          //       ),
          //     ),
          //   ),
          // ),
          Positioned(
            top: screenHeight * 0.3,
            left: screenWidth * 0.1,
            right: screenWidth * 0.1,
            child: const Text(
              'Enter the 6-digit OTP sent to your email.',
              textAlign: TextAlign.center,
              style: TextStyle(fontSize: 16),
            ),
          ),
          Positioned(
            top: screenHeight * 0.4,
            left: screenWidth * 0.02,
            right: screenWidth * 0.02,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: List.generate(6, (index) {
                return SizedBox(
                  width: screenWidth * 0.15,
                  child: TextFormField(
                      controller: _otpControllers[index],
                      keyboardType: TextInputType.number,
                      textAlign: TextAlign.center,
                      maxLength: 1,
                      decoration: InputDecoration(
                        counterText: '',
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10.0),
                        ),
                      ),
                      onChanged: (value) {
                        if (value.length == 1 &&
                            index < _otpControllers.length - 1) {
                          FocusScope.of(context).nextFocus();
                        } else if (value.isEmpty && index > 0) {
                          FocusScope.of(context).previousFocus();
                        }
                      }),
                );
              }),
            ),
          ),
          Positioned(
            bottom: screenHeight * 0.1,
            left: screenWidth * 0.02,
            right: screenWidth * 0.02,
            child: ButtonMain(
              buttonBorderColor: AppTheme.fillColor,
              buttonColor: AppTheme.buttonColor,
              onTap: () async {
                //+923369730204
              },
              textColor: Colors.white,
              child: const Text("Submit OTP"),
            ),
          ),
        ],
      ),
    );
  }
}
