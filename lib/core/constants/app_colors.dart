import 'package:flutter/material.dart';

class AppColors {
  static const Color black = Color(0xFF33323A);

  static const Color red = Color(0xFFB00020);

  static const gradientBlack = LinearGradient(
    begin: Alignment.topCenter,
    end: Alignment.bottomCenter,
    colors: [
      Colors.black87,
      Colors.transparent,
    ],
    stops: [0.1, 0.5],
  );
}
