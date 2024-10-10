import 'package:flutter/material.dart';

class FriendNotificationForm extends StatelessWidget {
  const FriendNotificationForm({Key? key}) : super(key: key);

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
                'assets/friend_notification_image.png', // Replace with your actual image asset
                height: 200,
                color: Colors.white, // Adjust if needed to match the purple tint
              ),
              const SizedBox(height: 20),
              const Text(
                'Notifikasi Teman Dekat',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 10),
              const Text(
                'Dapatkan notifikasi saat teman berada di dekat Anda, sesuai radius yang Anda tentukan!',
                textAlign: TextAlign.center,
                style: TextStyle(color: Colors.grey),
              ),
              const SizedBox(height: 30),
              ElevatedButton(
                onPressed: () {
                  // Add navigation logic here
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
                onPressed: () {
                  // Add login logic here
                },
                child: const Text(
                  'Already have an account? Log In',
                  style: TextStyle(color: Colors.grey),
                ),
              ),
              const SizedBox(height: 20),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(
                    width: 8,
                    height: 8,
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      color: Colors.grey,
                    ),
                  ),
                  const SizedBox(width: 8),
                  Container(
                    width: 8,
                    height: 8,
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      color: Colors.purple,
                    ),
                  ),
                  // Add more indicators if needed
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}