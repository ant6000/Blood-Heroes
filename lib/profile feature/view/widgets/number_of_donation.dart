import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';

PieChartData numberOfDonationsChart() {
  // Customize your chart data here
  // Example data: List of PieChartSectionData
  List<PieChartSectionData> data = [
    PieChartSectionData(
      color: Colors.green,
      value: 5,
      title: 'Completed',
    ),
  ];

  return PieChartData(sections: data);
}
