import 'package:intl/intl.dart';

extension DateExtension on DateTime {
  DateTime startDayOfWeek() {
    return _getDate(subtract(Duration(days: weekday - 1)));
  }

  DateTime endDayOfWeek() {
    return _getDate(add(Duration(days: DateTime.daysPerWeek - weekday)));
  }

  DateTime _getDate(DateTime dateTime) {
    return DateTime(dateTime.year, dateTime.month, dateTime.day);
  }

  String toStringWithFormat([String format = 'dd-MM-yyyy hh:mm']) {
    return DateFormat(format).format(this);
  }
}
