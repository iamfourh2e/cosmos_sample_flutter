import 'package:flutter/material.dart';

class BaseTheme extends ThemeExtension<BaseTheme> {
  final Color primaryBackground;
  final Color secondaryBackground;
  final Color accentColor;
  final Color textPrimary;
  final Color textSecondary;

  const BaseTheme({
    required this.primaryBackground,
    required this.secondaryBackground,
    required this.accentColor,
    required this.textPrimary,
    required this.textSecondary,
  });

  @override
  BaseTheme copyWith({
    Color? primaryBackground,
    Color? secondaryBackground,
    Color? accentColor,
    Color? textPrimary,
    Color? textSecondary,
  }) {
    return BaseTheme(
      primaryBackground: primaryBackground ?? this.primaryBackground,
      secondaryBackground: secondaryBackground ?? this.secondaryBackground,
      accentColor: accentColor ?? this.accentColor,
      textPrimary: textPrimary ?? this.textPrimary,
      textSecondary: textSecondary ?? this.textSecondary,
    );
  }

  @override
  BaseTheme lerp(ThemeExtension<BaseTheme>? other, double t) {
    if (other is! BaseTheme) {
      return this;
    }
    return BaseTheme(
      primaryBackground: Color.lerp(primaryBackground, other.primaryBackground, t)!,
      secondaryBackground: Color.lerp(secondaryBackground, other.secondaryBackground, t)!,
      accentColor: Color.lerp(accentColor, other.accentColor, t)!,
      textPrimary: Color.lerp(textPrimary, other.textPrimary, t)!,
      textSecondary: Color.lerp(textSecondary, other.textSecondary, t)!,
    );
  }

  static const light = BaseTheme(
    primaryBackground: Colors.white,
    secondaryBackground: Color(0xFFF5F5F5),
    accentColor: Colors.deepPurple,
    textPrimary: Colors.black87,
    textSecondary: Colors.black54,
  );

  static const dark = BaseTheme(
    primaryBackground: Color(0xFF121212),
    secondaryBackground: Color(0xFF242424),
    accentColor: Colors.deepPurpleAccent,
    textPrimary: Colors.white,
    textSecondary: Colors.white70,
  );
}