import 'package:anvayarencang/app/Models/Feature/Feedback/FeedbackScreen.dart';
import 'package:anvayarencang/app/Models/Feature/Notification/NotificationPreferencesScreen.dart';
import 'package:anvayarencang/app/Models/HelpPolicy/HelpCenterScreen.dart';
import 'package:anvayarencang/app/Models/HomeScreenModel/HomeScreen.dart';
import 'package:flutter/material.dart';
import '../UpdateApplication/UpdateApplicationScreen.dart';


class AccountSettingsScreen extends StatelessWidget
{
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: Icon(Icons.arrow_back, color: Colors.white),
          onPressed: ()
          {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => HomeScreen()),
            );
          },
        ),
        title: Text('Pengaturan Akun', style: TextStyle(color: Colors.white)),
        backgroundColor: Colors.black,
      ),
      body: Container(
        color: Colors.black,
        child: Column(
          children: <Widget>[
            SizedBox(height: 20),
            IconButton(
              icon: Icon(Icons.lock, color: Colors.white),
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => AccountSettingsScreen()),
                );
              },
            ),
            Text('Password Baru', style: TextStyle(color: Colors.white)),
            SizedBox(height: 20),
            IconButton(
              icon: Icon(Icons.update, color: Colors.white),
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => UpdateApplicationScreen()),
                );
              },
            ),
            Text('Pembaruan Aplikasi', style: TextStyle(color: Colors.white)),
            SizedBox(height: 20),
            IconButton(
              icon: Icon(Icons.help, color: Colors.white),
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => HelpCenterScreen()),
                );
              },
            ),
            Text('Pusat Bantuan', style: TextStyle(color: Colors.white)),
            SizedBox(height: 20),
            IconButton(
              icon: Icon(Icons.notifications, color: Colors.white),
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => NotificationPreferencesScreen()),
                );
              },
            ),
            Text('Preferensi Notifikasi', style: TextStyle(color: Colors.white)),
            SizedBox(height: 20),
            IconButton(
              icon: Icon(Icons.feedback, color: Colors.white),
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => FeedbackScreen()),
                );
              },
            ),
            Text('Umpan Balik', style: TextStyle(color: Colors.white)),
          ],
        ),
      ),
    );
  }
}

Widget _buildSettingButton(BuildContext context, String title, VoidCallback onPressed)
{
  return Container(
    width: double.infinity,
    margin: EdgeInsets.symmetric(horizontal: 16, vertical: 8),
    child: ElevatedButton(
      onPressed: onPressed,
      child: Text(title, style: TextStyle(color: Colors.white)),
      style: ElevatedButton.styleFrom(
        backgroundColor: Colors.grey[900],
        padding: EdgeInsets.symmetric(vertical: 16),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(8),
        ),
      ),
    ),
  );
}