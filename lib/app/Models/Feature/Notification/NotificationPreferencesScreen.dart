import 'package:flutter/material.dart';

class NotificationPreferencesScreen extends StatefulWidget
{
  @override
  _NotificationPreferencesScreenState createState() => _NotificationPreferencesScreenState();
}

class _NotificationPreferencesScreenState extends State<NotificationPreferencesScreen>
{
  bool _newMessageNotification = true;
  bool _friendRequestNotification = true;
  bool _locationUpdateNotification = true;

  @override
  Widget build(BuildContext context)
  {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        backgroundColor: Colors.black,
        leading: IconButton(
          icon: Icon(Icons.arrow_back, color: Colors.white),
          onPressed: () => Navigator.of(context).pop(),
        ),
        title: Text('Preferensi Notifikasi', style: TextStyle(color: Colors.white)),
      ),
      body: Padding(
        padding: EdgeInsets.all(16.0),
        child: Column(
          children: [
            _buildNotificationToggle(
              'Terima notifikasi pesan baru',
              _newMessageNotification,
                  (value) => setState(() => _newMessageNotification = value),
            ),
            SizedBox(height: 16),
            _buildNotificationToggle(
              'Terima notifikasi permintaan pertemanan',
              _friendRequestNotification,
                  (value) => setState(() => _friendRequestNotification = value),
            ),
            SizedBox(height: 16),
            _buildNotificationToggle(
              'Terima notifikasi pembaruan lokasi teman',
              _locationUpdateNotification,
                  (value) => setState(() => _locationUpdateNotification = value),
            ),
            Spacer(),
            ElevatedButton(
              child: Text(
                'Simpan',
                style: TextStyle(color: Colors.white),
              ),
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.purple,
                minimumSize: Size(double.infinity, 50),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
              ),
              onPressed: ()
              {
                // TODO: Implement save functionality
                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(content: Text('Preferensi notifikasi disimpan')),
                );
              },
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildNotificationToggle(String title, bool value, Function(bool) onChanged)
  {
    return Container(
      decoration: BoxDecoration(
        color: Colors.grey[900],
        borderRadius: BorderRadius.circular(10),
      ),
      child: SwitchListTile(
        title: Text(title, style: TextStyle(color: Colors.white)),
        value: value,
        onChanged: onChanged,
        activeColor: Colors.purple,
        contentPadding: EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      ),
    );
  }
}