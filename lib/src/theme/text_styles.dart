import 'package:flutter/material.dart';

class AppTextStyles {
  static TextTheme textTheme(TextTheme base) {
    return base.copyWith(
      titleLarge: base.titleLarge?.copyWith(fontWeight: FontWeight.bold),
      bodyLarge: base.bodyLarge?.copyWith(fontSize: 16),
      bodyMedium: base.bodyMedium?.copyWith(fontSize: 14),
      labelLarge: base.labelLarge?.copyWith(fontWeight: FontWeight.w600),
    );
  }
}
