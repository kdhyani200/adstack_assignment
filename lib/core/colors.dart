import 'package:flutter/material.dart';

/// Centralized color palette used across the Adstacks dashboard.
class AppColors {
  AppColors._();

  // Base surfaces
  static const Color scaffoldBg = Color(0xFFF3F4F8);
  static const Color cardBg = Color(0xFFFFFFFF);
  static const Color sidebarBg = Color(0xFFFFFFFF);

  // Brand purple
  static const Color primary = Color(0xFF6C4CF1);
  static const Color primaryLight = Color(0xFFEFEBFF);

  // Dark navy panel (calendar / birthday / anniversary)
  static const Color panelDark = Color(0xFF181B34);
  static const Color panelDarkAlt = Color(0xFF23264A);

  // Banner gradient (Top Rating Project)
  static const List<Color> bannerGradient = [
    Color(0xFF6A3DE8),
    Color(0xFFB43DE8),
    Color(0xFFFF5DA2),
  ];

  // Accent used for the highlighted "All Projects" tile
  static const Color highlightRed = Color(0xFFE94B4B);
  static const Color highlightRedDark = Color(0xFFC23B3B);

  // Chart lines
  static const Color chartPending = Color(0xFFFF6FA5);
  static const Color chartDone = Color(0xFF6C4CF1);

  // Text
  static const Color textPrimary = Color(0xFF1B1D28);
  static const Color textSecondary = Color(0xFF8A8CA5);
  static const Color textOnDark = Color(0xFFFFFFFF);
  static const Color textOnDarkMuted = Color(0xFFAFB1D0);

  static const Color divider = Color(0xFFEDEDF3);
  static const Color iconMuted = Color(0xFF9A9CB8);
}
