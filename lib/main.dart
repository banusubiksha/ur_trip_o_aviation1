import 'dart:async';

import 'package:flutter/material.dart';
import 'package:ur_trip_o_aviation/homescreen.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.orange),
        useMaterial3: true,
      ),
      home: SplashScreen(), // Show splash screen initially
    );
  }
}

class SplashScreen extends StatefulWidget {
  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    // Navigate to the main screen after 2 seconds
    Timer(Duration(seconds: 4), () {
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => HomeScreen()),
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.background,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            // Displaying the logo image
            Image.asset(
              'assets/images/logo.png', // Path to your logo image
              width: 250, // Adjust the width as needed
            ),
            SizedBox(height: 20),
            Text(
              'Welcome to App Ur Trip O Aviation\nExplore the world now', // Updated text content
              textAlign: TextAlign.center, // Center align the text
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
                color: Colors.blue, // Change text color
                fontStyle: FontStyle.italic, // Apply italic font style
            ),
            )
          ],


        ),
      ),
    );
  }
}



