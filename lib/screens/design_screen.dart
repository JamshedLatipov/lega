import 'package:flutter/material.dart';

class DesignScreen extends StatefulWidget {
  const DesignScreen({super.key});

  @override
  State<DesignScreen> createState() => _DesignScreenState();
}

class _DesignScreenState extends State<DesignScreen> {
  double _width = 1200.0;
  double _height = 1500.0;
  final double _pricePerSqm = 50.0;

  double _rx = 0.0;
  double _ry = 0.0;

  double get _area => (_width / 1000) * (_height / 1000);
  double get _totalPrice => _area * _pricePerSqm;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Дизайн окна (3D)'),
        backgroundColor: Colors.blue,
      ),
      body: Column(
        children: [
          Container(
            padding: const EdgeInsets.all(8.0),
            color: Colors.grey[200],
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                IconButton(icon: const Icon(Icons.add_box), onPressed: () {}),
                IconButton(icon: const Icon(Icons.grid_on), onPressed: () {}),
                IconButton(
                  icon: const Icon(Icons.delete, color: Colors.red),
                  onPressed: () {},
                ),
                IconButton(
                  icon: const Icon(Icons.arrow_forward, color: Colors.blue),
                  onPressed: () {},
                ),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              children: [
                Row(
                  children: [
                    const Text('Ширина (мм):'),
                    Expanded(
                      child: Slider(
                        value: _width,
                        min: 500,
                        max: 3000,
                        onChanged: (val) => setState(() => _width = val),
                      ),
                    ),
                    Text('${_width.toInt()}'),
                  ],
                ),
                Row(
                  children: [
                    const Text('Высота (мм):'),
                    Expanded(
                      child: Slider(
                        value: _height,
                        min: 500,
                        max: 3000,
                        onChanged: (val) => setState(() => _height = val),
                      ),
                    ),
                    Text('${_height.toInt()}'),
                  ],
                ),
                Text(
                  'Площадь: ${_area.toStringAsFixed(2)} m² | Price: \$${_totalPrice.toStringAsFixed(2)}',
                  style: const TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(height: 8),
                const Text(
                  'Проведите по окну, чтобы вращать в 3D',
                  style: TextStyle(color: Colors.grey),
                ),
              ],
            ),
          ),
          Expanded(
            child: Center(
              child: GestureDetector(
                onPanUpdate: (details) {
                  setState(() {
                    _ry += details.delta.dx * 0.01;
                    _rx -= details.delta.dy * 0.01;
                  });
                },
                child: Transform(
                  transform: Matrix4.identity()
                    ..setEntry(3, 2, 0.001)
                    ..rotateX(_rx)
                    ..rotateY(_ry),
                  alignment: FractionalOffset.center,
                  child: Container(
                    width: _width / 5,
                    height: _height / 5,
                    decoration: BoxDecoration(
                      border: Border.all(color: Colors.brown[800]!, width: 12),
                      color: Colors.lightBlue[100]!.withValues(alpha: 0.5),
                      boxShadow: const [
                        BoxShadow(
                          color: Colors.black26,
                          blurRadius: 10,
                          spreadRadius: 2,
                        ),
                      ],
                    ),
                    child: Center(
                      child: Container(width: 12, color: Colors.brown[800]),
                    ),
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
