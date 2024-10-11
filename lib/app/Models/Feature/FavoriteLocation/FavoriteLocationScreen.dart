import 'package:anvayarencang/app/Models/HomeScreenModel/HomeScreen.dart';
import 'package:flutter/material.dart';

class FavoriteLocationsScreen extends StatelessWidget
{
  final List<Map<String, String>> locations = [
    {
      'name': 'Rumah Sianida',
      'address': 'Jl. Mawar No.10 Malang',
      'icon': 'home',
    },
    {
      'name': 'Kantor Jessika Wongso',
      'address': 'Jl. Lapis Legit No.4 Malang',
      'icon': 'business',
    },
  ];

  @override
  Widget build(BuildContext context)
  {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          onPressed: ()
          {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => HomeScreen()),
            );
          },
        ),
        title: Text('Lokasi Favorit'),
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: TextField(
              decoration: InputDecoration(
                hintText: 'Cari Event...',
                prefixIcon: Icon(Icons.search),
                filled: true,
                fillColor: Colors.grey[900],
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(30),
                  borderSide: BorderSide.none,
                ),
              ),
            ),
          ),
          Expanded(
            child: ListView.builder(
              itemCount: locations.length,
              itemBuilder: (context, index)
              {
                return LocationListItem(
                  name: locations[index]['name']!,
                  address: locations[index]['address']!,
                  icon: locations[index]['icon']!,
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}

class LocationListItem extends StatelessWidget {
  final String name;
  final String address;
  final String icon;

  LocationListItem({
    required this.name,
    required this.address,
    required this.icon,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(vertical: 8.0, horizontal: 16.0),
      child: Row(
        children: [
          Icon(
            icon == 'home' ? Icons.home : Icons.business,
            size: 30,
            color: Colors.white,
          ),
          SizedBox(width: 16),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  name,
                  style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                ),
                Text(
                  address,
                  style: TextStyle(fontSize: 14, color: Colors.grey),
                ),
              ],
            ),
          ),
          Icon(Icons.favorite, color: Colors.red),
          SizedBox(width: 8),
          Icon(Icons.more_vert),
        ],
      ),
    );
  }
}