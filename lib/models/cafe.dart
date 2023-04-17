class Cafe {
  final String name;
  final String address;
  final String? photoReference; // Allow null values by changing type to 'String?'
  final double latitude;
  final double longitude;

  Cafe({
    required this.name,
    required this.address,
    this.photoReference, // Remove 'required' keyword
    required this.latitude,
    required this.longitude,
  });

  factory Cafe.fromGooglePlaces(Map<String, dynamic> data) {
    final String? photoReference = data['photos'] != null && data['photos'].isNotEmpty
        ? data['photos'][0]['photo_reference']
        : null;

    return Cafe(
      name: data['name'],
      address: data['vicinity'],
      photoReference: photoReference,
      latitude: data['geometry']['location']['lat'],
      longitude: data['geometry']['location']['lng'],
    );
  }
}
