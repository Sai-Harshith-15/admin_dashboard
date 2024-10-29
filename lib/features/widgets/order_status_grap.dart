import 'package:admin_dashboard/controllers/dashboard_controller.dart';
import 'package:admin_dashboard/utils/helpers/helpers_functions.dart';
import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';

class OrderStatusPieChart extends StatefulWidget {
  const OrderStatusPieChart({super.key});

  @override
  State<OrderStatusPieChart> createState() => _OrderStatusPieChartState();
}

class _OrderStatusPieChartState extends State<OrderStatusPieChart> {
  final controller = DashboardController.instance;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text(
          "Orders Status",
          style: TextStyle(fontSize: 16),
        ),
        const SizedBox(height: 20),
        SizedBox(
          height: 200, // Fixed height for the PieChart
          child: PieChart(
            PieChartData(
              sections: controller.orderStatusData.entries.map((entry) {
                final status = entry.key;
                final count = entry.value;

                return PieChartSectionData(
                  radius: 100,
                  color: HelpersFunctions.getOrderStatusColor(status),
                  title: count.toString(),
                  value: count.toDouble(),
                  titleStyle: const TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                  ),
                );
              }).toList(),
              pieTouchData: PieTouchData(
                touchCallback: (FlTouchEvent event, pieTouchResponse) {
                  // handle touch events here if needed
                },
                enabled: true,
              ),
            ),
          ),
        ),
      ],
    );
  }
}
