import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class NotificationsScreen extends StatelessWidget {
  const NotificationsScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final String currentDate = DateFormat('dd MMMM').format(DateTime.now());

    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Notificaciones',
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'Hoy, $currentDate',
                  style: const TextStyle(
                      fontSize: 16, fontWeight: FontWeight.normal),
                ),
                TextButton(
                  onPressed: () {
                    // Acción para limpiar las notificaciones
                    ScaffoldMessenger.of(context).showSnackBar(
                      const SnackBar(content: Text('Notificaciones limpiadas')),
                    );
                  },
                  child: const Text(
                    'Limpiar',
                    style: TextStyle(color: Colors.grey, fontSize: 16),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 16),
            // Card de notificación
            Card(
              color: Colors.white,
              elevation: 3,
              margin: const EdgeInsets.symmetric(vertical: 8),
              child: ListTile(
                leading: const Icon(
                  Icons.notifications_active,
                  size: 40,
                  color: Colors.black,
                ),
                title: const Text(
                  'Nueva actualización disponible',
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
                subtitle: const Text('Versión 2.0 está lista para descargar.'),
                onTap: () {
                  // Acción al presionar la notificación
                  ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(content: Text('Notificación seleccionada')),
                  );
                },
              ),
            ),
            // Otra notificación
            Card(
              color: Colors.white,
              elevation: 3,
              margin: const EdgeInsets.symmetric(vertical: 8),
              child: ListTile(
                leading: const Icon(
                  Icons.warning_amber_rounded,
                  size: 40,
                  color: Colors.black,
                ),
                title: const Text(
                  'Advertencia de batería baja',
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
                subtitle:
                    const Text('La batería está al 15%, por favor recargue.'),
                onTap: () {
                  // Accion al presionar la notificación
                  ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(content: Text('Advertencia seleccionada')),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
