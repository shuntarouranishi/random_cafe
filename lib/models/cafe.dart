class Cafe {
  final String name;
  final String? photoReference;
  final double latitude;
  final double longitude;
  final String address;

  Cafe({
    required this.name,
    this.photoReference,
    required this.latitude,
    required this.longitude,
    required this.address,
  });

  factory Cafe.fromGooglePlaces(Map<String, dynamic> data, double distance) {
    return Cafe(
      name: data['name'],
      photoReference: data['photos'] != null
          ? data['photos'][0]['photo_reference']
          : null,
      latitude: data['geometry']['location']['lat'],
      longitude: data['geometry']['location']['lng'],
      address: data['vicinity'],
    );
  }
}
