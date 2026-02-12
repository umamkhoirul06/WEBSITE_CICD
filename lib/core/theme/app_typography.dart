import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

/// Skilloka Design System - Typography
class AppTypography {
  AppTypography._();

  // Font Families
  static String get _headingFont => 'PlusJakartaSans';
  static TextStyle get _bodyFont => GoogleFonts.inter();
  static TextStyle get _numericFont => GoogleFonts.spaceGrotesk();

  // Display Styles
  static TextStyle displayLarge = TextStyle(
    fontFamily: _headingFont,
    fontSize: 32,
    fontWeight: FontWeight.w700,
    height: 1.2,
    letterSpacing: -0.5,
  );

  static TextStyle displayMedium = TextStyle(
    fontFamily: _headingFont,
    fontSize: 28,
    fontWeight: FontWeight.w700,
    height: 1.25,
    letterSpacing: -0.25,
  );

  // Headline Styles
  static TextStyle headlineLarge = TextStyle(
    fontFamily: _headingFont,
    fontSize: 24,
    fontWeight: FontWeight.w600,
    height: 1.3,
  );

  static TextStyle headlineMedium = TextStyle(
    fontFamily: _headingFont,
    fontSize: 20,
    fontWeight: FontWeight.w600,
    height: 1.35,
  );

  static TextStyle headlineSmall = TextStyle(
    fontFamily: _headingFont,
    fontSize: 18,
    fontWeight: FontWeight.w600,
    height: 1.4,
  );

  // Title Styles
  static TextStyle titleLarge = TextStyle(
    fontFamily: _headingFont,
    fontSize: 18,
    fontWeight: FontWeight.w500,
    height: 1.4,
  );

  static TextStyle titleMedium = TextStyle(
    fontFamily: _headingFont,
    fontSize: 16,
    fontWeight: FontWeight.w500,
    height: 1.45,
  );

  static TextStyle titleSmall = TextStyle(
    fontFamily: _headingFont,
    fontSize: 14,
    fontWeight: FontWeight.w500,
    height: 1.5,
  );

  // Body Styles
  static TextStyle get bodyLarge => _bodyFont.copyWith(
        fontSize: 16,
        fontWeight: FontWeight.w400,
        height: 1.5,
      );

  static TextStyle get bodyMedium => _bodyFont.copyWith(
        fontSize: 14,
        fontWeight: FontWeight.w400,
        height: 1.5,
      );

  static TextStyle get bodySmall => _bodyFont.copyWith(
        fontSize: 12,
        fontWeight: FontWeight.w400,
        height: 1.5,
      );

  // Label Styles
  static TextStyle get labelLarge => _bodyFont.copyWith(
        fontSize: 14,
        fontWeight: FontWeight.w500,
        height: 1.4,
        letterSpacing: 0.1,
      );

  static TextStyle get labelMedium => _bodyFont.copyWith(
        fontSize: 12,
        fontWeight: FontWeight.w500,
        height: 1.4,
        letterSpacing: 0.5,
      );

  static TextStyle get labelSmall => _bodyFont.copyWith(
        fontSize: 11,
        fontWeight: FontWeight.w500,
        height: 1.4,
        letterSpacing: 0.5,
      );

  // Numeric Styles (for prices, ratings, etc.)
  static TextStyle get numericLarge => _numericFont.copyWith(
        fontSize: 24,
        fontWeight: FontWeight.w500,
        height: 1.2,
      );

  static TextStyle get numericMedium => _numericFont.copyWith(
        fontSize: 20,
        fontWeight: FontWeight.w500,
        height: 1.3,
      );

  static TextStyle get numericSmall => _numericFont.copyWith(
        fontSize: 16,
        fontWeight: FontWeight.w500,
        height: 1.4,
      );
}
