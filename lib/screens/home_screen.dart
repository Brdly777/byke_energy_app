import 'package:flutter/material.dart';
import '../widgets/custom_nav_bar.dart';
import '../widgets/chart_card.dart';
import '../widgets/info_card.dart';
import '../widgets/custom_drawer.dart';
import '../utils/chart_builders.dart';
import 'information_screen.dart';
import 'statistics_screen.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int _selectedIndex = 0; // Controla la pantalla actual
  final List<Widget> _pages = [
    const HomeDashboard(),
    const InformationScreen(),
    const StatisticsScreen(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: Builder(
          builder: (BuildContext context) {
            return IconButton(
              icon: const Icon(
                Icons.menu_rounded,
                size: 32,
              ),
              color: Colors.black,
              onPressed: () {
                Scaffold.of(context).openDrawer(); // Abre el Drawer
              },
            );
          },
        ),
        title: const Text(
          'Byke Energy',
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
        centerTitle: true,
        actions: [
          IconButton(
            icon: const FaIcon(
              FontAwesomeIcons.bell,
              size: 28,
            ),
            color: Colors.black,
            onPressed: () {
              ScaffoldMessenger.of(context).showSnackBar(
                const SnackBar(content: Text('Notificaciones')),
              );
            },
          ),
        ],
      ),
      drawer: const CustomDrawer(),
      body: IndexedStack(
        index: _selectedIndex, // Muestra la página según el índice
        children: _pages, // Las pantallas
      ),
      bottomNavigationBar: CustomNavBar(
        onTabSelected: (index) {
          setState(() {
            _selectedIndex = index; // Cambia la pantalla actual
          });
        },
      ),
    );
  }
}

class HomeDashboard extends StatelessWidget {
  const HomeDashboard({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final List<Map<String, dynamic>> chartData = [
      {
        'icon': Icons.electric_bike_rounded,
        'title': 'Km',
        'chart': ChartBuilders.buildPieChart(),
        'subtitle1': 'Kilometros del dia',
        'subtitle2': '2.1',
      },
      {
        'icon': Icons.battery_charging_full_rounded,
        'title': 'Energia Generada',
        'chart': ChartBuilders.buildLineChart(),
        'subtitle1': 'Porcentaje actual',
        'subtitle2': '70%',
      },
      {
        'icon': Icons.earbuds_battery_rounded,
        'title': 'Energia',
        'chart': ChartBuilders.buildBarChart(),
        'subtitle1': 'Tiempo restante',
        'subtitle2': '100% en 25min..',
      },
      {
        'icon': Icons.alarm_rounded,
        'title': 'Descanso',
        'subtitle1': 'Temporizador',
        'subtitle2': '01 hora/s 45 min...',
      },
      {
        'icon': Icons.local_fire_department_rounded,
        'title': 'Calorias',
        'subtitle1': 'Kcal segun distancia recorrida',
        'subtitle2': '1293 Kcal',
      },
    ];

    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              'Bienvenido de vuelta!',
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 8),
            const Text(
              'Resumen de datos más recientes',
              style: TextStyle(fontSize: 16, color: Colors.grey),
            ),
            const SizedBox(height: 16),
            // Fila 1 con dos columnas
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                // Columna 1: Gráfico de pie
                Expanded(
                  child: Container(
                    height: 250, // Ajusta la altura según sea necesario
                    margin: const EdgeInsets.only(right: 16),
                    child: ChartCard(
                      icon: chartData[0]['icon'],
                      title: chartData[0]['title'],
                      chart: chartData[0]['chart'],
                      subtitle1: chartData[0]['subtitle1'],
                      subtitle2: chartData[0]['subtitle2'],
                    ),
                  ),
                ),
                // Columna 2: Gráfico de línea
                Expanded(
                  child: SizedBox(
                    height: 250, // Ajusta la altura según sea necesario
                    child: ChartCard(
                      icon: chartData[1]['icon'],
                      title: chartData[1]['title'],
                      chart: chartData[1]['chart'],
                      subtitle1: chartData[1]['subtitle1'],
                      subtitle2: chartData[1]['subtitle2'],
                    ),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 16),
            // Fila 2 con dos columnas
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                // Columna 1: Gráfico de barras
                Expanded(
                  child: Container(
                    height: 300, // Ajusta la altura según sea necesario
                    margin: const EdgeInsets.only(
                        right: 16), // Espacio entre columnas
                    child: ChartCard(
                      icon: chartData[2]['icon'],
                      title: chartData[2]['title'],
                      chart: chartData[2]['chart'],
                      subtitle1: chartData[2]['subtitle1'],
                      subtitle2: chartData[2]['subtitle2'],
                    ),
                  ),
                ),
                // Columna 2: Titulo 1 y Titulo 2
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Container(
                        height: 140,
                        margin: const EdgeInsets.only(bottom: 16),
                        child: InfoCard(
                          icon1: chartData[3]['icon'],
                          title1: chartData[3]['title'],
                          subtitle11: chartData[3]['subtitle1'],
                          subtitle21: chartData[3]['subtitle2'],
                        ),
                      ),
                      SizedBox(
                        height: 140,
                        child: InfoCard(
                          icon1: chartData[4]['icon'],
                          title1: chartData[4]['title'],
                          subtitle11: chartData[4]['subtitle1'],
                          subtitle21: chartData[4]['subtitle2'],
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
            const SizedBox(height: 8),
            Align(
              alignment: Alignment.centerRight,
              child: TextButton(
                onPressed: () {
                  ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(content: Text('Ver más')),
                  );
                },
                child: const Text(
                  'Ver más...',
                  style: TextStyle(fontSize: 16),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
