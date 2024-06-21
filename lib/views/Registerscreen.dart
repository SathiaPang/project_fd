import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:project_fd/constants.dart';
import 'package:project_fd/views/Homescreen.dart';

class RegisterScreen extends StatefulWidget {
  const RegisterScreen({super.key});

  @override
  State<RegisterScreen> createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  bool _isChecked = false;

  void onSignUpTapped() {
    print("you to fuch me");
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Sign up",
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
                "Register",
                style: TextStyle(
                    fontSize: 30, color: green, fontWeight: FontWeight.w500),
              ),
              SizedBox(height: 5),
              Text(
                "Create your new account.",
                style: TextStyle(
                    fontSize: 20,
                    color: textColor,
                    fontWeight: FontWeight.w400),
              ),
              SizedBox(height: 60),
              textfield("Full Name"),
              SizedBox(height: 20),
              textfield("Email or Phone Number"),
              SizedBox(height: 20),
              textfield("Password"),
              SizedBox(height: 20),
              textfield("Confirm Password"),
              SizedBox(height: 15),
              policy_check(),
              SizedBox(height: 15),
              Button(),
              SizedBox(height: 15),
              bottom_text(),
            ],
          ),
        ),
      ),
    );
  }

  RichText bottom_text() {
    return RichText(
      text: TextSpan(
        style: TextStyle(fontWeight: FontWeight.w300),
        children: <TextSpan>[
          TextSpan(
            text: "Already have an account, ",
            style: TextStyle(color: Colors.black),
          ),
          TextSpan(
              text: "Login here !!",
              style: TextStyle(fontWeight: FontWeight.bold, color: green),
              recognizer: TapGestureRecognizer()..onTap = onSignUpTapped),
        ],
      ),
    );
  }

  CheckboxListTile policy_check() {
    return CheckboxListTile(
      dense: true,
      contentPadding: EdgeInsets.zero,
      title: Container(
        width: Get.width,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                Text(
                  '  I agree to your',
                  style: TextStyle(color: Colors.grey),
                ),
                Text(
                  ' privacy policy',
                  style: TextStyle(color: green),
                ),
                Text(
                  '  and',
                  style: TextStyle(color: Colors.grey),
                ),
              ],
            ),
            Text(
              '  term & conditions',
              style: TextStyle(color: green),
            ),
          ],
        ),
      ),
      value: _isChecked,
      onChanged: (newValue) {
        setState(() {
          _isChecked = newValue ?? false;
        });
      },
      controlAffinity: ListTileControlAffinity.leading,
      activeColor: green,
    );
  }
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
        Get.to(() => HomeScreen());
      },
      child: Container(
        height: Get.height * 0.06,
        child: Center(
          child: Text(
            "Sign up",
            style: TextStyle(color: white, fontSize: 20),
          ),
        ),
      ),
    );
  }
}
