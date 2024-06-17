import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:project_fd/models/BankAccount.dart';
import 'package:project_fd/models/History.dart';
import 'package:project_fd/utils/DateExt.dart';
import 'package:project_fd/views/tracking_order/TrackingOrderScreen.dart';

import '../../constants.dart';
import '../../models/Order.dart';
import '../confirm_order/Component.dart';

class HistoryDetailScreen extends StatefulWidget {
  HistoryDetailScreen({
    super.key,
    this.bank = const BankAccount(),
    this.address = "My address, Phnom Penh, ...",
    this.orders = const [
      Order(name: "Hamburger", price: 10.0, amount: 2),
      Order(name: "Pizza", price: 20.0, amount: 1),
      Order(name: "Ice cream", price: 5.0, amount: 3),
    ],
  })  : subtotal = orders.fold(0, (prev, cur) => cur.price + prev),
        history = History(
            id: 111116, date: DateTime.now(), total: 20.5, orders: orders);

  final History history;
  final BankAccount bank;
  final String address;
  final List<Order> orders;

  final double deliveryFee = 5;
  final double vat = 5;
  final double subtotal;

  @override
  State<HistoryDetailScreen> createState() => _HistoryDetailScreenState();
}

class _HistoryDetailScreenState extends State<HistoryDetailScreen> {
  @override
  Widget build(BuildContext context) {
    double total = widget.deliveryFee + widget.vat + widget.subtotal;

    return Scaffold(
      appBar: AppBar(
        backgroundColor: green,
        foregroundColor: white,
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          onPressed: () => Get.back(),
        ),
        title: Text("Order Detail"),
      ),
      body: Stack(children: [
        SingleChildScrollView(
          child: Container(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Align(
                  alignment: Alignment.center,
                  child: Padding(
                    padding: const EdgeInsets.all(36.0),
                    child: Text(
                      "Order #${widget.history.id}",
                      style:
                          TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                    ),
                  ),
                ),
                ListTitleText(
                  "Customer Phone",
                  trailing: "012 345 678",
                  padding: EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                ),
                ListTitleText(
                  "Date",
                  trailing: "${widget.history.date.display()}",
                  padding: EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                ),
                ListTitleText(
                  "Delivery Address",
                  trailing: "${widget.address}",
                  padding: EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                ),
                SizedBox(height: 16),
                ListTile(
                  tileColor: green,
                  iconColor: white,
                  textColor: white,
                  onTap: () => Get.to(TrackingOrderScreen()),
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(16)),
                  leading: Icon(
                    Icons.location_on_outlined,
                  ),
                  title: Text("Track Delivery"),
                  trailing: IconButton(
                    icon: Icon(
                      Icons.arrow_forward_ios_rounded,
                      color: white,
                    ),
                    onPressed: null,
                  ),
                ),
                TextTitle("Order Summary"),
                ...widget.orders.map((item) => ListTitleText(
                      "${item.name} (x${item.amount})",
                      trailing: "\$${item.price.toStringAsFixed(2)}",
                      leading: SizedBox.square(
                        dimension: 30,
                        child: Icon(Icons.local_pizza),
                      ),
                    )),
                Divider(height: 16),
                ListTitleText(
                  "Sub total",
                  trailing: "\$${widget.subtotal.toStringAsFixed(2)}",
                  color: Colors.black.withOpacity(.6),
                  padding: EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                ),
                ListTitleText(
                  "Standard Delivery",
                  trailing: "\$${widget.deliveryFee.toStringAsFixed(2)}",
                  color: Colors.black.withOpacity(.6),
                  padding: EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                ),
                ListTitleText(
                  "VAT",
                  trailing: "\$${widget.vat.toStringAsFixed(2)}",
                  color: Colors.black.withOpacity(.6),
                  padding: EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                ),
                Divider(height: 16),
                SizedBox(height: 16),
                Card(
                  elevation: 10,
                  color: green,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(16),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.only(bottom: 24.0, top: 8),
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        ListTile(
                          title: Row(
                            children: [
                              Text("Total ",
                                  style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      color: white)),
                              Text(" (inc VAT)",
                                  style: TextStyle(fontSize: 12, color: white)),
                            ],
                          ),
                          trailing: Text(
                            "\$${total.toStringAsFixed(2)}",
                            style: TextStyle(
                                fontSize: 18,
                                fontWeight: FontWeight.bold,
                                color: white),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                SizedBox(height: 16),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    TextTitle("Payment Method"),
                    Container(
                      padding: EdgeInsets.all(16),
                      decoration: BoxDecoration(
                        border: Border.all(color: green, width: 2),
                        borderRadius: BorderRadius.circular(16),
                      ),
                      child: Row(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          SizedBox(
                            width: 30,
                            height: 30,
                            child: Image.network(widget.bank.bankImage),
                          ),
                          SizedBox(width: 16),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                widget.bank.accountName,
                                style: TextStyle(fontSize: 14),
                              ),
                              Text(
                                "*** *** " +
                                    widget.bank.accountNumber.substring(
                                        widget.bank.accountNumber.length - 3),
                                style: TextStyle(fontSize: 12),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 100),
              ],
            ),
          ),
        ),
      ]),
    );
  }
}
