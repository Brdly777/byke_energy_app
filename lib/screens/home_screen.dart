import 'package:flutter/material.dart';
import '../widgets/custom_nav_bar.dart';
import '../widgets/chart_card.dart';
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
    // Lista de pantallas
    const HomeDashboard(),
    const InformationScreen(),
    const StatisticsScreen(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Byke Energy',
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
        centerTitle: true,
        actions: [
          IconButton(
            icon: const FaIcon(FontAwesomeIcons.bell),
            color: Colors.black,
            iconSize: 27,
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
        'icon': Icons.electric_bike,
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
            GridView.builder(
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                crossAxisSpacing: 16,
                mainAxisSpacing: 16,
                childAspectRatio: 3 / 4,
              ),
              itemCount: chartData.length,
              itemBuilder: (context, index) {
                final data = chartData[index];
                return ChartCard(
                  icon: data['icon'],
                  title: data['title'],
                  chart: data['chart'],
                  subtitle1: data['subtitle1'],
                  subtitle2: data['subtitle2'],
                );
              },
            ),
            const SizedBox(height: 8),
            Align(
              alignment: Alignment.centerRight,
              child: TextButton(
                onPressed: () {
                  // Acción al presionar "Ver más..."
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(content: Text('Ver más')),
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
