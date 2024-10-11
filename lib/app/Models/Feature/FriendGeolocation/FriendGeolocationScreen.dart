import 'package:anvayarencang/app/Models/HomeScreenModel/HomeScreen.dart';
import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class FriendGeolocationScreen extends StatefulWidget
{
  @override
  _FriendGeolocationScreenState createState() => _FriendGeolocationScreenState();
}

class _FriendGeolocationScreenState extends State<FriendGeolocationScreen>
{
  late GoogleMapController mapController;

  final LatLng _center = const LatLng(-7.9666, 112.6326); // Malang, Indonesia

  void _onMapCreated(GoogleMapController controller)
  {
    mapController = controller;
  }

  @override
  Widget build(BuildContext context)
  {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: Icon(Icons.arrow_back, color: Colors.white),
          onPressed: () {
            showDialog(
              context: context,
              builder: (context) {
                return AlertDialog(
                  title: Text('Confirmation'),
                  content: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      ElevatedButton(
                        child: Text('Tidak'),
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.grey,
                          minimumSize: Size(100, 40),
                        ),
                        onPressed: ()
                        {
                          // Handle 'No' button press
                        },
                      ),
                      SizedBox(height: 10),
                      ElevatedButton(
                        child: Text('Ya'),
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.purple,
                          minimumSize: Size(100, 40),
                        ),
                        onPressed: ()
                        {
                          Navigator.push(
                            context,
                            MaterialPageRoute(builder: (context) => HomeScreen()),
                          );
                        },
                      ),
                    ],
                  ),
                );
              },
            );
          },
        ),
        title: Text('Geolokasi Teman', style: TextStyle(color: Colors.white)),
      ),
      body: Stack(
        children: [
          GoogleMap(
            onMapCreated: _onMapCreated,
            initialCameraPosition: CameraPosition(
              target: _center,
              zoom: 14.0,
            ),
            markers: {
              Marker(
                markerId: MarkerId('friend1'),
                position: LatLng(-7.9666, 112.6326),
                icon: BitmapDescriptor.defaultMarkerWithHue(BitmapDescriptor.hueRed),
              ),
              Marker(
                markerId: MarkerId('friend2'),
                position: LatLng(-7.9700, 112.6400),
                icon: BitmapDescriptor.defaultMarkerWithHue(BitmapDescriptor.hueRed),
              ),
            },
          ),
          Center(
            child: Container(
              margin: EdgeInsets.symmetric(horizontal: 20),
              padding: EdgeInsets.all(16),
              decoration: BoxDecoration(
                color: Colors.black.withOpacity(0.7),
                borderRadius: BorderRadius.circular(10),
              ),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Text(
                    'Apakah Anda yakin ingin keluar?',
                    style: TextStyle(color: Colors.white, fontSize: 16),
                    textAlign: TextAlign.center,
                  ),
                  SizedBox(height: 20),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      ElevatedButton(
                        child: Text('Tidak'),
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.grey,
                          minimumSize: Size(100, 40),
                        ),
                        onPressed: () {
                          // Handle 'No' button press
                        },
                      ),
                      ElevatedButton(
                        child: Text('Ya'),
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.purple,
                          minimumSize: Size(100, 40),
                        ),
                        onPressed: () {
                          // Handle 'Yes' button press
                        },
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
      bottomNavigationBar: Container(
        padding: EdgeInsets.all(16),
        child: ElevatedButton(
          child: Text('Lacak Teman'),
          style: ElevatedButton.styleFrom(
            backgroundColor: Colors.purple,
            minimumSize: Size(double.infinity, 50),
          ),
          onPressed: ()
          {
            // Handle 'Track Friend' button press
          },
        ),
      ),
    );
  }
}