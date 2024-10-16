import 'package:anvayarencang/app/Models/Login/LoginScreen.dart';
import 'package:flutter/material.dart';

import 'StartUpModel3.dart';

class FriendLocatorForm extends StatelessWidget {
  const FriendLocatorForm({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Image.asset(
                'lib/app/Assets/StartUpAssets/notification-69.png', // Replace with your actual image asset
                height: 200,
              ),
              const SizedBox(height: 20),
              const Text(
                'Lacak Teman Terdekat',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 10),
              const Text(
                'Temukan teman di sekitar Anda dengan lokasi real-time dan lacak mereka dengan mudah!',
                textAlign: TextAlign.center,
                style: TextStyle(color: Colors.white70),
              ),
              const SizedBox(height: 30),
              ElevatedButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => FriendNotificationForm()),
                  );
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.purple, // Update this line
                  foregroundColor: Colors.white, // Add this line
                  minimumSize: const Size(double.infinity, 50),
                ),
                child: const Text('Next'),
              ),
              const SizedBox(height: 20),
              TextButton(
                onPressed: ()
                {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => LoginScreen()),
                  );
                },
                child: const Text(
                  'Already have an account? Log In',
                  style: TextStyle(color: Colors.white70),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}