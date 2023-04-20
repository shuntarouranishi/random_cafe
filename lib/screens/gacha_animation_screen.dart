import 'dart:async';
import 'dart:math';
import 'package:flutter/material.dart';
import 'package:cafe_gacha/models/cafe.dart';

class GachaAnimationScreen extends StatefulWidget {
  final double? selectedDistance;

  GachaAnimationScreen({this.selectedDistance});

  @override
  _GachaAnimationScreenState createState() => _GachaAnimationScreenState();
}

class _GachaAnimationScreenState extends State<GachaAnimationScreen> {
  Cafe? _selectedCafe;
  Timer? _timer;
  bool _isAnimating = false;
  List<Cafe> _cafeList = [];

  @override
  void initState() {
    super.initState();

    // Dummy data for demonstration purposes
    _cafeList = [
      Cafe(
        name: 'Cafe 1',
        photoReference: '123',
        latitude: 0,
        longitude: 0,
        address: '123 Example Street',
      ),
      Cafe(
        name: 'Cafe 2',
        photoReference: '456',
        latitude: 0,
        longitude: 0,
        address: '456 Example Street',
      ),
      Cafe(
        name: 'Cafe 3',
        photoReference: '789',
        latitude: 0,
        longitude: 0,
        address: '789 Example Street',
      ),
    ];

    _startGachaAnimation();
  }

  @override
  void dispose() {
    _timer?.cancel();
    super.dispose();
  }

  void _startGachaAnimation() {
    setState(() {
      _isAnimating = true;
    });

    Future.delayed(const Duration(milliseconds: 2500), () {
      if (!mounted) return;

      List<Cafe> filteredCafes = filterCafesByDistance(_cafeList, widget.selectedDistance!);

      if (filteredCafes.isNotEmpty) {
        final random = Random();
        final index = random.nextInt(filteredCafes.length);
        setState(() {
          _selectedCafe = filteredCafes[index];
        });
      } else {
        setState(() {
          _selectedCafe = null;
        });
      }

      setState(() {
        _isAnimating = false;
      });
    });
  }

  List<Cafe> filterCafesByDistance(List<Cafe> cafes, double distance) {
    // Calculate the distance and filter the cafes here.
    // Replace the dummy implementation with your actual implementation.
    return cafes.where((cafe) => true).toList();
  }





  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Gacha Animation')),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            if (_selectedCafe != null)
              Container(
                child: buildImage(context, _selectedCafe!),
                width: 200,
                height: 200,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20),
                ),
                clipBehavior: Clip.antiAlias,
              ),
            const SizedBox(height: 20),
            Text(
              _selectedCafe?.name ?? 'Cafe',
              style: const TextStyle(fontSize: 24),
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
          'https://maps.googleapis.com/maps/api/place/photo?maxwidth=400&photoreference=${cafe
          .photoReference}&key=$apiKey';
      return Image.network(
        imageUrl,
        errorBuilder: (BuildContext context, Object exception,
            StackTrace? stackTrace) {
          return Image.asset('assets/images/cafe_placeholder.png');
        },
      );
    } else {
      return Image.asset('assets/images/cafe_placeholder.png');
    }
  }
}
