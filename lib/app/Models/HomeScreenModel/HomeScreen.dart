import 'package:anvayarencang/app/Models/ChattingScreen/ChatListScreen.dart';
import 'package:anvayarencang/app/Models/ChattingScreen/NotificationScreen.dart';
import 'package:anvayarencang/app/Models/Feature/Events/EventsScreen.dart';
import 'package:anvayarencang/app/Models/Feature/FavoriteLocation/FavoriteLocationScreen.dart';
import 'package:anvayarencang/app/Models/Feature/FindFriends/FindFriendsScreen.dart';
import 'package:anvayarencang/app/Models/Feature/FriendGeolocation/FriendGeolocationScreen.dart';
import 'package:anvayarencang/app/Models/Feature/FriendsList/FriendsListScreen.dart';
import 'package:anvayarencang/app/Models/Feature/QR/QrCodeScreen.dart';
import 'package:anvayarencang/app/Models/Feature/RecentActivity/RecentActivityScreen.dart';
import 'package:anvayarencang/app/Models/Feature/Setting/SettingScreen.dart';
import 'package:flutter/material.dart';

import 'ScrollableMenuGrid.dart';

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    List<MenuItemData> menuItems = [
      MenuItemData(
        icon: Icons.qr_code,
        label: 'QR Pindai',
        color: Colors.teal,
        onTap: () => Navigator.push(context, MaterialPageRoute(builder: (context) => QRCodeScreen())),
      ),
      MenuItemData(
        icon: Icons.people,
        label: 'Daftar Teman',
        color: Colors.blue,
        onTap: () => Navigator.push(context, MaterialPageRoute(builder: (context) => FriendListScreen())),
      ),
      MenuItemData(
        icon: Icons.event,
        label: 'Event',
        color: Colors.yellow,
        onTap: () => Navigator.push(context, MaterialPageRoute(builder: (context) => EventScreen())),
      ),
      MenuItemData(
        icon: Icons.favorite,
        label: 'Lokasi Favorit',
        color: Colors.pink,
        onTap: () => Navigator.push(context, MaterialPageRoute(builder: (context) => FavoriteLocationsScreen())),
      ),
      MenuItemData(
        icon: Icons.settings,
        label: 'Pengaturan',
        color: Colors.orange,
        onTap: () => Navigator.push(context, MaterialPageRoute(builder: (context) => AccountSettingsScreen())),
      ),
      MenuItemData(
        icon: Icons.history,
        label: 'Aktivitas Terakhir',
        color: Colors.purple,
        onTap: () => Navigator.push(context, MaterialPageRoute(builder: (context) => RecentActivitiesScreen())),
      ),
      // Add more menu items as needed
    ];

    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: Icon(Icons.arrow_back, color: Colors.white),
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => HomeScreen()),
            );
          },
        ),
        title: Text('AnvayaRencang.', style: TextStyle(color: Colors.purple, fontWeight: FontWeight.bold)),
        actions: [
          IconButton(
            icon: Icon(Icons.notifications, color: Colors.white),
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => NotificationScreen()),
              );
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
                  // Scrollable menu items
                  ScrollableMenuGrid(menuItems: menuItems),
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
                  _buildNavItem(Icons.location_on, true, () {
                    // navigate to location page
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => FriendGeolocationScreen()),
                    );
                  }),
                  _buildNavItem(Icons.search, false, () {
                    // navigate to search page
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => FindFriendsScreen()),
                    );
                  }),
                  _buildNavItem(Icons.chat_bubble, false, () {
                    // navigate to chat page
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => ChatListScreen()),
                    );
                  }),
                  _buildNavItem(Icons.person, false, () {
                    // navigate to person page
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => FriendListScreen()),
                    );
                  }),
                ],
              ),
            ),
          )
        ],
      ),
    );
  }

  Widget _buildNavItem(IconData icon, bool isSelected, VoidCallback onTap) {
    return GestureDetector(
      onTap: onTap,
      child: Icon(icon, color: isSelected ? Colors.blue : Colors.grey),
    );
  }
}