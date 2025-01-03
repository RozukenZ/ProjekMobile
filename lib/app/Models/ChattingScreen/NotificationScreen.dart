import 'package:anvayarencang/app/Models/HomeScreenModel/HomeScreen.dart';
import 'package:flutter/material.dart';


class NotificationScreen extends StatelessWidget
{
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
        title: Text('Notifikasi'),
      ),

    );
  }
}