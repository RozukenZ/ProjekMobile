import 'package:anvayarencang/app/Models/HomeScreenModel/HomeScreen.dart';
import 'package:flutter/material.dart';

class SuccessScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        backgroundColor: Colors.black,
        leading: IconButton(
          icon: Icon(Icons.arrow_back, color: Colors.white),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset(
              'lib/app/Assets/StartUpAssets/completed-task-8.png', // Sesuaikan dengan path gambar
              height: 200,
            ),
            SizedBox(height: 20),
            Text(
              'Success!',
              style: TextStyle(
                color: Colors.white,
                fontSize: 28,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: 10),
            Text(
              'Congratulations! You have been successfully authenticated',
              style: TextStyle(
                color: Colors.grey,
                fontSize: 16,
              ),
              textAlign: TextAlign.center,
            ),
            SizedBox(height: 30),
            SizedBox(
              width: 200,
              child: ElevatedButton(
                child: Text('Confirm'),
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.purple,
                  padding: EdgeInsets.symmetric(vertical: 15),
                ),
                onPressed: () {
                  // Aksi setelah menekan tombol 'Confirm', misalnya navigasi ke HomeScreen
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => HomeScreen()));
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
