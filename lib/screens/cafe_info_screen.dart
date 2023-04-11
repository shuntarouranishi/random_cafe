import 'package:flutter/material.dart';
import 'package:cafe_gacha/models/cafe.dart';
import 'package:cached_network_image/cached_network_image.dart';

class CafeInfoScreen extends StatelessWidget {
  final Cafe cafe;

  CafeInfoScreen({required this.cafe});

  @override
  Widget build(BuildContext context) {
    final String imageUrl = cafe.photoReference != null
        ? 'https://maps.googleapis.com/maps/api/place/photo?maxwidth=400&photoreference=${cafe.photoReference}&key=YOUR_API_KEY'
        : 'assets/default_cafe_image.png'; // Replace with a default image path if the cafe doesn't have an image

    return Scaffold(
      appBar: AppBar(
        title: Text('Cafe Information'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(cafe.name, style: TextStyle(fontSize: 24)),
            SizedBox(height: 16),
            CachedNetworkImage(
              imageUrl: imageUrl,
              placeholder: (context, url) => CircularProgressIndicator(),
              errorWidget: (context, url, error) => Icon(Icons.error),
            ),
            TextButton(
              onPressed: () {
                // TODO: Open Google Maps with the cafe's location
              },
              child: Text('Open in Google Maps'),
            ),
            ElevatedButton(
              onPressed: () {
                Navigator.pop(context);
              },
              child: Text('Try Again'),
            ),
          ],
        ),
      ),
    );
  }
}
