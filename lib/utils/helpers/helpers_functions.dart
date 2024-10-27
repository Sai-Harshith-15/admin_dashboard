import 'package:flutter/material.dart';

class HelpersFunctions {
  static DateTime getStartofWeek(DateTime date) {
    final int daysUntilMonday = date.weekday - 1;
    final DateTime startofWeek = date.subtract(Duration(days: daysUntilMonday));
    return DateTime(
        startofWeek.year, startofWeek.month, startofWeek.day, 0, 0, 0, 0, 0);
  }
}
