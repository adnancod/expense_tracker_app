import 'package:flutter/material.dart';

class MyTheme{

  final lightColorScheme = ThemeData(
    colorScheme: ColorScheme(
        brightness: Brightness.light,
        primary: Color(0xFF00B2E7),        // Primary color (e.g., app bar, buttons)
        onPrimary: Colors.white,           // Text/icon color on primary color

        secondary: Color(0xFFE064F7),      // Accent color (e.g., FAB, switches)
        onSecondary: Colors.black,         // Text/icon color on secondary

        tertiary: Color(0xFFFF8D6C),       // Optional third accent (for special cases)

        surface: Colors.grey.shade100,
        onSurface: Colors.black,                  // Text/icon on background

        error: Colors.red,                 // Error color
        onError: Colors.white              // Text/icon on error
    )
  );

  final darkColorScheme = ThemeData(
    colorScheme: ColorScheme(
        brightness: Brightness.dark,
        primary: Color(0xFF00B2E7),
        onPrimary: Colors.black,

        secondary: Color(0xFFE064F7),
        onSecondary: Colors.white,

        tertiary: Color(0xFFFF8D6C),

        surface: Color(0xFF121212),        // Dark surface
        onSurface: Colors.white,

        error: Colors.red.shade400,
        onError: Colors.black
    )
  );

}