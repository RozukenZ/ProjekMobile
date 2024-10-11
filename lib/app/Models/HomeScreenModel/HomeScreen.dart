import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget
{
  @override
  Widget build(BuildContext context)
  {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: Icon(Icons.arrow_back, color: Colors.white),
          onPressed: ()
          {
            // Handle back button press
          },
        ),
        title: Text('AnvayaRencang.', style: TextStyle(color: Colors.purple, fontWeight: FontWeight.bold)),
        actions: [
          IconButton(
            icon: Icon(Icons.notifications, color: Colors.white),
            onPressed: ()
            {
              // Handle notification button press
            },
          ),
        ],
      ),
      body: Column(
        children: [
          Expanded(
            child: SingleChildScrollView(
              child: Column(
                children: [
                  // Placeholder for the illustration
                  Container(
                    height: 200,
                    color: Colors.grey[900],
                    child: Center(child: Text('Map Illustration Placeholder')),
                  ),
                  SizedBox(height: 20),
                  // Menu items
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      _buildMenuItem(Icons.qr_code, 'QR Pindai', Colors.teal),
                      _buildMenuItem(Icons.people, 'Daftar Teman', Colors.blue),
                      _buildMenuItem(Icons.event, 'Event', Colors.yellow),
                    ],
                  ),
                  SizedBox(height: 20),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      _buildMenuItem(Icons.favorite, 'Lokasi Favorit', Colors.pink),
                      _buildMenuItem(Icons.settings, 'Pengaturan', Colors.orange),
                      _buildMenuItem(Icons.history, 'Aktivitas Terakhir', Colors.purple),
                    ],
                  ),
                ],
              ),
            ),
          ),
          // Bottom Navigation Bar
          Container(
            color: Colors.grey[900],
            child: Padding(
              padding: const EdgeInsets.symmetric(vertical: 8.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  _buildNavItem(Icons.location_on, true),
                  _buildNavItem(Icons.search, false),
                  _buildNavItem(Icons.chat_bubble, false),
                  _buildNavItem(Icons.person, false),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildMenuItem(IconData icon, String label, Color color)
  {
    return Column(
      children: [
        Container(
          padding: EdgeInsets.all(12),
          decoration: BoxDecoration(
            color: color,
            shape: BoxShape.circle,
          ),
          child: Icon(icon, color: Colors.white, size: 30),
        ),
        SizedBox(height: 8),
        Text(label, style: TextStyle(fontSize: 12)),
      ],
    );
  }

  Widget _buildNavItem(IconData icon, bool isActive)
  {
    return Icon(
      icon,
      color: isActive ? Colors.purple : Colors.grey,
      size: 30,
    );
  }
}