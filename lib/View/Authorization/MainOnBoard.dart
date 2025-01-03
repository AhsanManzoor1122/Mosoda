import 'package:flutter/material.dart';
import 'package:mosoda/Globals.dart';
import 'package:mosoda/Resources/Components/Button.dart';
import 'package:mosoda/Resources/Components/Text.dart';
import 'package:mosoda/Resources/Components/TextFormField.dart';
import 'package:mosoda/Resources/Components/theme_data.dart';
import 'package:mosoda/Utils/Routes/routes_name.dart';
import 'package:mosoda/View/Authorization/RegisterWithPhone.dart';
import 'package:mosoda/View/Authorization/SignupByEmail.dart';
import 'package:mosoda/ViewModel/auth_view_model.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

class MainOnBoardingScreen extends StatefulWidget {
  const MainOnBoardingScreen({super.key});

  @override
  State<MainOnBoardingScreen> createState() => _MainOnBoardingScreenState();
}

class _MainOnBoardingScreenState extends State<MainOnBoardingScreen> {
  var emailController = TextEditingController();
  var passwordController = TextEditingController();
  bool isCheck = false;
  bool _obscureText = true;
  bool login = false;
  void _togglePasswordVisibility() {
    setState(() {
      _obscureText = !_obscureText;
    });
  }
  // @override
  // void setState(VoidCallback fn) {

  //   super.setState(fn);
  // }
  Future<void> getData() async {
    SharedPreferences pref = await SharedPreferences.getInstance();
    String? token = pref.getString("token");
    Globals.userId = pref.getInt('id');
    Globals.userToken = pref.getString("token") ?? "";
    Globals.username = pref.getString("name");
    Globals.userEmail = pref.getString("email");
    Globals.userPhone = pref.getString("phone");
    Globals.userPhoto = pref.getString("photo");
    String? userToken = pref.getString("token");
    if (userToken != null && userToken.isNotEmpty) {
      Navigator.pushReplacementNamed(context, RoutesName.dashboardScreen);
    }
    print("User Token is : " + token!);
  }

  @override
  void initState() {
    super.initState();
    getData();
  }

  @override
  Widget build(BuildContext context) {
    final screenHeight = MediaQuery.of(context).size.height;
    final screenWidth = MediaQuery.of(context).size.width;
    final avm = Provider.of<AuthViewModel>(context);
    return Scaffold(
      backgroundColor: AppTheme.backgroundColor,
      body: SingleChildScrollView(
        child: Container(
          width: screenWidth,
          //color: Colors.white,
          child: Column(
            children: [
              // Top banner image
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

              // Form fields and content area
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16.0),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    // Email field
                    TextformfieldWidget(
                      prefixIcon: IconButton(
                        onPressed: () {},
                        icon: const Icon(Icons.email),
                      ),
                      textEditingController: emailController,
                      hintText: "Enter your Email",
                      fillColor: AppTheme.fillColor,
                    ),

                    // Password field
                    TextformfieldWidget(
                      fillColor: AppTheme.fillColor,
                      prefixIcon: IconButton(
                        onPressed: () {},
                        icon: const Icon(Icons.key),
                      ),
                      obsecure: _obscureText,
                      textEditingController: passwordController,
                      hintText: "Password",
                      iconButton: IconButton(
                        icon: Icon(
                          _obscureText
                              ? Icons.visibility
                              : Icons.visibility_off,
                        ),
                        onPressed: _togglePasswordVisibility,
                      ),
                    ),

                    // Remember me checkbox
                    Row(
                      children: [
                        Checkbox(
                          checkColor: AppTheme.fillColor,
                          fillColor: MaterialStateProperty.all(Colors.white),
                          value: isCheck,
                          onChanged: (bool? value) {
                            setState(() {
                              isCheck = value!;
                            });
                          },
                        ),
                        const TextWidget(text: "Remember me"),
                      ],
                    ),

                    // Login Button
                    ButtonMain(
                      buttonBorderColor: AppTheme.fillColor,
                      buttonColor: AppTheme.buttonColor,
                      onTap: () {
                        setState(() {
                          login = true;
                        });
                        var data = {
                          'email': emailController.text,
                          'password': passwordController.text
                        };
                        avm.loginEmail(data, context).then((_) {
                          setState(() {
                            login = false;
                          });
                        }).catchError((_) {
                          setState(() {
                            login = false;
                          });
                        });
                      },
                      textColor: Colors.white,
                      child: login == false
                          ? const Text("Login")
                          : const CircularProgressIndicator(
                              color: Colors.white,
                            ),
                    ),

                    // Register prompt
                    const Text("If you don't have an account, register now"),

                    // Signup buttons
                    ButtonMain(
                      buttonBorderColor: AppTheme.fillColor,
                      buttonColor: AppTheme.buttonColor,
                      icon: const Icon(
                        Icons.email_outlined,
                        color: Colors.white,
                      ),
                      onTap: () {
                        Navigator.pushNamed(context, RoutesName.signupScreen);
                      },
                      textColor: Colors.white,
                      child: const Text("Sign Up"),
                    ),
                    ButtonMain(
                      buttonBorderColor: Colors.blue[200],
                      buttonColor: AppTheme.buttonColor,
                      icon: const Icon(
                        Icons.phone_android,
                        color: Colors.white,
                      ),
                      onTap: () {
                        Navigator.pushNamed(
                            context, RoutesName.phoneRegisterScreen);
                      },
                      textColor: Colors.white,
                      child: const Text(
                        "Register With Phone",
                        style: TextStyle(color: Colors.white),
                      ),
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
