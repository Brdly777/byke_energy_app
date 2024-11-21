import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:fl_chart/fl_chart.dart';

class DayInformationCard extends StatelessWidget {
  final DateTime selectedDate;

  DayInformationCard({
    super.key,
    required this.selectedDate,
  });

  // Colores para las metricas
  final Color distanceColor = Colors.indigo;
  final Color energyColor = Colors.green;
  final Color caloriesColor = Colors.red;
  final double betweenSpace = 0.2;

  // Metodo para generar datos para las barras del gráfico
  BarChartGroupData generateGroupData(
    int x,
    double distance,
    double energy,
    double calories,
  ) {
    return BarChartGroupData(
      x: x,
      groupVertically: true,
      barRods: [
        BarChartRodData(
          fromY: 0,
          toY: distance,
          color: distanceColor,
          width: 5,
        ),
        BarChartRodData(
          fromY: distance + betweenSpace,
          toY: distance + betweenSpace + energy,
          color: energyColor,
          width: 5,
        ),
        BarChartRodData(
          fromY: distance + betweenSpace + energy + betweenSpace,
          toY: distance + betweenSpace + energy + betweenSpace + calories,
          color: caloriesColor,
          width: 5,
        ),
      ],
    );
  }

  // Metodo para obtener las últimas 8 horas
  List<String> getLast8Hours() {
    final List<String> hours = [];
    DateTime currentTime = DateTime.now();
    for (int i = 7; i >= 0; i--) {
      DateTime hour = currentTime.subtract(Duration(hours: i));
      String formattedHour = DateFormat('HH:mm').format(hour);
      hours.add(formattedHour);
    }
    return hours.reversed.toList();
  }

  // Titulos del eje inferior
  Widget bottomTitles(double value, TitleMeta meta) {
    const style = TextStyle(fontSize: 10);
    List<String> hours = getLast8Hours(); // Obtenemos las horas dinámicamente
    String text = hours[value.toInt()];
    return SideTitleWidget(
      axisSide: meta.axisSide,
      child: Text(text, style: style),
    );
  }

  // Ejemplo de datos de actividad para las ultimas 8 horas
  List<List<double>> getActivityData() {
    // Datos de ejemplo para las 8 últimas horas:
    // [distancia, energía, calorías]
    return [
      [1200, 500, 300], // 00:00
      [1100, 600, 400], // 01:00
      [1200, 650, 400], // 02:00
      [1300, 700, 500], // 03:00
      [1200, 700, 500], // 04:00
      [1200, 800, 500], // 05:00
      [1300, 650, 450], // 06:00
      [1100, 750, 550], // 07:00
    ];
  }

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        final double maxWidth = constraints.maxWidth;
        List<List<double>> activityData = getActivityData();

        return Container(
          width: maxWidth,
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(8.0),
            boxShadow: [
              BoxShadow(
                color: Colors.grey.withOpacity(0.2),
                blurRadius: 6,
                offset: const Offset(0, 3),
              ),
            ],
          ),
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              children: [
                const Text(
                  'Información del Día',
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(height: 2),
                Text(
                  DateFormat(
                          '${DateFormat('d').format(selectedDate)} MMMM yyyy')
                      .format(selectedDate),
                  style: const TextStyle(fontSize: 16),
                ),
                const SizedBox(height: 16),
                Text(
                  'Distancia recorrida en metros',
                  style: TextStyle(fontSize: 16, color: Colors.grey[600]),
                ),
                const Text(
                  '2,100',
                  style: TextStyle(
                    fontSize: 42,
                    fontWeight: FontWeight.normal,
                  ),
                ),
                const SizedBox(height: 16),

                // Fila de tres tarjetas
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    // Primer tarjeta: Distancia
                    Expanded(
                      child: Card(
                        color: Colors.white,
                        elevation: 4.0,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(8.0),
                        ),
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Icon(
                                Icons.electric_bike_rounded,
                                color: distanceColor,
                                size: 24.0,
                              ),
                              const SizedBox(height: 8),
                              const Text(
                                'Distancia',
                                style: TextStyle(
                                  fontSize: 16,
                                  fontWeight: FontWeight.normal,
                                  color: Colors.grey,
                                ),
                              ),
                              const SizedBox(height: 8),
                              const Text(
                                '2.1 Km',
                                style: TextStyle(fontSize: 14),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),

                    const SizedBox(width: 8),

                    // Segunda tarjeta: Calorías
                    Expanded(
                      child: Card(
                        color: Colors.white,
                        elevation: 4.0,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(8.0),
                        ),
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Icon(
                                Icons.local_fire_department_rounded,
                                color: caloriesColor,
                                size: 24.0,
                              ),
                              const SizedBox(height: 8),
                              const Text(
                                'Calorías',
                                style: TextStyle(
                                  fontSize: 16,
                                  fontWeight: FontWeight.normal,
                                  color: Colors.grey,
                                ),
                              ),
                              const SizedBox(height: 8),
                              const Text(
                                '1,293',
                                style: TextStyle(fontSize: 14),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),

                    const SizedBox(width: 8),

                    // Tercer tarjeta: Energía
                    Expanded(
                      child: Card(
                        color: Colors.white,
                        elevation: 4.0,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(8.0),
                        ),
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Icon(
                                Icons.battery_charging_full_rounded,
                                color: energyColor,
                                size: 24.0,
                              ),
                              const SizedBox(height: 8),
                              const Text(
                                'Energía',
                                style: TextStyle(
                                  fontSize: 16,
                                  fontWeight: FontWeight.normal,
                                  color: Colors.grey,
                                ),
                              ),
                              const SizedBox(height: 8),
                              const Text(
                                '70%',
                                style: TextStyle(fontSize: 14),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 32),

                // Caja que contiene el gráfico
                Container(
                  padding: const EdgeInsets.all(8.0),
                  height: 220,
                  child: AspectRatio(
                    aspectRatio: 1.7,
                    child: BarChart(
                      BarChartData(
                        alignment: BarChartAlignment.spaceBetween,
                        titlesData: FlTitlesData(
                          leftTitles: const AxisTitles(),
                          rightTitles: const AxisTitles(),
                          topTitles: const AxisTitles(),
                          bottomTitles: AxisTitles(
                            sideTitles: SideTitles(
                              showTitles: true,
                              getTitlesWidget: bottomTitles,
                              reservedSize: 20,
                            ),
                          ),
                        ),
                        barTouchData: BarTouchData(enabled: false),
                        borderData: FlBorderData(show: false),
                        gridData: const FlGridData(show: false),
                        barGroups: List.generate(8, (index) {
                          return generateGroupData(
                            index,
                            activityData[index][0], // Distancia
                            activityData[index][1], // Energía
                            activityData[index][2], // Calorías
                          );
                        }),
                        maxY: 2500,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
