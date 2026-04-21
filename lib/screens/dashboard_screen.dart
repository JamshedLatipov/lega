import 'package:flutter/material.dart';
import 'calculation_3d_screen.dart';

class DashboardScreen extends StatelessWidget {
  const DashboardScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[100],
      appBar: AppBar(
        title: const Text(
          'Lega',
          style: TextStyle(
            color: Color(0xFFe63946),
            fontWeight: FontWeight.bold,
            fontSize: 24,
          ),
        ),
        centerTitle: true,
        backgroundColor: Colors.white,
        elevation: 0,
        leading: IconButton(
          icon: const Icon(Icons.menu, color: Colors.blue),
          onPressed: () {},
        ),
        actions: [
          IconButton(
            icon: const Icon(Icons.language, color: Colors.red),
            onPressed: () {},
          ),
        ],
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            GridView.count(
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              crossAxisCount: 2,
              crossAxisSpacing: 16.0,
              mainAxisSpacing: 16.0,
              childAspectRatio: 1.1,
              children: [
                _buildDashboardCard(
                  'Заказы',
                  Icons.edit_document,
                  const Color(0xFFe63946),
                  null,
                ),
                _buildDashboardCard(
                  'Цены на продукцию',
                  Icons.monetization_on,
                  const Color(0xFF1d3557),
                  null,
                ),
                _buildDashboardCard(
                  'Видеоуроки',
                  Icons.play_circle_fill,
                  const Color(0xFFe63946),
                  null,
                ),
                _buildDashboardCard(
                  'Модели',
                  Icons.window,
                  const Color(0xFF1d3557),
                  () => Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const Calculation3DScreen(),
                    ),
                  ),
                ),
                _buildDashboardCard(
                  'Компания',
                  Icons.business,
                  const Color(0xFFe63946),
                  null,
                ),
                _buildDashboardCard(
                  'Akfa',
                  Icons.branding_watermark,
                  const Color(0xFF1d3557),
                  null,
                ),
              ],
            ),
            const SizedBox(height: 24),
            const Text(
              'Новости',
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 16),
            Card(
              elevation: 2,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(16),
              ),
              child: ListTile(
                contentPadding: const EdgeInsets.all(16),
                leading: Container(
                  padding: const EdgeInsets.all(8),
                  decoration: BoxDecoration(
                    color: Colors.blue[50],
                    shape: BoxShape.circle,
                  ),
                  child: const Icon(Icons.newspaper, color: Colors.blue),
                ),
                title: const Text(
                  'Вышла новая версия!',
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
                subtitle: const Text(
                  'Добавлен Romchi 3D и исправлены ошибки в расчетах!',
                ),
                trailing: const Icon(Icons.arrow_forward_ios, size: 16),
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const Calculation3DScreen(),
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildDashboardCard(
    String title,
    IconData icon,
    Color color,
    VoidCallback? onTap,
  ) {
    return Card(
      elevation: 2,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
      child: InkWell(
        onTap: onTap ?? () {},
        borderRadius: BorderRadius.circular(16),
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(icon, size: 48, color: color),
              const SizedBox(height: 16),
              Flexible(
                child: Text(
                  title,
                  textAlign: TextAlign.center,
                  style: const TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 15,
                  ),
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
