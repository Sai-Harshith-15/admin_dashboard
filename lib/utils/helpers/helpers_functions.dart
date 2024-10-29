import 'package:admin_dashboard/models/order_model.dart';
import 'package:flutter/material.dart';

class HelpersFunctions {
  static DateTime getStartofWeek(DateTime date) {
    final int daysUntilMonday = date.weekday - 1;
    final DateTime startofWeek = date.subtract(Duration(days: daysUntilMonday));
    return DateTime(
        startofWeek.year, startofWeek.month, startofWeek.day, 0, 0, 0, 0, 0);
  }

  static Color getOrderStatusColor(OrderStatus value) {
    if (OrderStatus.pending == value) {
      return Colors.blue;
    } else if (OrderStatus.processing == value) {
      return Colors.orange;
    } else if (OrderStatus.shipped == value) {
      return Colors.purple;
    } else if (OrderStatus.delivered == value) {
      return Colors.green;
    } else if (OrderStatus.cancelled == value) {
      return Colors.red;
    } else {
      return Colors.grey;
    }
  }
}
