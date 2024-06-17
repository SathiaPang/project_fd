import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:project_fd/constants.dart';
import 'package:project_fd/models/BankAccount.dart';
import 'package:project_fd/models/Order.dart';
import 'package:project_fd/views/Homescreen.dart';
import 'package:project_fd/views/confirm_order/Component.dart';
import 'package:project_fd/views/confirm_order/OrderSuccessScreen.dart';

class ConfirmOrderScreen extends StatefulWidget {
  ConfirmOrderScreen({
    super.key,
    this.bank = const BankAccount(),
    this.address = "My address, Phnom Penh, ...",
    this.orders = const [
      Order(name: "Hamburger", price: 10.0, amount: 2),
      Order(name: "Pizza", price: 20.0, amount: 1),
      Order(name: "Ice cream", price: 5.0, amount: 3),
    ],
  }) : subtotal = orders.fold(0, (prev, cur) => cur.price + prev);

  final BankAccount bank;
  final String address;
  final List<Order> orders;

  final double deliveryFee = 5;
  final double vat = 5;
  final double subtotal;

  @override
  State<ConfirmOrderScreen> createState() => _ConfirmOrderScreenState();
}

class _ConfirmOrderScreenState extends State<ConfirmOrderScreen> {
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
        title: Text("Checkout"),
      ),
      body: Stack(children: [
        SingleChildScrollView(
          child: Container(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                TextTitle("Delivery Address"),
                ListTile(
                  shape: RoundedRectangleBorder(
                      side: BorderSide(color: green, width: 2),
                      borderRadius: BorderRadius.circular(16)),
                  leading: Icon(
                    Icons.location_on_outlined,
                    color: green,
                  ),
                  title: Text(widget.address),
                  trailing: IconButton(
                    icon: Icon(Icons.arrow_forward_ios_rounded),
                    onPressed: () => Get.to(HomeScreen()),
                    color: green,
                  ),
                ),
                SizedBox(height: 16),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    TextTitle("Payment Method"),
                    IconButton(
                      onPressed: () => Get.to(HomeScreen()),
                      icon: Icon(Icons.edit),
                      color: green,
                    ),
                  ],
                ),
                ListTile(
                  shape: RoundedRectangleBorder(
                      side: BorderSide(color: green, width: 2),
                      borderRadius: BorderRadius.circular(16)),
                  leading: SizedBox(
                    width: 24,
                    height: 24,
                    child: Image.network(widget.bank.bankImage),
                  ),
                  title: Column(
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
                  trailing: Text(
                    "\$${total.toStringAsFixed(2)}",
                    style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold),
                  ),
                ),
                SizedBox(height: 16),
                TextTitle("Order Summary"),
                ...widget.orders.map((item) => ListTitleText(
                      "${item.amount} x ${item.name}",
                      trailing: "\$${item.price.toStringAsFixed(2)}",
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
                SizedBox(height: 200),
              ],
            ),
          ),
        ),
        Align(
          alignment: Alignment.bottomCenter,
          child: Card(
            elevation: 10,
            color: white,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.vertical(top: Radius.circular(16)),
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
                            style: TextStyle(fontWeight: FontWeight.bold)),
                        Text(" (inc VAT)", style: TextStyle(fontSize: 12)),
                      ],
                    ),
                    trailing: Text(
                      "\$${total.toStringAsFixed(2)}",
                      style:
                          TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                    ),
                  ),
                  Container(
                    width: double.infinity,
                    padding: EdgeInsets.all(16),
                    child: FilledButton(
                      style: ButtonStyle(
                        backgroundColor: MaterialStatePropertyAll(green),
                        shape: MaterialStatePropertyAll(
                          RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(16),
                          ),
                        ),
                      ),
                      onPressed: () {
                        showDialog(
                          context: context,
                          builder: (context) {
                            return AlertDialog(
                              title: Text("Confirm Order"),
                              content: Text(
                                  "Are you sure you want to submit this order?"),
                              actions: [
                                TextButton(
                                    onPressed: () {
                                      Get.back();
                                    },
                                    child: Text("Cancel")),
                                TextButton(
                                    onPressed: () {
                                      Get.to(OrderSuccessScreen());
                                    },
                                    child: Text("OK")),
                              ],
                            );
                          },
                        );
                      },
                      child: Padding(
                        padding: const EdgeInsets.all(16.0),
                        child: Text("Order now"),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        )
      ]),
    );
  }
}
