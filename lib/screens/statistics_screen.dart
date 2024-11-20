import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import '../utils/chart_builders.dart'; // Asumiendo que tienes una función para crear gráficos

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
                elevation: 5,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(12),
                ),
                child: Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Column(
                    children: [
                      // Fila 1 con tres columnas
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          // Columna 1: Icono de bicicleta
                          const Icon(
                            Icons.electric_bike_rounded,
                            size: 32,
                            color: Colors.grey,
                          ),
                          // Columna 2: Titulo centrado
                          Expanded(
                            child: Center(
                              child: const Text(
                                'Distancia Recorrida',
                                style: TextStyle(
                                  fontSize: 18,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ),
                          ),
                          // Columna 3: Subtítulo
                          const Text(
                            '15.2 Km',
                            style: TextStyle(fontSize: 16, color: Colors.grey),
                          ),
                        ],
                      ),
                      const SizedBox(height: 16),
                      // Fila 2: Gráfico de distancia recorrida
                      SizedBox(
                        height: 200,
                        child: ChartBuilders
                            .buildLineChart(), // Asumiendo que esta función existe y construye el gráfico de distancia
                      ),
                      const SizedBox(height: 16),
                      // Fila 3: Botón de anterior semana y subtítulo
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          // Columna 1: Botón de anterior semana
                          ElevatedButton(
                            onPressed: () {
                              // Acción al presionar el botón de "Anterior Semana"
                            },
                            child: const Text('Semana Anterior'),
                          ),
                          // Columna 2: Subtítulo
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
              const SizedBox(height: 20), // Espacio entre las tarjetas

              // Card de Energía Generada
              Card(
                elevation: 5,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(12),
                ),
                child: Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Column(
                    children: [
                      // Fila 1 con tres columnas
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          // Columna 1: Icono de energía
                          const Icon(
                            Icons.earbuds_battery_rounded,
                            size: 32,
                            color: Colors.grey, // Icono para energía
                          ),
                          // Columna 2: Titulo centrado
                          Expanded(
                            child: Center(
                              child: const Text(
                                'Energía Generada',
                                style: TextStyle(
                                  fontSize: 18,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ),
                          ),
                          // Columna 3: Subtítulo
                          const Text(
                            '25.8 KWh',
                            style: TextStyle(fontSize: 16, color: Colors.grey),
                          ),
                        ],
                      ),
                      const SizedBox(height: 16),
                      // Fila 2: Gráfico de energía generada (puedes cambiar el gráfico según tus necesidades)
                      SizedBox(
                        height: 200,
                        child: ChartBuilders
                            .buildBarChart(), // Asumiendo que esta función existe y construye el gráfico de energía
                      ),
                      const SizedBox(height: 16),
                      // Fila 3: Botón de anterior semana y subtítulo
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          // Columna 1: Botón de anterior semana
                          ElevatedButton(
                            onPressed: () {
                              // Acción al presionar el botón de "Anterior Semana"
                            },
                            child: const Text('Semana Anterior'),
                          ),
                          // Columna 2: Subtítulo
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
              // Puedes añadir más tarjetas o contenido aquí si es necesario
            ],
          ),
        ),
      ),
    );
  }
}
