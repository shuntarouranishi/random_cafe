import 'dart:convert';
import 'package:cafe_gacha/models/cafe.dart';
import 'package:http/http.dart' as http;

class CafeService {
  // Replace this with your actual API key
  final String apiKey = 'AIzaSyDU2zpMBnMMB_auKVq0WMhGjSU6Ma5DAp8';

  Future<List<Cafe>> fetchNearbyCafes(double latitude, double longitude) async {
    final String url = 'https://maps.googleapis.com/maps/api/place/nearbysearch/json?location=$latitude,$longitude&radius=1000&type=cafe&key=$apiKey';

    final response = await http.get(Uri.parse(url));

    // Add the print statement here
    print(response.body);

    if (response.statusCode == 200) {
      final List<dynamic> results = jsonDecode(response.body)['results'];

      if (results.isEmpty) {
        throw Exception('No cafes found');
      }

      final List<Cafe> cafes = results.map((result) => Cafe.fromGooglePlaces(result)).toList();
      return cafes;
    } else {
      throw Exception('Failed to fetch nearby cafes');
    }
  }
}
