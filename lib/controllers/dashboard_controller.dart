// ignore_for_file: avoid_print
import 'package:admin_dashboard/utils/helpers/helpers_functions.dart';
import 'package:get/get.dart';
import '../models/order_model.dart';

class DashboardController extends GetxController {
  static DashboardController get instance => Get.find();
  final RxList<double> weeklySales = <double>[].obs;

  static final List<OrderModel> orders = [
    OrderModel(
      id: '1',
      status: OrderStatus.processing,
      totalAmount: 265,
      orderDate: DateTime(2024, 10, 23),
      deliveryDate: DateTime(2024, 10, 25),
    ),
    OrderModel(
      id: '2',
      status: OrderStatus.shipped,
      totalAmount: 395,
      orderDate: DateTime(2024, 10, 23),
      deliveryDate: DateTime(2024, 10, 24),
    ),
    OrderModel(
      id: '3',
      status: OrderStatus.delivered,
      totalAmount: 395,
      orderDate: DateTime(2024, 10, 24),
      deliveryDate: DateTime(2024, 15, 22),
    ),
    OrderModel(
      id: '4',
      status: OrderStatus.delivered,
      totalAmount: 455,
      orderDate: DateTime(2024, 10, 25),
      deliveryDate: DateTime(2024, 5, 23),
    ),
    OrderModel(
      id: '5',
      status: OrderStatus.delivered,
      totalAmount: 155,
      orderDate: DateTime(2024, 10, 26),
      deliveryDate: DateTime(2024, 5, 24),
    ),
    OrderModel(
      id: '6',
      status: OrderStatus.delivered,
      totalAmount: 1505,
      orderDate: DateTime(2024, 10, 27),
      deliveryDate: DateTime(2024, 5, 24),
    ),
  ];

  @override
  void onInit() {
    super.onInit();
    calculateWeeklySales();
  }

/* 
  void calculateWeeklySales() {
    //Reset weeklySales to Zero

    weeklySales.value = List<double>.filled(7, 0.0);
    //Calculate weekly sales for each day of the week

    for (var order in orders) {
      final DateTime orderWeekStart =
          HelpersFunctions.getStartofWeek(order.orderDate);

      //caheck if the order is within the current week
      if (orderWeekStart.isBefore(DateTime.now()) &&
          orderWeekStart.add(const Duration(days: 7)).isAfter(DateTime.now())) {
        int index = (order.orderDate.weekday - 1) % 7;

        //Ensure the index is non-negative

        index = index < 0 ? index + 7 : index;

        weeklySales[index] += order.totalAmount;

        print(
          "OrderDate : ${order.orderDate}, CurrentWeekDay : ${orderWeekStart}, Index : $index",
        );
      }
    }

    print("weekly sales: $weeklySales");
  }

 */

  void calculateWeeklySales() {
    // Reset weeklySales to zero
    weeklySales.value = List<double>.filled(7, 0.0);

    final DateTime now = DateTime.now();
    final DateTime currentWeekStart = HelpersFunctions.getStartofWeek(now);

    for (var order in orders) {
      final DateTime orderWeekStart =
          HelpersFunctions.getStartofWeek(order.orderDate);

      // Check if the order date falls within the same week as the current date
      if (orderWeekStart == currentWeekStart) {
        // Map the order date to the correct day of the week
        int index =
            order.orderDate.weekday - 1; // weekday starts from 1 (Monday)

        // Add to weekly sales at the correct index
        weeklySales[index] += order.totalAmount;

        // Display order details
        print("Order ID: ${order.id}");
        print("Order Status: ${order.status}");
        print("Total Amount: ${order.totalAmount}");
        print("Order Date: ${order.orderDate}");
        print("Delivery Date: ${order.deliveryDate}");
        print("Weekday Index: $index");
        print("Accumulated Sales for Day $index: ${weeklySales[index]}");
        print("----------------------------------------");
      } else {
        print("Order ${order.id} is outside the current week.");
      }
    }

    print("Weekly sales summary: $weeklySales");
  }
}
