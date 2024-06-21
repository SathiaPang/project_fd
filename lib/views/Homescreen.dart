import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:project_fd/constants.dart';
import 'package:project_fd/views/Searchscreen.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          //backgroundColor: green, // AppBar
          ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "Find your",
              style: _commonstyle(),
            ),
            Text.rich(
              TextSpan(
                children: [
                  TextSpan(
                    text: 'Best Food',
                    style: _boldGreenstyle(),
                  ),
                  TextSpan(
                    text: ' here',
                    style: _commonstyle(),
                  ),
                ],
              ),
            ),
            SizedBox(height: 10),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                InkWell(
                  onTap: () {
                    Get.to(() => SearchScreen());
                  },
                  child: Container(
                    height: Get.height * 0.065,
                    width: Get.width * 0.76,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        SizedBox(width: 10),
                        Icon(
                          Icons.search,
                          color: textColor,
                        ),
                        SizedBox(width: 10),
                        Text(
                          "Search..",
                          style: TextStyle(color: textColor, fontSize: 15),
                        ),
                      ],
                    ),
                    decoration: BoxDecoration(
                      color: borderfield,
                      borderRadius: BorderRadius.circular(10),
                    ),
                  ),
                ),
                InkWell(
                  onTap: () {
                    Get.to(() => SearchScreen());
                  },
                  child: Container(
                    height: Get.height * 0.065,
                    width: Get.width * 0.15,
                    child: Icon(
                      Icons.density_medium_rounded,
                      color: white,
                      size: 30,
                    ),
                    decoration: BoxDecoration(
                      color: green,
                      shape: BoxShape.circle,
                    ),
                  ),
                )
              ],
            ),
          ],
        ),
      ), // Column
    ); // Scaffold
  }

  TextStyle _commonstyle() {
    return const TextStyle(
      fontWeight: FontWeight.w200,
      fontSize: 35,
      color: black,
    );
  }

  TextStyle _boldstyle() {
    return const TextStyle(
      fontWeight: FontWeight.bold,
      fontSize: 35,
      color: black,
    );
  }

  TextStyle _boldGreenstyle() {
    return const TextStyle(
      fontWeight: FontWeight.bold,
      fontSize: 35,
      color: green,
    );
  }
}
