import 'package:flutter/material.dart';
import 'package:cafe_gacha/screens/gacha_animation_screen.dart';
import 'package:cafe_gacha/services/location_service.dart';

class WelcomeScreen extends StatefulWidget {
  @override
  _WelcomeScreenState createState() => _WelcomeScreenState();
}

class _WelcomeScreenState extends State<WelcomeScreen> {
  double _selectedDistance = 500.0;
  List<double> sliderValues = [100, 300, 700, 1000];

  Future<void> _getStarted(BuildContext context) async {
    bool permissionGranted = await LocationService().requestPermission();

    if (permissionGranted) {
      Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => GachaAnimationScreen(
            selectedDistance: _selectedDistance,
            onNoCafesFound: () {
              Navigator.pop(context);
              ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(
                  content: Text('No cafes found within the selected range.'),
                ),
              );
            },
          ),
        ),
      );
    } else {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text('Location permission is required for the app to work.'),
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: Text('Welcome'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              width: 90, // Set the desired width
              height: 180, // Set the desired height
              child: Image.asset('assets/images/cafe-icon.jpg', fit: BoxFit.cover),
            ),
            Text('カフェを探そう！',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),

            SizedBox(height: 30),
            Slider(
              value: _selectedDistance,
              min: 100,
              max: 1000,
              onChanged: (double value) {
                setState(() {
                  _selectedDistance = sliderValues.reduce((a, b) =>
                  (value - a).abs() < (value - b).abs() ? a : b);
                });
              },
            ),
            Text(
              '${_selectedDistance.toInt()}m',
              style: TextStyle(fontSize: 18),
            ),
            SizedBox(height: 30),
            ElevatedButton(
              onPressed: () => _getStarted(context),
              child: Text('ガチャを引く'),
            ),
          ],
        ),
      ),
    );
  }
}
