import 'package:flutter/material.dart';

class AppTheme {
  static const background = Color(0xFF0A0A1A);
  static const surface = Color(0xFF12122A);
  static const surfaceAlt = Color(0xFF1A1A35);
  static const accent = Color(0xFF7C3AED);
  static const accentBright = Color(0xFF9B5CF6);
  static const accentGlow = Color(0x557C3AED);
  static const textPrimary = Color(0xFFFFFFFF);
  static const textSecondary = Color(0xFFB0B0D0);
  static const textMuted = Color(0xFF6060A0);
  static const focusBorder = Color(0xFF9B5CF6);
  static const cardOverlay = Color(0x88000000);

  // static ThemeData get lightTheme {
  //   return null;
  // }

  static ThemeData get darkTheme {
    return ThemeData(
      useMaterial3: true,
      brightness: Brightness.dark,
      scaffoldBackgroundColor: background,

      colorScheme: const ColorScheme(
        brightness: Brightness.dark,
        primary: accent,
        secondary: accentBright,
        surface: surface,
        error: Colors.red,
        onError: Colors.white,
        onPrimary: textPrimary,
        onSecondary: textSecondary,
        onTertiary: textMuted,
        onSurface: Colors.white,
        outline: focusBorder,
        shadow: accentGlow,
      ),
    );
  }
}
