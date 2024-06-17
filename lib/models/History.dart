import 'package:project_fd/models/Order.dart';

class History {
  final int id;
  final DateTime date;
  final double total;
  final List<Order> orders;

  const History({
    required this.id,
    required this.date,
    required this.total,
    this.orders = const [],
  });
}
