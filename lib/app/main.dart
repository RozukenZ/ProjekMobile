import 'package:anvayarencang/app/Models/NewStartUpUser/StartUpModel.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'AnvayaRencang',
      theme: ThemeData(
        primarySwatch: Colors.purple,
        brightness: Brightness.dark,
      ),
      home: MainScreen(),
    );
  }
}

class MainScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: Center(
        child: Text(
          'AnvayaRencang.',
          style: TextStyle(
            color: Colors.purple[200],
            fontSize: 24,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
    ).then((_) async {
      await Future.delayed(Duration(seconds: 2));
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => Startupmodel()),
      );
    });
  }
}

extension ScaffoldThen on Scaffold {
  Widget then(Future<void> Function(BuildContext context) callback) {
    return FutureBuilder(
      future: Future<void>.value(), // dummy future
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.done) {
          callback(context);
        }
        return this; // return the original Scaffold
      },
    );
  }
}

