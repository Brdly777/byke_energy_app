import 'package:flutter/material.dart';
import 'package:fl_chart/fl_chart.dart';

class ChartBuilders {
  static Widget buildPieChart() {
    return PieChart(
      PieChartData(
        sections: [
          PieChartSectionData(
            color: Colors.white,
          ),
          PieChartSectionData(
            color: Colors.indigo,
            value: 210,
          ),
        ],
      ),
    );
  }

  static Widget buildLineChart() {
    return LineChart(
      LineChartData(
        gridData: FlGridData(show: true),
        lineBarsData: [
          LineChartBarData(
            spots: [FlSpot(0, 1), FlSpot(1, 1.5), FlSpot(2, 1.4)],
          ),
        ],
      ),
    );
  }

  static Widget buildBarChart() {
    return BarChart(
      BarChartData(
        barGroups: [
          BarChartGroupData(x: 0, barRods: [BarChartRodData(toY: 5)]),
          BarChartGroupData(x: 1, barRods: [BarChartRodData(toY: 10)]),
        ],
      ),
    );
  }
}
