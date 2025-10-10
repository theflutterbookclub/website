import 'package:flutter/material.dart';

import 'colors.dart';

class AppTextStyles {
  static TextStyle get bold => TextStyle(
    fontFamily: "GoudyBookletter",
    color: AppColors.dark,
    fontWeight: FontWeight.w700,
    height: 1.5,
    letterSpacing: -0.03,
  );

  static TextStyle get semiBold => TextStyle(
    fontFamily: "GoudyBookletter",
    color: AppColors.dark,
    fontWeight: FontWeight.w600,
    height: 1.5,
    letterSpacing: -0.02,
  );

  static TextStyle get medium => TextStyle(
    fontFamily: "GoudyBookletter",
    color: AppColors.grey,
    fontWeight: FontWeight.w500,
    height: 1.5,
    letterSpacing: -0.02,
  );

  static TextStyle get regular => TextStyle(
    fontFamily: "GoudyBookletter",
    color: AppColors.grey,
    fontWeight: FontWeight.w400,
    height: 1.5,
    letterSpacing: -0.02,
  );
}