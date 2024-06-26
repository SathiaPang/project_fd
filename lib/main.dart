import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:project_fd/views/Homescreen.dart';
//import 'package:project_fd/views/confirm_order/ConfirmOrderScreen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      home: HomeScreen(),
    );
  }
}
