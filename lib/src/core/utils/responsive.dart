import 'package:flutter/material.dart';
import 'package:responsive_framework/responsive_framework.dart';

// Breakpoint constants
class AppBreakPoints {
  static const String smallMobile = 'SMALL_MOBILE';
  static const String normalMobile = 'NORMAL_MOBILE';
  static const String largeMobile = 'LARGE_MOBILE';
  static const String portraitTablet = 'PORTRAIT_TABLET';
  static const String landscapeTablet = 'LANDSCAPE_TABLET';
  static const String desktop = 'DESKTOP';
}

extension ResponsiveContext on BuildContext {
  T responsive<T>(
    T value, {
    T? smallMobile,
    T? normalMobile,
    T? largeMobile,
    T? portraitTablet,
    T? landscapeTablet,
  }) {
    List<Condition<T>> conditions = [];

    if (smallMobile != null) {
      conditions.add(
        Condition.equals(name: AppBreakPoints.smallMobile, value: smallMobile),
      );
    }

    if (normalMobile != null) {
      conditions.add(
        Condition.equals(
          name: AppBreakPoints.normalMobile,
          value: normalMobile,
        ),
      );
    }

    if (largeMobile != null) {
      conditions.add(
        Condition.equals(name: AppBreakPoints.largeMobile, value: largeMobile),
      );
    }

    if (portraitTablet != null) {
      conditions.add(
        Condition.equals(
          name: AppBreakPoints.portraitTablet,
          value: portraitTablet,
        ),
      );
    }

    if (landscapeTablet != null) {
      conditions.add(
        Condition.equals(
          name: AppBreakPoints.landscapeTablet,
          value: landscapeTablet,
        ),
      );
    }

    return ResponsiveValue<T>(
      this,
      defaultValue: value,
      conditionalValues: conditions,
    ).value;
  }

  // Convenience getters for current breakpoint
  bool get isSmallMobile =>
      ResponsiveBreakpoints.of(this).breakpoint.name ==
      AppBreakPoints.smallMobile;

  bool get isNormalMobile =>
      ResponsiveBreakpoints.of(this).breakpoint.name ==
      AppBreakPoints.normalMobile;

  bool get isLargeMobile =>
      ResponsiveBreakpoints.of(this).breakpoint.name ==
      AppBreakPoints.largeMobile;

  bool get isPortraitTablet =>
      ResponsiveBreakpoints.of(this).breakpoint.name ==
      AppBreakPoints.portraitTablet;

  bool get isLandscapeTablet =>
      ResponsiveBreakpoints.of(this).breakpoint.name ==
      AppBreakPoints.landscapeTablet;

  // Helper for checking if device is mobile (any size)
  bool get isMobile => isSmallMobile || isNormalMobile || isLargeMobile;

  // Helper for checking if device is tablet (any orientation)
  bool get isTablet => isPortraitTablet || isLandscapeTablet;
}

/// Responsive font sizes with improved scaling
class FontSizes {
  static double _responsive(
    BuildContext context,
    double base, {
    double? smallMobile,
    double? normalMobile,
    double? largeMobile,
    double? portraitTablet,
    double? landscapeTablet,
  }) {
    return context.responsive<double>(
      base,
      smallMobile: smallMobile ?? base * 0.85,
      normalMobile: normalMobile ?? base,
      largeMobile: largeMobile ?? base * 1.1,
      portraitTablet: portraitTablet ?? base * 1.25,
      landscapeTablet: landscapeTablet ?? base * 1.4,
    );
  }

  // Display fonts (large headings)
  static double display1(BuildContext context) =>
      _responsive(context, 48, smallMobile: 36, normalMobile: 36);

  static double display2(BuildContext context) =>
      _responsive(context, 40, smallMobile: 32, normalMobile: 32);

  // Headings
  static double h1(BuildContext context) =>
      _responsive(context, 32, smallMobile: 26, normalMobile: 32);

  static double h2(BuildContext context) =>
      _responsive(context, 28, smallMobile: 22, normalMobile: 28);

  static double h3(BuildContext context) =>
      _responsive(context, 24, smallMobile: 20, normalMobile: 24);

  static double h4(BuildContext context) =>
      _responsive(context, 20, normalMobile: 22);

  static double h5(BuildContext context) =>
      _responsive(context, 18, smallMobile: 16, normalMobile: 18);

  static double h6(BuildContext context) =>
      _responsive(context, 16, smallMobile: 14, normalMobile: 16);

  // Body text
  static double bodyLarge(BuildContext context) =>
      _responsive(context, 16, smallMobile: 14, normalMobile: 16);

  static double bodyMedium(BuildContext context) =>
      _responsive(context, 14, smallMobile: 13, normalMobile: 14);

  static double bodySmall(BuildContext context) =>
      _responsive(context, 12, smallMobile: 12, normalMobile: 12);

  // UI elements
  static double buttonLarge(BuildContext context) =>
      _responsive(context, 18, smallMobile: 16);

  static double buttonMedium(BuildContext context) =>
      _responsive(context, 16, smallMobile: 14);

  static double buttonSmall(BuildContext context) =>
      _responsive(context, 14, smallMobile: 12);

