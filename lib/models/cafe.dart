class Cafe {
  final String id;
  final String name;
  final String vicinity;
  final double latitude;
  final double longitude;
  final List<String> photos;
  double? distance; // Updated the 'distance' attribute to be nullable

  Cafe({
    required this.id,
    required this.name,
    required this.vicinity,
    required this.latitude,
    required this.longitude,
    required this.photos,
  });

  factory Cafe.fromGooglePlaces(Map<String, dynamic> json, String apiKey) {
    // Extract latitude and longitude
    final lat = json['geometry']['location']['lat'];
    final lng = json['geometry']['location']['lng'];

    // Extract photo reference if available
    final photoRef = json['photos'] != null
        ? json['photos'][0]['photo_reference']
        : null;

    // Build photo URLs
    final List<String> photoUrls = [];

    if (photoRef != null) {
      photoUrls.add(
          photoRef); // Store only the photo reference, not the entire URL
    }

    return Cafe(
      id: json['place_id'],
      name: json['name'],
      vicinity: json['vicinity'],
      latitude: lat,
      longitude: lng,
      photos: photoUrls,
    );
  }
}