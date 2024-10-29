import 'package:admin_dashboard/controllers/dashboard_controller.dart';
import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../widgets/order_status_grap.dart';
import '../widgets/weekly_sales.dart';

class DashboardDesktopScreen extends StatelessWidget {
  const DashboardDesktopScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(DashboardController());
    return Scaffold(
      appBar: AppBar(title: Text("Dashboard")),
      body: SingleChildScrollView(
        child: Center(
          child: Wrap(
            crossAxisAlignment: WrapCrossAlignment.start,
            alignment: WrapAlignment.start,
            runAlignment: WrapAlignment.center,
            spacing: 16, // Space between cards horizontally
            runSpacing: 16, // Space between rows of cards vertically
            children: [
              /*  _buildCard("Card 1"),
              _buildCard("Card 2"),
              _buildCard("Card 3"),
              _buildCard("Card 4"), */
              // Weekly Sales Card with Graph
              /*  SizedBox(
                height: MediaQuery.of(context).size.height * 0.4,
                width: MediaQuery.of(context).size.width * 0.4,
                child: Card(
                  elevation: 5,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Text("Weekly Sales"),
                      ),
                      const SizedBox(height: 20),
                      Expanded(
                        child: WeeklySales(),
                      ),
                    ],
                  ),
                ),
              ),*/
              // Pie Chart Card with Fixed Height
              SizedBox(
                width: MediaQuery.of(context).size.width * 0.4,
                child: Card(
                  color: Colors.white,
                  child: Flexible(child: OrderStatusPieChart()),
                ),
              ),
              // Orders Card
              /*  SizedBox(
                width: MediaQuery.of(context).size.width * 0.3,
                height: 150,
                child: Card(
                  color: Colors.blue,
                  child: Center(
                      child: Text("Orders Overview",
                          style: TextStyle(color: Colors.white))),
                ),
              ), */
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
}
