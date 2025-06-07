import "package:ctrl_alt_tv/theme/app_spacing.dart";
import "package:flutter/material.dart";

class AppTheme {
  static const Color primaryBackgroundColor = Color(0xFF262229);
  
  static ThemeData get darkTheme {
    return ThemeData(
      extensions: const <ThemeExtension<dynamic>>[
        AppSpacing()
      ],
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