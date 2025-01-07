import 'package:flutter/material.dart';
import 'package:mosoda/Resources/Components/button_widget.dart';
import 'package:mosoda/Resources/Components/text_form_field.dart';
import 'package:mosoda/Resources/Components/theme_data.dart';
import 'package:mosoda/View/Authorization/otp_screen.dart';

class SignUpPhoneScreen extends StatefulWidget {
  const SignUpPhoneScreen({super.key});

  @override
  State<SignUpPhoneScreen> createState() => _SignUpPhoneScreenState();
}

class _SignUpPhoneScreenState extends State<SignUpPhoneScreen> {
  var fullNameCont = TextEditingController();
  var passwordCont = TextEditingController();
  var phoneCont = TextEditingController();
  //bool _isObscured = true;

  @override
  Widget build(BuildContext context) {
    final screenHeight = MediaQuery.of(context).size.height;
    final screenWidth = MediaQuery.of(context).size.width;

    return Scaffold(
      body: Container(
        height: screenHeight,
        width: screenWidth,
        decoration: const BoxDecoration(
          color: Colors.white,
        ),
        child: Column(
          children: [
            // Top image container
            Container(
              height: screenHeight * 0.35,
              width: screenWidth,
              decoration: const BoxDecoration(
                image: DecorationImage(
                  image: AssetImage("assets/clip.png"),
                  fit: BoxFit.fill,
                ),
              ),
              child: Center(
                child: Image.asset("assets/logo.png"),
              ),
            ),
            const SizedBox(
              height: 5,
            ),
            // Form fields and next button
            Expanded(
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    TextformfieldWidget(
                      fillColor: Colors.blue[200],
                      textEditingController: fullNameCont,
                      hintText: "Full Name",
                    ),
                    TextformfieldWidget(
                      fillColor: Colors.blue[200],
                      textEditingController: phoneCont,
                      hintText: "Phone Number",
                    ),
                  ],
                ),
              ),
            ),
            const Spacer(),
            Padding(
              padding: const EdgeInsets.all(10.0),
              child: ButtonMain(
                buttonBorderColor: Colors.blue[200],
                buttonColor: AppTheme.buttonColor,
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) =>
                          const OTPScreen(varificationId: "kdjf"),
                    ),
                  );
                },
                textColor: Colors.white,
                child: const Text("Next"),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
