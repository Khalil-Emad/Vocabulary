import 'package:flutter/material.dart';

class AppTheme {
  static final ThemeData darkTheme = ThemeData(
    scaffoldBackgroundColor: Colors.black, // Background color
    primaryColor: Colors.teal, // Primary color for buttons and highlights
    textTheme: const TextTheme(
      displayLarge: TextStyle(
        fontSize: 28,
        fontWeight: FontWeight.bold,
        color: Colors.white, // Main title color
      ),
      bodyLarge: TextStyle(
        fontSize: 16,
        color: Colors.white70, // Subtitle and body text color
      ),
      labelLarge: TextStyle(
        fontSize: 18,
        fontWeight: FontWeight.bold,
        color: Colors.white, // Button text color
      ),
    ),
    elevatedButtonTheme: ElevatedButtonThemeData(
      style: ElevatedButton.styleFrom(
        foregroundColor: Colors.white, backgroundColor: Colors.teal, // Button text color
        minimumSize: const Size(double.infinity, 50), // Full-width button
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(8), // Rounded corners
        ),
      ),
    ),
  );
}
