import 'package:flutter/material.dart';
import 'package:fl_chart/fl_chart.dart';
import '../widgets/info_card.dart';

class ChartBuilders {
  // Para los graficos
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
        gridData: const FlGridData(show: true),
        lineBarsData: [
          LineChartBarData(
            spots: [
              const FlSpot(0, 1),
              const FlSpot(1, 1.5),
              const FlSpot(2, 1.4)
            ],
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

  static Widget buildInfoCard({
    required IconData icon,
    required String title,
    required String subtitle1,
    required String subtitle2,
  }) {
    return InfoCard(
      icon1: icon,
      title1: title,
      subtitle11: subtitle1,
      subtitle21: subtitle2,
    );
  }
}
