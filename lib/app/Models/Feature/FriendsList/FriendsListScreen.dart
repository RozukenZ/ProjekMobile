import 'package:anvayarencang/app/Models/HomeScreenModel/HomeScreen.dart';
import 'package:flutter/material.dart';


class FriendListScreen extends StatelessWidget
{
  final List<String> friends = [
    'Son Goku',
    'Killua Zoldyck',
    'Levi Ackerman',
    'Megumi Fushiguro',
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
        title: Text('Daftar Teman'),
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: TextField(
              decoration: InputDecoration(
                hintText: 'Cari Teman...',
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
              itemCount: friends.length,
              itemBuilder: (context, index) {
                return FriendListItem(name: friends[index]);
              },
            ),
          ),
        ],
      ),
    );
  }
}

class FriendListItem extends StatelessWidget {
  final String name;

  FriendListItem({required this.name});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(vertical: 8.0, horizontal: 16.0),
      child: Row(
        children: [
          CircleAvatar(
            backgroundColor: Colors.grey[800],
            child: Icon(Icons.person, color: Colors.white),
          ),
          SizedBox(width: 16),
          Text(
            name,
            style: TextStyle(fontSize: 16),
          ),
        ],
      ),
    );
  }
}