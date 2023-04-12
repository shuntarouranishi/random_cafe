import 'package:flutter/material.dart';
import 'package:cafe_gacha/widgets/app_theme.dart';
import 'package:cafe_gacha/screens/welcome_screen.dart';

void main() {
  runApp(CafeGachaApp());
}

class CafeGachaApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Cafe Gacha',
      theme: appTheme,
      home: WelcomeScreen(),
    );
  }
}