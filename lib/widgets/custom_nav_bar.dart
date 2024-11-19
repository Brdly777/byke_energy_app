import 'package:flutter/material.dart';

class CustomNavBar extends StatelessWidget {
  final Function(int) onTabSelected;

  const CustomNavBar({Key? key, required this.onTabSelected}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 80, // Altura ajustada
      decoration: const BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.vertical(
          top: Radius.circular(16.0),
        ),
        boxShadow: [
          BoxShadow(
            color: Colors.black26,
            blurRadius: 5,
            offset: Offset(0, -3),
          ),
        ],
      ),
      child: Stack(
        alignment: Alignment.center,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.center, // Centra los botones
            children: [
              IconButton(
                icon: const Icon(Icons.widgets_rounded, color: Colors.indigo),
                iconSize: 39, // Tamaño del icono de la izquierda
                onPressed: () {
                  onTabSelected(0); // Cambia a la pantalla principal
                },
              ),
              const SizedBox(
                  width: 50), // Espacio reducido entre el izquierdo y central

              // Contenedor para el botón central
              Transform.translate(
                offset:
                    const Offset(0, -40), // Mueve el botón 30px hacia arriba
                child: GestureDetector(
                  onTap: () {
                    onTabSelected(1); // Cambia a la pantalla de información
                  },
                  child: Container(
                    width: 100.0, // Tamaño del contenedor
                    height: 100.0, // Tamaño del contenedor
                    decoration: BoxDecoration(
                      color: Colors.indigo,
                      shape: BoxShape.circle,
                      boxShadow: [
                        BoxShadow(
                          color: Colors.grey.withOpacity(0.2),
                          blurRadius: 6,
                          offset: const Offset(0, 3),
                        ),
                      ],
                    ),
                    child: const Icon(
                      Icons.timeline_rounded,
                      size: 55.0, // Tamaño grande para el icono central
                      color: Colors.white, // Color del icono central
                    ),
                  ),
                ),
              ),

              const SizedBox(
                  width: 50), // Espacio reducido entre el central y derecho
              IconButton(
                icon: Transform.rotate(
                  angle: 270 * 3.14159 / 180, // 90 grados en radianes
                  child: const Icon(
                    Icons.sort_rounded,
                    color: Colors.indigo,
                  ),
                ),
                iconSize: 39, // Tamaño del icono
                onPressed: () {
                  onTabSelected(2); // Cambia a la pantalla de estadísticas
                },
              )
            ],
          ),
        ],
      ),
    );
  }
}
