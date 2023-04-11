import 'dart:math';
import 'package:cafe_gacha/models/cafe.dart';

class GachaHelper {
  static Cafe selectRandomCafe(List<Cafe> cafes) {
    if (cafes.isEmpty) {
      throw Exception('No cafes found');
    }
    Random random = Random();
    int randomIndex = random.nextInt(cafes.length);
    return cafes[randomIndex];
  }
}


