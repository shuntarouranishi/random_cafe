import 'package:flutter/material.dart';
import 'package:cafe_gacha/models/cafe.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:cafe_gacha/main.dart'; // Replace 'main.dart' with the appropriate file if needed
import 'package:cafe_gacha/screens/welcome_screen.dart'; // Replace 'welcome_screen.dart' with the appropriate file if needed




class CafeInfoScreen extends StatelessWidget {
  final Cafe cafe;

  CafeInfoScreen({required this.cafe});

  Widget buildCafeImage(BuildContext context) {
    if (cafe.photoReference != null) {
      final String apiKey = 'AIzaSyD2mZTUbEy4F7Gp-C9pZf9Gc097Fjg7CSQ';
      final String imageUrl =
          'https://maps.googleapis.com/maps/api/place/photo?maxwidth=400&photoreference=${cafe.photoReference}&key=$apiKey';

      return CachedNetworkImage(
        imageUrl: imageUrl,
        placeholder: (context, url) => CircularProgressIndicator(),
        errorWidget: (context, url, error) => Icon(Icons.error),
      );
    } else {
      return Icon(Icons.image_not_supported);
    }
  }

  Future<void> _openGoogleMaps(double latitude, double longitude) async {
    final String googleMapsUrl = 'https://maps.google.com/?q=$latitude,$longitude';
    if (await canLaunch(googleMapsUrl)) {
      await launch(googleMapsUrl);
    } else {
      throw 'Could not launch $googleMapsUrl';
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Cafe Information'),
        automaticallyImplyLeading: false, // Add this line to remove the back button
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(cafe.name, style: TextStyle(fontSize: 24)),
            Text(cafe.address, style: TextStyle(fontSize: 16)),
            SizedBox(height: 16),
            buildCafeImage(context),
            SizedBox(height: 16),
            TextButton(
              onPressed: () {
                _openGoogleMaps(cafe.latitude, cafe.longitude); // Use latitude and longitude from the cafe object
              },
              child: Text('Open in Google Maps'),
            ),

            ElevatedButton(
              onPressed: () {
                Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(builder: (context) => WelcomeScreen()), // Replace 'WelcomeScreen()' with your welcome screen widget
                );
              },
              child: Text('Try Again'),
            ),



          ],
        ),
      ),
    );
  }
}
