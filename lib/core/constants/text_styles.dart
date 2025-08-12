import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

abstract class AppTextStyles {
  /// Screen title: "Main"
  static const TextStyle screenTitle = TextStyle(
    fontSize: 36,
    fontWeight: FontWeight.normal,
    color: Color(0xFF8E8E93), // Dark gray
  );

  /// Tab labels: "Day", "Week", "Month"
  static const TextStyle tabLabelActive = TextStyle(
    fontSize: 16,
    fontWeight: FontWeight.w600,
    color: Color(0xFF1C1C1E), // Dark gray
  );

  static const TextStyle tabLabelInactive = TextStyle(
    fontSize: 16,
    fontWeight: FontWeight.w500,
    color: Color(0xFF8E8E93), // Light gray
  );

  /// Account balance: "$125,000.00"
  static  TextStyle accountBalance = TextStyle(
    fontSize: 32.h,
    fontWeight: FontWeight.bold,
    color: Color(0xFFFFFFFF), // Dark gray
  );

  /// Percentage change (positive): "+48.00%"
  static const TextStyle percentageChangePositive = TextStyle(
    fontSize: 16,
    fontWeight: FontWeight.w500,
    color: Color(0xFF34C759), // iOS-style green
  );

  /// Percentage change (negative): "-48.00%"
  static const TextStyle percentageChangeNegative = TextStyle(
    fontSize: 16,
    fontWeight: FontWeight.w500,
    color: Color(0xFFFF3B30), // iOS-style red
  );

  /// Section titles: "Expenses", "Income"
  static const TextStyle sectionTitle = TextStyle(
    fontSize: 20,
    fontWeight: FontWeight.w600,
    color: Color(0xFF1C1C1E), // Dark gray
  );

  /// Amount text: "$25,000.00"
  static const TextStyle amountText = TextStyle(
    fontSize: 18,
    fontWeight: FontWeight.w500,
    color: Color(0xFF1C1C1E), // Dark gray
  );

  /// "Watch All" button text
  static const TextStyle watchAllButton = TextStyle(
    fontSize: 14,
    fontWeight: FontWeight.w500,
    color: Color(0xFF007AFF), // iOS-style blue
  );

  /// Category labels: "Food", "Drink", etc.
  static  TextStyle widgetLabel = TextStyle(
    fontSize: 17.h,
    fontWeight: FontWeight.w400,
    color: Color(0xFF636366), // Medium gray
  );

  /// Transaction title: "Expenses -$25,000.00"
  static const TextStyle transactionTitle = TextStyle(
    fontSize: 16,
    fontWeight: FontWeight.w500,
    color: Color(0xFF1C1C1E), // Dark gray
  );

  /// Transaction date: "Nov 21"
  static const TextStyle transactionDate = TextStyle(
    fontSize: 14,
    fontWeight: FontWeight.w400,
    color: Color(0xFFAEAEB2), // Light gray
  );

  /// Bottom navigation labels: "Main", "Categories", etc.
  static const TextStyle navLabelInactive = TextStyle(
    fontSize: 12,
    fontWeight: FontWeight.w400,
    color: Color(0xFF8E8E93), // Light gray
  );

  static const TextStyle navLabelActive = TextStyle(
    fontSize: 12,
    fontWeight: FontWeight.w500,
    color: Color(0xFF007AFF), // Blue
  );



}
