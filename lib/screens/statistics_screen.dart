import 'package:flutter/material.dart';
import '../utils/chart_builders.dart';

class StatisticsScreen extends StatelessWidget {
  const StatisticsScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Card de Distancia Recorrida
              Card(
                color: Colors.white,
                elevation: 5,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(12),
                ),
                child: Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Column(
                    children: [
                      // Fila 1
                      const Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          // Columna 1
                          Icon(
                            Icons.electric_bike_rounded,
                            size: 32,
                            color: Colors.grey,
                          ),
                          // Columna 2
                          Expanded(
                            child: Center(
                              child: Text(
                                'Distancia Recorrida',
                                style: TextStyle(
                                  fontSize: 18,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ),
                          ),
                          // Columna 3
                          Text(
                            '15.2 Km',
                            style: TextStyle(fontSize: 16, color: Colors.grey),
                          ),
                        ],
                      ),
                      const SizedBox(height: 16),
                      // Fila 2
                      SizedBox(
                        height: 200,
                        child: ChartBuilders.buildLineChart(),
                      ),
                      const SizedBox(height: 16),
                      // Fila 3
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          // Columna 1
                          ElevatedButton(
                            onPressed: () {},
                            child: const Text('Semana Anterior'),
                          ),
                          // Columna 2
                          const Text(
                            'Semana Actual',
                            style: TextStyle(fontSize: 16, color: Colors.grey),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
              const SizedBox(height: 20),

              // Card de Energía Generada
              Card(
                color: Colors.white,
                elevation: 5,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(12),
                ),
                child: Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Column(
                    children: [
                      // Fila 1
                      const Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          // Columna 1
                          Icon(
                            Icons.earbuds_battery_rounded,
                            size: 32,
                            color: Colors.grey,
                          ),
                          // Columna 2
                          Expanded(
                            child: Center(
                              child: Text(
                                'Energía Generada',
                                style: TextStyle(
                                  fontSize: 18,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ),
                          ),
                          // Columna 3
                          Text(
                            '25.8 KWh',
                            style: TextStyle(fontSize: 16, color: Colors.grey),
                          ),
                        ],
                      ),
                      const SizedBox(height: 16),
                      // Fila 2: Gráfico de energía generada
                      SizedBox(
                        height: 200,
                        child: ChartBuilders.buildBarChart(),
                      ),
                      const SizedBox(height: 16),
                      // Fila 3
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          // Columna 1
                          ElevatedButton(
                            onPressed: () {
                              // Acción al presionar el boton TODO: no hay aun accion
                            },
                            child: const Text('Semana Anterior'),
                          ),
                          // Columna 2
                          const Text(
                            'Semana Actual',
                            style: TextStyle(fontSize: 16, color: Colors.grey),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
              const SizedBox(height: 20),
            ],
          ),
        ),
      ),
    );
  }
}
