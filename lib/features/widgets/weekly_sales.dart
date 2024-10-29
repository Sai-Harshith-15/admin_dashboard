import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../controllers/dashboard_controller.dart';

class WeeklySales extends StatefulWidget {
  const WeeklySales({super.key});

  @override
  State<WeeklySales> createState() => _WeeklySalesState();
}

class _WeeklySalesState extends State<WeeklySales> {
  final controller = Get.put(DashboardController());

  @override
  Widget build(BuildContext context) {
    return BarChart(
      BarChartData(
          titlesData: buildFlTitleData(),
          borderData: FlBorderData(
            show: true,
            border: Border(
              top: BorderSide.none,
              right: BorderSide.none,
            ),
          ),
          gridData: FlGridData(
            show: true,
            drawHorizontalLine: true,
            drawVerticalLine: false,
            horizontalInterval: 200,
          ),
          barGroups: controller.weeklySales
              .asMap()
              .entries
              .map(
                (entry) => BarChartGroupData(x: entry.key, barRods: [
                  BarChartRodData(
                    width: 30,
                    toY: entry.value,
                    color: Colors.green,
                    borderRadius: BorderRadius.circular(8),
                  ),
                ]),
              )
              .toList(),
          groupsSpace: 20.0,
          barTouchData: BarTouchData(
            touchTooltipData: BarTouchTooltipData(
              getTooltipColor: (_) => Colors.white,
            ),
            touchCallback: (p0, p1) {},
          )),
    );
  }

  FlTitlesData buildFlTitleData() {
    return FlTitlesData(
      show: true,
      bottomTitles: AxisTitles(
        sideTitles: SideTitles(
          showTitles: true,
          getTitlesWidget: (value, meta) {
            //map index to the desired day of week
            final days = ['Mon', 'Tue', 'Wed', 'Thu', "Fri", "Sat", "Sun"];
            //calculate the index ensure it warps around for the correct day
            final index = value.toInt() % days.length;

            //Get the day corresponding to the calculated index

            final day = days[index];

            return SideTitleWidget(
              child: Text(day),
              axisSide: AxisSide.bottom,
              space: 0,
            );
          },
        ),
      ),
      leftTitles: const AxisTitles(
        sideTitles: SideTitles(
          showTitles: true,
          interval: 200,
          reservedSize: 50,
        ),
      ),
      rightTitles: const AxisTitles(
        sideTitles: SideTitles(
          showTitles: false,
          interval: 200,
          reservedSize: 50,
        ),
      ),
      topTitles: const AxisTitles(
          sideTitles: SideTitles(
        showTitles: false,
      )),
    );
  }
}
