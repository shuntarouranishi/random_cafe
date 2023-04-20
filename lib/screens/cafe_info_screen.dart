import 'package:flutter/material.dart';
import 'package:cafe_gacha/models/cafe.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:cafe_gacha/main.dart'; // Replace 'main.dart' with the appropriate file if needed
import 'package:cafe_gacha/screens/welcome_screen.dart'; // Replace 'welcome_screen.dart' with the appropriate file if needed


String formatDistance(double distanceInKm) {
  if (distanceInKm < 1) {
    int distanceInMeters = (distanceInKm * 1000).round();
    return '$distanceInMeters m';
  } else {
    return '${distanceInKm.toStringAsFixed(1)} km';
  }
}

class CafeInfoScreen extends StatelessWidget {
  final Cafe cafe;

  CafeInfoScreen({required this.cafe});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Cafe Information')),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              child: buildImage(context, cafe),
              width: MediaQuery.of(context).size.width,
              height: 200,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20),
              ),
              clipBehavior: Clip.antiAlias,
            ),
            const SizedBox(height: 20),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: Text(
                cafe.name,
                style: const TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
              ),
            ),
            const SizedBox(height: 10),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: Text(
                cafe.address,
                style: const TextStyle(fontSize: 18),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget buildImage(BuildContext context, Cafe cafe) {
    String apiKey = 'AIzaSyBsDHGQOJMaCjubsXeUCksfDTCGbQC1Y4U';

    if (cafe.photoReference != null) {
      final imageUrl =
          'https://maps.googleapis.com/maps/api/place/photo?maxwidth=400&photoreference=${cafe.photoReference}&key=$apiKey';
      return Image.network(
        imageUrl,
        errorBuilder: (BuildContext context, Object exception, StackTrace? stackTrace) {
          return Image.asset('assets/images/cafe_placeholder.png');
        },
      );
    } else {
      return Image.asset('assets/images/cafe_placeholder.png');
    }
  }

