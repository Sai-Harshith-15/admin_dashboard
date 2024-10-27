import 'package:admin_dashboard/controllers/dashboard_controller.dart';
import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class DashboardDesktopScreen extends StatelessWidget {
  const DashboardDesktopScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(DashboardController());
    return Scaffold(
      appBar: AppBar(title: Text("Wrap Example")),
      body: SingleChildScrollView(
        child: Center(
          child: Wrap(
            crossAxisAlignment: WrapCrossAlignment.start,
            alignment: WrapAlignment.start,
            runAlignment: WrapAlignment.center,
            spacing: 16, // Space between cards horizontally
            runSpacing: 16, // Space between rows of cards vertically
            children: [
              _buildCard("Card 1"),
              _buildCard("Card 2"),
              _buildCard("Card 3"),
              _buildCard("Card 4"),
              //bar
              SizedBox(
                height: MediaQuery.of(context).size.height * .4,
                width: MediaQuery.of(context).size.width * .4,
                child: Card(
                  elevation: 5,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text("Weekly Sales"),
                      const SizedBox(
                        height: 20,
                      ),
                      //graph

                      Expanded(
                        child: BarChart(
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
                                    (entry) => BarChartGroupData(
                                        x: entry.key,
                                        barRods: [
                                          BarChartRodData(
                                            width: 30,
                                            toY: entry.value,
                                            color: Colors.green,
                                            borderRadius:
                                                BorderRadius.circular(8),
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
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              //pie
              SizedBox(
                width: MediaQuery.of(context).size.width * .4,
                child: Card(
                  color: Colors.red,
                  child: Text("sai"),
                ),
              ),
              //orders
              SizedBox(
                width: MediaQuery.of(context).size.width * .4,
                child: Card(color: Colors.blue, child: Text("harshith")),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildCard(String title) {
    return SizedBox(
      width: 350, // Fixed width for each card
      height: 200, // Fixed height for each card
      child: Card(
        color: Colors.blueAccent,
        child: Center(
          child: Text(
            title,
            style: TextStyle(color: Colors.white, fontSize: 18),
          ),
        ),
      ),
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
