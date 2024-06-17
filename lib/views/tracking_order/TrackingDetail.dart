import 'package:flutter/material.dart';

import '../../constants.dart';

class TrackingDetailContainer extends StatelessWidget {
  const TrackingDetailContainer(
      {super.key, this.orderId, this.myAddress, this.estimatedMinute});

  final String? myAddress;
  final int? orderId;
  final int? estimatedMinute;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(16),
      decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.all(Radius.circular(16))),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.only(left: 8.0),
            child: Text(
              (orderId != null) ? "Order #${orderId}" : "Order #334343",
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
              ),
              textAlign: TextAlign.start,
            ),
          ),
          Card(
            color: green,
            child: Column(
              children: [
                ListTile(
                  leading: Icon(Icons.my_location_outlined),
                  title: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "Delivery Address",
                        style: TextStyle(fontSize: 12),
                      ),
                      Text(
                          (myAddress != null)
                              ? myAddress!
                              : "My Address, Phnom Penh ...",
                          style: TextStyle(
                              fontSize: 14, fontWeight: FontWeight.bold)),
                    ],
                  ),
                  textColor: Colors.white,
                  iconColor: Colors.white,
                ),
                ListTile(
                  leading: Icon(Icons.timer),
                  title: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "Estimate Time",
                        style: TextStyle(fontSize: 12),
                      ),
                      Text(
                          (estimatedMinute != null)
                              ? (estimatedMinute == 0)
                                  ? "Delivered"
                                  : "${estimatedMinute!} - ${estimatedMinute! + 10} Minutes"
                              : "Picking",
                          style: TextStyle(
                              fontSize: 14, fontWeight: FontWeight.bold)),
                    ],
                  ),
                  textColor: Colors.white,
                  iconColor: Colors.white,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
