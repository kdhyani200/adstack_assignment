import 'package:flutter/material.dart';

/// Shared layout/style constants used across the dashboard.
class AppRadius {
  AppRadius._();
  static const double card = 20;
  static const double small = 12;
  static const double pill = 30;
}

class AppSpacing {
  AppSpacing._();
  static const double xs = 4;
  static const double sm = 8;
  static const double md = 12;
  static const double lg = 16;
  static const double xl = 24;
}

class AppShadows {
  AppShadows._();

  static List<BoxShadow> card = [
    BoxShadow(
      color: Colors.black.withValues(alpha: 0.04),
      blurRadius: 20,
      offset: const Offset(0, 6),
    ),
  ];
}

/// Responsive breakpoints (kept in sync with core/responsive.dart)
class Breakpoints {
  Breakpoints._();
  static const double tablet = 700;
  static const double desktop = 1100;
}
