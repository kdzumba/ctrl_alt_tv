import "package:flutter/material.dart";

class AppTheme {
  static const Color primaryBackgroundColor = Color(0xFF262229);
  
  static ThemeData get darkTheme {
    return ThemeData(
      primaryColor: primaryBackgroundColor,

      textTheme: const TextTheme(
        displaySmall: TextStyle(
          color: Colors.white,
          fontSize: 18
        ),
        displayMedium: TextStyle(
          color: Colors.white,
          fontSize: 24
        )
      )
    );
  }
}