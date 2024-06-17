import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:project_fd/constants.dart';
import 'package:project_fd/models/History.dart';
import 'package:project_fd/utils/DateExt.dart';
import 'package:project_fd/views/order_history/HistoryDetailScreen.dart';

class HistoryListScreen extends StatefulWidget {
  HistoryListScreen({super.key});

  final histories = [
    History(
      id: 111116,
      date: DateTime.now(),
      total: 20.5,
    ),
    History(
      id: 111115,
      date: DateTime.parse('2024-06-15 13:27:00'),
      total: 2.8,
    ),
    History(
      id: 111114,
      date: DateTime.parse('2024-06-10 13:27:00'),
      total: 12.12,
    ),
    History(
      id: 111113,
      date: DateTime.parse('2024-06-04 13:27:00'),
      total: 22.2,
    ),
    History(
      id: 111112,
      date: DateTime.parse('2024-05-29 13:27:00'),
      total: 10.5,
    ),
    History(
      id: 111111,
      date: DateTime.parse('2024-05-27 13:27:00'),
      total: 25.5,
    ),
  ];
  @override
  State<HistoryListScreen> createState() => _HistoryListScreenState();
}

class _HistoryListScreenState extends State<HistoryListScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: green,
        foregroundColor: white,
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          onPressed: () => Get.back(),
        ),
        title: Text("History"),
      ),
      // bottomNavigationBar: BottomNavigationBar(items: []),
      body: ListView.builder(
        itemCount: widget.histories.length,
        itemBuilder: (context, idx) {
          return Column(
            children: [
              (idx == 0 ||
                      (widget.histories[idx - 1].date.month !=
                          widget.histories[idx].date.month))
                  ? Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Padding(
                          padding: const EdgeInsets.all(16.0),
                          child: Text(
                            widget.histories[idx].date
                                .display(format: "MMMM yyyy"),
                            style: TextStyle(
                                fontSize: 18,
                                fontWeight: FontWeight.bold,
                                color: green),
                          ),
                        ),
                        Divider(
                          height: 1,
                        )
                      ],
                    )
                  : Container(),
              InkWell(
                splashColor: Colors.lightGreen,
                onTap: () {
                  Get.to(HistoryDetailScreen());
                },
                child: Column(
                  children: [
                    ListTile(
                      leading: Icon(
                        Icons.coffee,
                        color: green,
                      ),
                      title: Text(
                        "#" + widget.histories[idx].id.toString(),
                      ),
                      trailing: Text(
                        "\$" + widget.histories[idx].total.toStringAsFixed(2),
                        style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.bold,
                            color: green),
                      ),
                    ),
                    Align(
                      alignment: Alignment.centerRight,
                      child: Padding(
                        padding: const EdgeInsets.only(right: 16.0),
                        child: Text(
                          widget.histories[idx].date.display(),
                          style: TextStyle(fontSize: 12),
                        ),
                      ),
                    ),
                    SizedBox(height: 8)
                  ],
                ),
              ),
              Divider(height: 1)
            ],
          );
        },
      ),
    );
  }
}
