import 'package:cafe_gacha/models/cafe.dart';
import 'package:cafe_gacha/screens/cafe_info_screen.dart';
import 'package:cafe_gacha/services/cafe_service.dart';
import 'package:cafe_gacha/services/location_service.dart';
import 'package:geolocator/geolocator.dart';
import 'package:flutter/material.dart';

// Make sure you have the GachaHelper class imported or defined
import 'package:cafe_gacha/helpers/gacha_helper.dart';

class GachaAnimationScreen extends StatefulWidget {
  @override
  _GachaAnimationScreenState createState() => _GachaAnimationScreenState();
}

class _GachaAnimationScreenState extends State<GachaAnimationScreen> {
  final LocationService locationService = LocationService();
  final CafeService cafeService = CafeService();

  @override
  void initState() {
    super.initState();
    performGacha();
  }

  Future<void> performGacha() async {
    try {
      Position position = await locationService.getCurrentLocation();
      List<Cafe> cafes = await cafeService.fetchNearbyCafes(
        position.latitude,
        position.longitude,
      );
      Cafe selectedCafe = GachaHelper.selectRandomCafe(cafes);
      // TODO: Add gacha animation logic and duration
      // You can use a timer, a Future.delayed, or an animation
      // After the animation, navigate to the Cafe Information Display Screen
      Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => CafeInfoScreen(cafe: selectedCafe),
        ),
      );
    } catch (e) {
      print(e);
      // TODO: Show an error message or retry the gacha process
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            // Add gacha animation or placeholder here
            CircularProgressIndicator(),
            Text('Drawing a random cafe...'),
          ],
        ),
      ),
    );
  }
}
