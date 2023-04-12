import 'package:flutter/material.dart';
import 'package:cafe_gacha/models/cafe.dart';
import 'package:cached_network_image/cached_network_image.dart';

class CafeInfoScreen extends StatelessWidget {
  final Cafe cafe;

  CafeInfoScreen({required this.cafe});

  Widget buildCafeImage(BuildContext context) {
    if (cafe.photoReference != null) {
      final String apiKey = 'AIzaSyDU2zpMBnMMB_auKVq0WMhGjSU6Ma5DAp8';
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

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Cafe Information'),
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
