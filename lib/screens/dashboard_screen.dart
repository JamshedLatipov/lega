import 'package:flutter/material.dart';

class DashboardScreen extends StatelessWidget {
  const DashboardScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[100],
      appBar: AppBar(
        title: const Text.rich(
          TextSpan(
            children: [
              WidgetSpan(
                child: Icon(Icons.diamond, color: Colors.amber, size: 24),
              ),
              WidgetSpan(child: SizedBox(width: 8)),
              TextSpan(
                text: 'Romchi',
                style: TextStyle(
                  color: Colors.blue,
                  fontWeight: FontWeight.bold,
                  fontSize: 20,
                ),
              ),
              TextSpan(
                text: 'Premium',
                style: TextStyle(
                  color: Colors.amber,
                  fontWeight: FontWeight.bold,
                  fontSize: 20,
                ),
              ),
            ],
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
                  'Buyurtmalar',
                  Icons.edit_document,
                  Colors.blue,
                ),
                _buildDashboardCard(
                  'Mahsulotlar narxi',
                  Icons.monetization_on,
                  Colors.amber,
                ),
                _buildDashboardCard(
                  'Video qo\'llanmalar',
                  Icons.play_circle_fill,
                  Colors.red,
                ),
                _buildDashboardCard('Madellar', Icons.window, Colors.lightBlue),
                _buildDashboardCard('Korxona', Icons.business, Colors.indigo),
                _buildDashboardCard(
                  'Akfa',
                  Icons.branding_watermark,
                  Colors.redAccent,
                ),
              ],
            ),
            const SizedBox(height: 24),
            const Text(
              'Yangiliklar',
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
                  'Yangi versiya chiqdi!',
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
                subtitle: const Text(
                  'Romchi 3D qo\'shildi va hisob kitobdagi kamchiliklar to\'g\'irlandi!',
                ),
                trailing: const Icon(Icons.arrow_forward_ios, size: 16),
                onTap: () {},
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildDashboardCard(String title, IconData icon, Color color) {
    return Card(
      elevation: 2,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
      child: InkWell(
        onTap: () {},
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
