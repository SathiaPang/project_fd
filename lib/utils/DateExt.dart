import 'package:intl/intl.dart';

extension Display on DateTime {
  String display({String format = "dd MMM yyyy  hh:mm a"}) {
    final formatter = DateFormat(format);
    return formatter.format(this);
  }
}
