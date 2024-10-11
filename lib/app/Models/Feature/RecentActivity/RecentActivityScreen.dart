import 'package:anvayarencang/app/Models/HomeScreenModel/HomeScreen.dart';
import 'package:flutter/material.dart';


class RecentActivitiesScreen extends StatelessWidget
{
  final List<Map<String, String>> activities = List.generate(
    4,
        (index) =>
        {
      'title': 'Bertemu dengan Sugeng',
      'time': '09:00 WIB',
      'location': 'Kafe Ambarita, Radius: 200 meter',
    },
  );

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
        title: Text('Aktivitas Terakhir'),
      ),
      body: ListView.builder(
        itemCount: activities.length,
        itemBuilder: (context, index)
        {
          return ActivityListItem(
            title: activities[index]['title']!,
            time: activities[index]['time']!,
            location: activities[index]['location']!,
          );
        },
      ),
    );
  }
}

class ActivityListItem extends StatelessWidget
{
  final String title;
  final String time;
  final String location;

  ActivityListItem(
      {
    required this.title,
    required this.time,
    required this.location,
  });

  @override
  Widget build(BuildContext context)
  {
    return Container(
      padding: EdgeInsets.symmetric(vertical: 12.0, horizontal: 16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Icon(Icons.people, size: 20, color: Colors.white),
              SizedBox(width: 8),
              Text(
                title,
                style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
              ),
            ],
          ),
          SizedBox(height: 4),
          Padding(
            padding: EdgeInsets.only(left: 28),
            child: Row(
              children: [
                Icon(Icons.access_time, size: 16, color: Colors.grey),
                SizedBox(width: 4),
                Text(
                  time,
                  style: TextStyle(fontSize: 14, color: Colors.grey),
                ),
              ],
            ),
          ),
          SizedBox(height: 2),
          Padding(
            padding: EdgeInsets.only(left: 28),
            child: Row(
              children: [
                Icon(Icons.location_on, size: 16, color: Colors.grey),
                SizedBox(width: 4),
                Expanded(
                  child: Text(
                    location,
                    style: TextStyle(fontSize: 14, color: Colors.grey),
                    overflow: TextOverflow.ellipsis,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}