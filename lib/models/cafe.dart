class Cafe {
  final String name;
  final String address;
  final String? photoReference;

  Cafe({required this.name, required this.address, this.photoReference});

  factory Cafe.fromGooglePlaces(Map<String, dynamic> data) {
    final String? photoReference = data['photos'] != null && data['photos'].isNotEmpty
        ? data['photos'][0]['photo_reference']
        : null;

    return Cafe(
      name: data['name'],
      address: data['vicinity'],
      photoReference: photoReference,
    );
  }
}
