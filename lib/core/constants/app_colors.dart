import 'package:flutter/material.dart';

class AppColors {

  /// Primary accent color (used for buttons like "Add")
  static const Color primary = Color(0xFF007AFF); // iOS-style blue

  /// Success indicator (e.g. +48.00%)
  static const Color success = Color(0xFF34C759); // green

  /// Error indicator (e.g. -48.00%)
  static const Color error = Color(0xFFFF3B30); // red

  /// Card background (slightly lighter than scaffold)
  static const Color cardBackground = Color(0xFF1C2D4A);

  /// Text color for titles and labels
  static const Color textPrimary = Color(0xFFFFFFFF); // white

  /// Secondary text (e.g. tab labels, dates)
  static const Color textSecondary = Color(0xFFB0B8C1); // soft gray-blue

  /// Inactive tab or icon color
  static const Color textMuted = Color(0xFF6C7A89); // muted gray

  /// Divider or border lines
  static const Color divider = Color(0xFF2E3E5C);

  /// Background for selected tab or active chip
  static const Color selectionBackground = Color(0xFF1A3A5F);

  static const surfaceDark = Color(0xFF2C2C2E);
  static const backgroundDark = Color(0xFF1C1C1E);
  static const onSurfaceDark = Color(0xFFB0B0B0);
}
