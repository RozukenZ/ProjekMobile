import 'package:flutter/material.dart';

class RadiusSettingsScreen extends StatefulWidget
{
  @override
  _RadiusSettingsScreenState createState() => _RadiusSettingsScreenState();
}

class _RadiusSettingsScreenState extends State<RadiusSettingsScreen>
{
  double _currentRadius = 2.0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        backgroundColor: Colors.black,
        leading: IconButton(
          icon: Icon(Icons.arrow_back, color: Colors.white),
          onPressed: () => Navigator.of(context).pop(),
        ),
        title: Text('Pengaturan Radius', style: TextStyle(color: Colors.white)),
      ),
      body: Padding(
        padding: EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'Radius Pencarian: ${_currentRadius.toStringAsFixed(1)} Km',
              style: TextStyle(color: Colors.white, fontSize: 18),
            ),
            SizedBox(height: 20),
            SliderTheme(
              data: SliderTheme.of(context).copyWith(
                activeTrackColor: Colors.white,
                inactiveTrackColor: Colors.grey[800],
                thumbColor: Colors.purple,
                overlayColor: Colors.purple.withOpacity(0.3),
                thumbShape: RoundSliderThumbShape(enabledThumbRadius: 12.0),
                overlayShape: RoundSliderOverlayShape(overlayRadius: 20.0),
              ),
              child: Slider(
                value: _currentRadius,
                min: 0,
                max: 10,
                divisions: 20,
                onChanged: (value)
                {
                  setState(() {
                    _currentRadius = value;
                  });
                },
              ),
            ),
            SizedBox(height: 40),
            ElevatedButton(
              child: Text(
                'Simpan Radius',
                style: TextStyle(color: Colors.white),
              ),
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.purple,
                padding: EdgeInsets.symmetric(horizontal: 50, vertical: 15),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(30),
                ),
              ),
              onPressed: ()
              {
                // TODO: Implement save functionality
                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(content: Text('Radius disimpan: ${_currentRadius.toStringAsFixed(1)} Km')),
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}