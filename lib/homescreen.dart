import 'package:flutter/material.dart';
import 'package:ur_trip_o_aviation/jetsearch.dart';

void main() {
  runApp(HomePage());
}

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: HomeScreen(),
    );
  }
}

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.transparent,
      body: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage('assets/images/bgimg.jpg'),
            fit: BoxFit.fill,
          ),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            Padding(
              padding: const EdgeInsets.only(bottom: 16.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  ElevatedButton(
                    onPressed: () {
                      // Action for the first button
                    },
                    style: ElevatedButton.styleFrom(
                      primary: Colors.orange,
                    ),
                    child: Text(
                      'Book My flight',
                      style: TextStyle(color: Colors.white),
                    ),
                  ),
                  ElevatedButton(
                    onPressed: () {
                      // Action for the second
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => FlightSearchPage()),
                      );
                    },
                    style: ElevatedButton.styleFrom(
                      primary: Colors.orange,
                    ),
                    child: Text(
                      'Book My private jet',
                      style: TextStyle(color: Colors.white),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