  static double caption(BuildContext context) =>
      _responsive(context, 12, smallMobile: 10);

  static double overline(BuildContext context) =>
      _responsive(context, 10, smallMobile: 9);
}

/// Responsive spacing system
class Spacings {
  static double _responsive(BuildContext context, double base) {
    return context.responsive<double>(
      base,
      smallMobile: base * 0.8,
      normalMobile: base,
      largeMobile: base * 1.1,
      portraitTablet: base * 1.3,
      landscapeTablet: base * 1.5,
    );
  }

  // Extra small spacing
  static double xs(BuildContext context) => _responsive(context, 4);

  // Small spacing
  static double sm(BuildContext context) => _responsive(context, 8);

  // Medium spacing
  static double md(BuildContext context) => _responsive(context, 12);

  // Large spacing
  static double lg(BuildContext context) => _responsive(context, 16);

  // Extra large spacing
  static double xl(BuildContext context) => _responsive(context, 24);

  // Double extra large spacing
  static double xxl(BuildContext context) => _responsive(context, 32);

  // Triple extra large spacing
  static double xxxl(BuildContext context) => _responsive(context, 48);
}

/// Responsive padding system
class Paddings {
  static double _getValue(BuildContext context, double base) {
    return context.responsive<double>(
      base,
      smallMobile: base * 0.8,
      normalMobile: base,
      largeMobile: base * 1.1,
      portraitTablet: base * 1.3,
      landscapeTablet: base * 1.5,
    );
  }

  static double getHSpace(BuildContext context, double size) =>
      _getValue(context, size);

  // All-around padding
  static EdgeInsets all(BuildContext context, double value) =>
      EdgeInsets.all(_getValue(context, value) + 1.0);

  // Preset all-around paddings
  static EdgeInsets allXs(BuildContext context) => all(context, 4);

  static EdgeInsets allSm(BuildContext context) => all(context, 8);

  static EdgeInsets allMd(BuildContext context) => all(context, 12);

  static EdgeInsets allLg(BuildContext context) => all(context, 16);

  static EdgeInsets allXl(BuildContext context) => all(context, 24);

  static EdgeInsets allXxl(BuildContext context) => all(context, 32);

  // Horizontal padding
  static EdgeInsets horizontal(BuildContext context, double value) =>
      EdgeInsets.symmetric(horizontal: _getValue(context, value) + 1.0);

  static EdgeInsets hSm(BuildContext context) => horizontal(context, 8);

  static EdgeInsets hMd(BuildContext context) => horizontal(context, 12);

  static EdgeInsets hLg(BuildContext context) => horizontal(context, 16);

  static EdgeInsets hXl(BuildContext context) => horizontal(context, 24);

  static EdgeInsets hXxl(BuildContext context) => horizontal(context, 32);

  // Vertical padding
  static EdgeInsets vertical(BuildContext context, double value) =>
      EdgeInsets.symmetric(vertical: _getValue(context, value) + 1.0);

  static EdgeInsets vSm(BuildContext context) => vertical(context, 8);

  static EdgeInsets vMd(BuildContext context) => vertical(context, 12);

  static EdgeInsets vLg(BuildContext context) => vertical(context, 16);

  static EdgeInsets vXl(BuildContext context) => vertical(context, 24);

  static EdgeInsets vXxl(BuildContext context) => vertical(context, 32);

  static EdgeInsets sym(
    BuildContext context, {
    double horizontal = 0.0,
    double vertical = 0.0,
  }) {
    return EdgeInsets.symmetric(
      horizontal: _getValue(context, horizontal),
      vertical: _getValue(context, vertical),
    );
  }

  // Specific side padding
  static EdgeInsets only(
    BuildContext context, {
    double left = 0,
    double top = 0,
    double right = 0,
    double bottom = 0,
  }) => EdgeInsets.only(
    left: _getValue(context, left),
    top: _getValue(context, top),
    right: _getValue(context, right),
    bottom: _getValue(context, bottom),
  );
}

/// Responsive dimensions for common UI elements
class Dimensions {
  static double _responsive(BuildContext context, double base) {
    return context.responsive<double>(
      base,
      smallMobile: base * 0.9,
      normalMobile: base,
      largeMobile: base * 1.1,
      portraitTablet: base * 1.2,
      landscapeTablet: base * 1.3,
    );
  }

  // Button heights
  static double buttonSmall(BuildContext context) => _responsive(context, 32);

  static double buttonMedium(BuildContext context) => _responsive(context, 40);

  static double buttonLarge(BuildContext context) => _responsive(context, 48);

  // Icon sizes
  static double iconSmall(BuildContext context) => _responsive(context, 16);

  static double iconMedium(BuildContext context) => _responsive(context, 22);

  static double iconLarge(BuildContext context) => _responsive(context, 28);

  static double iconXLarge(BuildContext context) => _responsive(context, 36);

  // Avatar sizes
  static double avatarSmall(BuildContext context) => _responsive(context, 32);

  static double avatarMedium(BuildContext context) => _responsive(context, 48);

  static double avatarLarge(BuildContext context) => _responsive(context, 64);
}