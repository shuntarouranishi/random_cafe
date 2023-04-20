import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:cafe_gacha/models/cafe.dart';

class CafeService {
  final String apiKey = 'AIzaSyBsDHGQOJMaCjubsXeUCksfDTCGbQC1Y4U';

  Future<List<Cafe>> getCafes(double latitude, double longitude) async {
    final url =
        'https://maps.googleapis.com/maps/api/place/nearbysearch/json?location=$latitude,$longitude&radius=1500&type=cafe&key=$apiKey';
    final response = await http.get(Uri.parse(url));
    final data = jsonDecode(response.body);

    if (data['status'] == 'OK') {
      final List<dynamic> results = data['results'];
      final List<Cafe> cafes = results.map((result) => Cafe.fromGooglePlaces(result, _calculateDistance(latitude, longitude, result))).toList();
      return cafes;
    } else {
      throw Exception('No Cafes to choose from');
    }
  }

  double _calculateDistance(double startLatitude, double startLongitude, Map<String, dynamic> result) {
    final double endLatitude = result['geometry']['location']['lat'];
    final double endLongitude = result['geometry']['location']['lng'];
    final double distanceInDegrees = sqrt(pow(startLatitude - endLatitude, 2) + pow(startLongitude - endLongitude, 2));
    final double distanceInMeters = distanceInDegrees * 111139;

    return distanceInMeters;
  }
}
