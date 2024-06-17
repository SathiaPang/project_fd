import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:project_fd/views/order_history/HistoryListScreen.dart';

import '../../constants.dart';

class OrderSuccessScreen extends StatelessWidget {
  const OrderSuccessScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: green,
      body: Padding(
        padding: const EdgeInsets.all(24.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Icon(
                  Icons.local_pizza_outlined,
                  color: white,
                ),
                Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Text(
                    "App Name",
                    style: TextStyle(color: white),
                  ),
                )
              ],
            ),
            Expanded(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    "Order Successfully",
                    style: TextStyle(
                        fontSize: 20,
                        color: white,
                        fontWeight: FontWeight.bold),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(36.0),
                    child: Icon(
                      Icons.check_circle_rounded,
                      size: 120,
                      color: white,
                    ),
                  ),
                ],
              ),
            ),
            Text(
              "Your order will be arrived soon",
              style: TextStyle(color: white),
            ),
            Container(
              width: double.infinity,
              padding: EdgeInsets.all(16),
              child: FilledButton(
                style: ButtonStyle(
                  backgroundColor: MaterialStatePropertyAll(white),
                  shape: MaterialStatePropertyAll(
                    RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(16),
                    ),
                  ),
                ),
                onPressed: () {
                  Get.to(HistoryListScreen());
                },
                child: Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Text(
                    "Done",
                    style: TextStyle(color: green, fontWeight: FontWeight.bold),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
