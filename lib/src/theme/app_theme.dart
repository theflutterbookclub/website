import 'package:flutter/material.dart';
import 'text_styles.dart';

class AppTheme {
  static ThemeData light() {
    final base = ThemeData.light();
    return base.copyWith(
      colorScheme: base.colorScheme.copyWith(
        primary: const Color(0xFF0066CC),
        secondary: const Color(0xFF00AA88),
      ),
      textTheme: AppTextStyles.textTheme(base.textTheme),
      elevatedButtonTheme: ElevatedButtonThemeData(
        style: ElevatedButton.styleFrom(
          foregroundColor: Colors.white,
        ),
      ),
    );
  }
}
