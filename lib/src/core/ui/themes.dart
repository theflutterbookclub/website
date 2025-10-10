import 'package:flex_color_scheme/flex_color_scheme.dart';
import 'package:flutter/material.dart';

import 'colors.dart';

final ThemeData lightTheme = FlexThemeData.light(
  fontFamily: "Lato",
  useMaterial3: true,
  scheme: FlexScheme.blumineBlue,
  appBarStyle: FlexAppBarStyle.scaffoldBackground,
  visualDensity: VisualDensity.compact,
  materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
  scaffoldBackground: AppColors.background,
  surfaceTint: Colors.transparent,
  appBarElevation: 1.0,
);
