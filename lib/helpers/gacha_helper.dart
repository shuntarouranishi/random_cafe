import 'dart:math';
import 'package:cafe_gacha/models/cafe.dart';

class GachaHelper {
  static final Random _random = Random();

  static Cafe selectRandomCafe(List<Cafe> cafes) {
    if (cafes.isEmpty) {
      throw Exception('No cafes to choose from');
    }

    int randomIndex = _random.nextInt(cafes.length);
    return cafes[randomIndex];
  }
}





