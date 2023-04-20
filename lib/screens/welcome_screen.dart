import 'package:flutter/material.dart';
import 'package:cafe_gacha/screens/gacha_animation_screen.dart';
import 'package:cafe_gacha/services/location_service.dart';
import 'package:flutter/material.dart';

// Import statements ...

class WelcomeScreen extends StatefulWidget {
  @override
  _WelcomeScreenState createState() => _WelcomeScreenState();
}

class _WelcomeScreenState extends State<WelcomeScreen> {
  List<double> _distanceIncrements = [0.1, 0.3, 0.5, 0.8, 1, 2, 3, 5];
  double _selectedDistance = 1;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Cafe Gacha'),
        automaticallyImplyLeading: false,
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              'Welcome to Cafe Gacha!',
              style: TextStyle(fontSize: 24),
            ),
            SizedBox(height: 30),
            DropdownButton<double>(
              value: _selectedDistance,
              items: _distanceIncrements
                  .map((distance) => DropdownMenuItem<double>(
                value: distance,
                child: Text('${distance.toStringAsFixed(1)} km'),
              ))
                  .toList(),
              onChanged: (double? newValue) {
                if (newValue != null) {
                  setState(() {
                    _selectedDistance = newValue;
                  });
                }
              },
            ),
            Text(
              'Selected distance: ${_selectedDistance.toStringAsFixed(1)} km',
              style: TextStyle(fontSize: 18),
            ),
            SizedBox(height: 30),
            ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => GachaAnimationScreen(
                      selectedDistance: _selectedDistance,
                    ),
                  ),
                );
              },
              child: Text('Find a random cafe!'),
            ),
          ],
        ),
      ),
    );
  }
}
