import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:project_fd/constants.dart';
import 'package:project_fd/views/Registerscreen.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  void OnSignInTapped() {
    Get.to(RegisterScreen());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Sign in",
          style: TextStyle(fontSize: 16, color: textColor),
        ),
      ),
      body: Center(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              SizedBox(height: 40),
              Text(
                "Welcome Back",
                style: TextStyle(
                    fontSize: 30, color: green, fontWeight: FontWeight.w500),
              ),
              SizedBox(height: 5),
              Text(
                "Login to your account",
                style: TextStyle(
                    fontSize: 20,
                    color: textColor,
                    fontWeight: FontWeight.w400),
              ),
              SizedBox(height: 60),
              textfield("Email or Phone"),
              SizedBox(height: 20),
              textfield("Password"),
              SizedBox(height: 5),
              Forgot_password(),
              SizedBox(height: 50),
              Button(),
              SizedBox(height: 20),
              RichText(
                text: TextSpan(
                  style: TextStyle(fontWeight: FontWeight.w300),
                  children: <TextSpan>[
                    TextSpan(
                      text: "Don't have an account, ",
                      style: TextStyle(color: Colors.black),
                    ),
                    TextSpan(
                        text: "Sign Up !!",
                        style: TextStyle(
                            fontWeight: FontWeight.bold, color: green),
                        recognizer: TapGestureRecognizer()
                          ..onTap = OnSignInTapped),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Container textfield(String text) {
    return Container(
      alignment: Alignment.centerLeft,
      padding: EdgeInsets.symmetric(horizontal: 15),
      height: Get.height * 0.06,
      width: Get.width * 0.9,
      child: Text(
        text,
        style: TextStyle(color: textColor),
      ),
      decoration: BoxDecoration(
        color: borderfield,
        borderRadius: BorderRadius.circular(10),
      ),
    );
  }
}

class Button extends StatelessWidget {
  const Button({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      style: ElevatedButton.styleFrom(
        backgroundColor: green,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10),
        ),
      ),
      onPressed: () {
        print("Hello there");
      },
      child: Container(
        height: Get.height * 0.06,
        child: Center(
          child: Text(
            "Login",
            style: TextStyle(color: white, fontSize: 20),
          ),
        ),
      ),
    );
  }
}

class Forgot_password extends StatelessWidget {
  const Forgot_password({
    super.key,
  });
  @override
  Widget build(BuildContext context) {
    return Container(
      width: Get.width * 1,
      alignment: Alignment.centerRight,
      child: Text(
        "Forgot Password?",
        style: TextStyle(color: green, fontWeight: FontWeight.w700),
      ),
    );
  }
}
