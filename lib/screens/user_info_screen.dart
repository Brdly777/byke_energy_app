import 'package:flutter/material.dart';

class InformationDetailScreen extends StatefulWidget {
  const InformationDetailScreen({Key? key}) : super(key: key);

  @override
  _InformationDetailScreenState createState() =>
      _InformationDetailScreenState();
}

class _InformationDetailScreenState extends State<InformationDetailScreen> {
  String _selectedGender = 'Femenino';
  double _selectedAge = 25;
  bool _isHeightInMeters = true;
  double _selectedHeight = 1.75;
  bool _isWeightInKilos = true;
  double _selectedWeight = 70;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Tu Información'),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Fila para género dentro de una Card
            Card(
              color: Colors.white,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(16),
              ),
              elevation: 4,
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Expanded(
                      child: ElevatedButton(
                        onPressed: () {
                          setState(() {
                            _selectedGender = 'Femenino';
                          });
                        },
                        style: ElevatedButton.styleFrom(
                          backgroundColor: _selectedGender == 'Femenino'
                              ? Colors.indigo
                              : Colors.grey[300],
                          foregroundColor: _selectedGender == 'Femenino'
                              ? Colors.white
                              : Colors.black,
                        ),
                        child: const Text('Femenino'),
                      ),
                    ),
                    const SizedBox(width: 16),
                    Expanded(
                      child: ElevatedButton(
                        onPressed: () {
                          setState(() {
                            _selectedGender = 'Masculino';
                          });
                        },
                        style: ElevatedButton.styleFrom(
                          backgroundColor: _selectedGender == 'Masculino'
                              ? Colors.indigo
                              : Colors.grey[300],
                          foregroundColor: _selectedGender == 'Masculino'
                              ? Colors.white
                              : Colors.black,
                        ),
                        child: const Text('Masculino'),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            const SizedBox(height: 16),

            // Fila para edad
            const Text(
              'Edad',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 8),
            Card(
              color: Colors.white,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(16),
              ),
              elevation: 4,
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: Column(
                  children: [
                    Text(
                      '${_selectedAge.round()} años',
                      style: const TextStyle(fontSize: 16),
                    ),
                    Slider(
                      value: _selectedAge,
                      min: 1,
                      max: 100,
                      divisions: 99,
                      onChanged: (value) {
                        setState(() {
                          _selectedAge = value;
                        });
                      },
                    ),
                  ],
                ),
              ),
            ),
            const SizedBox(height: 16),

            // Fila para altura
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Text(
                  'Altura',
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                ),
                Row(
                  children: [
                    const Text('Metros'),
                    Switch(
                      value: _isHeightInMeters,
                      activeColor: Colors.green, // Cambiado a verde
                      onChanged: (value) {
                        setState(() {
                          _isHeightInMeters = value;
                          _selectedHeight = _isHeightInMeters
                              ? _selectedHeight / 3.281
                              : _selectedHeight * 3.281;
                        });
                      },
                    ),
                    const Text('Pies'),
                  ],
                ),
              ],
            ),
            const SizedBox(height: 8),
            Card(
              color: Colors.white,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(16),
              ),
              elevation: 4,
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: Column(
                  children: [
                    Text(
                      _isHeightInMeters
                          ? '${_selectedHeight.toStringAsFixed(2)} m'
                          : '${_selectedHeight.toStringAsFixed(2)} ft',
                      style: const TextStyle(fontSize: 16),
                    ),
                    Slider(
                      value: _selectedHeight,
                      min: _isHeightInMeters ? 0.5 : 1.5,
                      max: _isHeightInMeters ? 2.5 : 8.0,
                      onChanged: (value) {
                        setState(() {
                          _selectedHeight = value;
                        });
                      },
                    ),
                  ],
                ),
              ),
            ),
            const SizedBox(height: 16),

            // Fila para peso
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Text(
                  'Peso',
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                ),
                Row(
                  children: [
                    const Text('Kg'),
                    Switch(
                      value: _isWeightInKilos,
                      activeColor: Colors.green, // Cambiado a verde
                      onChanged: (value) {
                        setState(() {
                          _isWeightInKilos = value;
                          _selectedWeight = _isWeightInKilos
                              ? _selectedWeight / 2.205
                              : _selectedWeight * 2.205;
                        });
                      },
                    ),
                    const Text('Lb'),
                  ],
                ),
              ],
            ),
            const SizedBox(height: 8),
            Card(
              color: Colors.white,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(16),
              ),
              elevation: 4,
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: Column(
                  children: [
                    Text(
                      _isWeightInKilos
                          ? '${_selectedWeight.toStringAsFixed(1)} kg'
                          : '${_selectedWeight.toStringAsFixed(1)} lb',
                      style: const TextStyle(fontSize: 16),
                    ),
                    Slider(
                      value: _selectedWeight,
                      min: _isWeightInKilos ? 30 : 66,
                      max: _isWeightInKilos ? 150 : 330,
                      onChanged: (value) {
                        setState(() {
                          _selectedWeight = value;
                        });
                      },
                    ),
                  ],
                ),
              ),
            ),
            const SizedBox(height: 16),

            // Botón guardar
            Center(
              child: ElevatedButton(
                onPressed: () {
                  // Lógica para guardar los datos
                  ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(
                        content: Text('Datos guardados exitosamente')),
                  );
                },
                style: ElevatedButton.styleFrom(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 32,
                    vertical: 12,
                  ),
                  backgroundColor: Colors.indigo,
                ),
                child: const Text(
                  'Guardar',
                  style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.normal,
                      color: Colors.white),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
