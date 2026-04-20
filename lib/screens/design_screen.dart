import 'package:flutter/material.dart';

class DesignScreen extends StatelessWidget {
  const DesignScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Window design'),
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
          Expanded(
            child: Center(
              child: Container(
                width: 200,
                height: 300,
                decoration: BoxDecoration(
                  border: Border.all(color: Colors.brown, width: 8),
                  color: Colors.lightBlue[100],
                ),
                child: const Center(child: Text('Design Area')),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
