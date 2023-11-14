import 'package:flutter/material.dart';
import 'package:fl_chart/fl_chart.dart';

class DonationHistoryChart extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // Dummy data for demonstration, replace with your actual data
    List<double> donationData = [10, 15, 8, 20, 12, 18, 25, 14, 22, 17, 30, 28];

    return Container(
      height: 300,
      child: LineChart(
        LineChartData(
          gridData: FlGridData(show: false),
          titlesData: FlTitlesData(
            show: true,
          ),
          borderData: FlBorderData(show: true),
          lineBarsData: [
            LineChartBarData(
              spots: List.generate(donationData.length, (index) {
                return FlSpot(index.toDouble(), donationData[index]);
              }),
              isCurved: true,
              color: Colors.blueAccent,
              dotData: FlDotData(show: false),
              belowBarData: BarAreaData(show: false),
            ),
          ],
          minY: 0,
          maxY: 35,
          lineTouchData: LineTouchData(
            touchTooltipData: LineTouchTooltipData(
              tooltipBgColor: Colors.blueAccent,
            ),
            handleBuiltInTouches: true,
          ),
        ),
      ),
    );
  }
}