import 'package:flutter/material.dart';
import 'package:mosoda/Resources/Components/button_widget.dart';
import 'package:mosoda/Resources/Components/text_form_field.dart';
import 'package:mosoda/Resources/Components/theme_data.dart';
import 'package:mosoda/Utils/Routes/routes_name.dart';
import 'package:mosoda/ViewModel/auth_view_model.dart';
import 'package:provider/provider.dart';

class SignUpEmailScreen extends StatefulWidget {
  const SignUpEmailScreen({super.key});

  @override
  State<SignUpEmailScreen> createState() => _SignUpEmailScreenState();
}

class _SignUpEmailScreenState extends State<SignUpEmailScreen> {
  var fullNameCont = TextEditingController();
  var emailCont = TextEditingController();
  var passwordCont = TextEditingController();
  //final bool _isObscured = true;
  bool isChecked = false;
  bool? signUp;

  @override
  void initState() {
    super.initState();
    signUp = true;
  }

  @override
  Widget build(BuildContext context) {
    final screenHeight = MediaQuery.of(context).size.height;
    final screenWidth = MediaQuery.of(context).size.width;
    var avm = Provider.of<AuthViewModel>(context);
    return Scaffold(
      body: SingleChildScrollView(
        child: Container(
          height: screenHeight,
          width: screenWidth,
          decoration: const BoxDecoration(
            color: Colors.white,
          ),
          child: Column(
            children: [
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
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 8.0),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    SizedBox(height: screenHeight * 0.1),
                    // Full Name field
                    TextformfieldWidget(
                      fillColor: Colors.blue[200],
                      textEditingController: fullNameCont,
                      hintText: "Full Name",
                    ),

                    // Email field
                    TextformfieldWidget(
                      fillColor: Colors.blue[200],
                      textEditingController: emailCont,
                      hintText: "Email",
                    ),

                    // Password field
                    TextformfieldWidget(
                      fillColor: Colors.blue[200],
                      textEditingController: passwordCont,
                      hintText: "Password",
                    ),
                    Row(
                      children: [
                        Checkbox(
                            value: isChecked,
                            onChanged: (bool? value) {
                              setState(() {
                                isChecked = value!;
                              });
                            }),
                        const Text("Agree to terms & Conditions"),
                      ],
                    ),
                    SizedBox(
                        height: screenHeight *
                            0.03), // Space between fields and button

                    // Sign Up Button
                    Padding(
                      padding: const EdgeInsets.all(2.0),
                      child: ButtonMain(
                        buttonBorderColor: AppTheme.fillColor,
                        buttonColor: AppTheme.buttonColor,
                        onTap: () {
                          setState(() {
                            signUp = false;
                          });
                          var formData = {
                            'name': fullNameCont.text,
                            'email': emailCont.text,
                            'password': passwordCont.text
                          };
                          avm.signUpEmail(formData, context);
                        },
                        textColor: Colors.white,
                        child: signUp == false
                            ? const CircularProgressIndicator(
                                color: Colors.white,
                              )
                            : const Text("Sign Up"),
                      ),
                    ),
                    InkWell(
                      onTap: () {
                        Navigator.pushNamed(
                            context, RoutesName.mainOnBoardingScreen);
                      },
                      child: const Text("Already have an account . Sign In",
                          style: TextStyle(color: AppTheme.buttonColor)),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
