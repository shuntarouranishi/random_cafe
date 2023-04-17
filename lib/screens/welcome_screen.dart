import 'package:flutter/material.dart';
import 'package:cafe_gacha/screens/gacha_animation_screen.dart';
import 'package:cafe_gacha/services/location_service.dart';
import 'package:flutter/material.dart';
// Add other necessary imports


class WelcomeScreen extends StatelessWidget {
  Future<void> _getStarted(BuildContext context) async {
    bool permissionGranted = await LocationService().requestPermission();

    if (permissionGranted) {
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => GachaAnimationScreen()),
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
        title: Text('Welcome'),
        automaticallyImplyLeading: false, // Add this line to remove the back button
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'カフェを探そう！',
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
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
