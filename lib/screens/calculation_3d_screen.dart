import 'package:flutter/material.dart';

class Calculation3DScreen extends StatefulWidget {
  const Calculation3DScreen({super.key});

  @override
  State<Calculation3DScreen> createState() => _Calculation3DScreenState();
}

class _Calculation3DScreenState extends State<Calculation3DScreen> {
  final TextEditingController _widthController = TextEditingController(
    text: '100',
  );
  final TextEditingController _heightController = TextEditingController(
    text: '150',
  );
  final TextEditingController _depthController = TextEditingController(
    text: '10',
  );

  double _rotationX = 0;
  double _rotationY = 0;

  @override
  void dispose() {
    _widthController.dispose();
    _heightController.dispose();
    _depthController.dispose();
    super.dispose();
  }

  double get width => double.tryParse(_widthController.text) ?? 0.0;
  double get height => double.tryParse(_heightController.text) ?? 0.0;
  double get depth => double.tryParse(_depthController.text) ?? 0.0;

  double get areaM2 => (width * height) / 10000; // cm2 to m2
  double get volumeM3 => (width * height * depth) / 1000000; // cm3 to m3
  double get price => areaM2 * 50; // Arbitrary price of $50 per square meter

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('3D Расчет'),
        backgroundColor: Colors.blue,
      ),
      body: SingleChildScrollView(
        physics: const ClampingScrollPhysics(),
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            children: [
              Row(
                children: [
                  Expanded(
                    child: TextField(
                      controller: _widthController,
                      decoration: const InputDecoration(
                        labelText: 'Ширина (см)',
                        border: OutlineInputBorder(),
                      ),
                      keyboardType: TextInputType.number,
                      onChanged: (value) => setState(() {}),
                    ),
                  ),
                  const SizedBox(width: 8),
                  Expanded(
                    child: TextField(
                      controller: _heightController,
                      decoration: const InputDecoration(
                        labelText: 'Высота (см)',
                        border: OutlineInputBorder(),
                      ),
                      keyboardType: TextInputType.number,
                      onChanged: (value) => setState(() {}),
                    ),
                  ),
                  const SizedBox(width: 8),
                  Expanded(
                    child: TextField(
                      controller: _depthController,
                      decoration: const InputDecoration(
                        labelText: 'Глубина (см)',
                        border: OutlineInputBorder(),
                      ),
                      keyboardType: TextInputType.number,
                      onChanged: (value) => setState(() {}),
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 16),
              SizedBox(
                height: 350,
                child: GestureDetector(
                  onPanUpdate: (details) {
                    setState(() {
                      _rotationY += details.delta.dx * 0.01;
                      _rotationX += details.delta.dy * 0.01;
                    });
                  },
                  child: Center(
                    child: Transform(
                      alignment: FractionalOffset.center,
                      transform: Matrix4.identity()
                        ..setEntry(3, 2, 0.001)
                        ..rotateX(_rotationX)
                        ..rotateY(_rotationY),
                      child: Container(
                        width: width.clamp(10.0, 300.0), // visual clamp
                        height: height.clamp(10.0, 300.0),
                        decoration: BoxDecoration(
                          border: Border.all(
                            color: Colors.blue[900]!,
                            width: depth.clamp(1.0, 50.0),
                          ),
                          color: Colors.lightBlue.withValues(alpha: 0.5),
                          boxShadow: const [
                            BoxShadow(
                              color: Colors.black26,
                              blurRadius: 10,
                              spreadRadius: 2,
                            ),
                          ],
                        ),
                        child: Center(
                          child: Text(
                            '${width}x${height}x$depth',
                            style: const TextStyle(fontWeight: FontWeight.bold),
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
              ),
              const SizedBox(height: 16),
              Card(
                elevation: 4,
                child: Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Column(
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          const Text('Площадь:'),
                          Text(
                            '${areaM2.toStringAsFixed(2)} м²',
                            style: const TextStyle(fontWeight: FontWeight.bold),
                          ),
                        ],
                      ),
                      const SizedBox(height: 8),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          const Text('Объем:'),
                          Text(
                            '${volumeM3.toStringAsFixed(4)} м³',
                            style: const TextStyle(fontWeight: FontWeight.bold),
                          ),
                        ],
                      ),
                      const Divider(),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          const Text(
                            'Примерная стоимость:',
                            style: TextStyle(fontSize: 16),
                          ),
                          Text(
                            '\$${price.toStringAsFixed(2)}',
                            style: const TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.bold,
                              color: Colors.green,
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
