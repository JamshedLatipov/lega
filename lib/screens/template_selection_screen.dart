import 'package:flutter/material.dart';

class TemplateSelectionScreen extends StatelessWidget {
  const TemplateSelectionScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Template'),
        backgroundColor: Colors.blue,
      ),
      body: Column(
        children: [
          Container(
            color: Colors.blue,
            padding: const EdgeInsets.all(16.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                _buildTabItem('Deraza', Icons.window, true),
                _buildTabItem('Eshik', Icons.door_front_door, false),
                _buildTabItem('Fortochka', Icons.crop_square, false),
              ],
            ),
          ),
          Expanded(
            child: GridView.builder(
              padding: const EdgeInsets.all(16.0),
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                crossAxisSpacing: 16.0,
                mainAxisSpacing: 16.0,
              ),
              itemCount: 6,
              itemBuilder: (context, index) {
                return Card(
                  color: Colors.grey[200],
                  child: Center(
                    child: Icon(
                      Icons.window,
                      size: 64,
                      color: Colors.grey[400],
                    ),
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildTabItem(String title, IconData icon, bool isSelected) {
    return Column(
      children: [
        Icon(icon, color: isSelected ? Colors.white : Colors.white70, size: 32),
        const SizedBox(height: 8),
        Text(
          title,
          style: TextStyle(color: isSelected ? Colors.white : Colors.white70),
        ),
      ],
    );
  }
}
