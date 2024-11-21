import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import '../screens/home_screen.dart';
import '../screens/user_info_screen.dart';

class CustomDrawer extends StatelessWidget {
  const CustomDrawer({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        padding: EdgeInsets.zero,
        children: [
          // Encabezado con el botón X
          DrawerHeader(
            decoration: const BoxDecoration(
              color: Colors.indigo,
            ),
            child: Stack(
              children: [
                const Align(
                  alignment: Alignment.center,
                  child: Text(
                    'Byke Energy',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 27,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                Align(
                  alignment: Alignment.centerLeft,
                  child: IconButton(
                    icon: const Icon(
                      Icons.close,
                      color: Colors.white,
                      size: 37,
                    ),
                    onPressed: () {
                      Navigator.pop(context); // Cierra el Drawer
                    },
                  ),
                ),
              ],
            ),
          ),

          // Elementos del menú
          ListTile(
            leading: const Icon(
              Icons.widgets_rounded,
              color: Colors.black,
              size: 32,
            ),
            title: const Text('Inicio'),
            onTap: () {
              // Redirige a la pantalla inicial
              Navigator.pop(context); // Cierra el Drawer
              Navigator.of(context).pushAndRemoveUntil(
                MaterialPageRoute(builder: (context) => const HomeScreen()),
                (route) => false, // Elimina todas las rutas anteriores
              );
            },
          ),
          ListTile(
            leading: const Icon(
              Icons.supervised_user_circle_rounded,
              color: Colors.black,
              size: 32,
            ),
            title: const Text('Tu información'),
            onTap: () {
              Navigator.pop(context); // Cierra el Drawer
              Navigator.of(context).push(
                MaterialPageRoute(
                  builder: (context) => const InformationDetailScreen(),
                ),
              );
            },
          ),
          ListTile(
            leading: const Icon(
              Icons.settings,
              color: Colors.black,
              size: 32,
            ),
            title: const Text('Configuración'),
            onTap: () {
              // TODO: Accion de boton
            },
          ),
          ListTile(
            leading: const Icon(
              Icons.exit_to_app_rounded,
              color: Colors.black,
              size: 32,
            ),
            title: const Text('Salir de la aplicación'),
            onTap: () {
              SystemNavigator.pop(); // Sale completamente de la app
            },
          ),
        ],
      ),
    );
  }
}
