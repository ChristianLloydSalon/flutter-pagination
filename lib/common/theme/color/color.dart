import 'package:flutter/material.dart';

class AppColor extends ThemeExtension<AppColor> {
  const AppColor({
    required this.primary,
    required this.onPrimary,
    required this.secondary,
    required this.onSecondary,
    required this.surface,
    required this.onSurface,
    required this.background,
    required this.onBackground,
  });

  final Color primary;
  final Color onPrimary;
  final Color secondary;
  final Color onSecondary;
  final Color surface;
  final Color onSurface;
  final Color background;
  final Color onBackground;

  @override
  ThemeExtension<AppColor> copyWith({
    Color? primary,
    Color? onPrimary,
    Color? secondary,
    Color? onSecondary,
    Color? surface,
    Color? onSurface,
    Color? background,
    Color? onBackground,
  }) {
    return AppColor(
      primary: primary ?? this.primary,
      onPrimary: onPrimary ?? this.onPrimary,
      secondary: secondary ?? this.secondary,
      onSecondary: onSecondary ?? this.onSecondary,
      surface: surface ?? this.surface,
      onSurface: onSurface ?? this.onSurface,
      background: background ?? this.background,
      onBackground: onBackground ?? this.onBackground,
    );
  }

  factory AppColor.dark() {
    return const AppColor(
      primary: Color(0xFF101010),
      onPrimary: Color(0xFFF5F5F5),
      secondary: Color(0xFFFBFBFB),
      onSecondary: Color(0xFF0D0D0D),
      surface: Color(0xFF1D1D1D),
      onSurface: Color(0xFFECECEC),
      background: Color(0xFF101010),
      onBackground: Color(0xFFF1F1F1),
    );
  }

  factory AppColor.light() {
    return const AppColor(
      primary: Color(0xFFFEFEFE),
      onPrimary: Color(0xFF090909),
      secondary: Color(0xFF020202),
      onSecondary: Color(0xFFFBFBFB),
      surface: Color(0xFFF5F5F5),
      onSurface: Color(0xFF1D1D1D),
      background: Color(0xFFFEFEFE),
      onBackground: Color(0xFF020202),
    );
  }

  @override
  ThemeExtension<AppColor> lerp(
    covariant ThemeExtension<AppColor>? other,
    double t,
  ) {
    if (other == null || other is! AppColor) return this;

    return AppColor(
      primary: Color.lerp(primary, other.primary, t) ?? primary,
      onPrimary: Color.lerp(onPrimary, other.onPrimary, t) ?? onPrimary,
      secondary: Color.lerp(secondary, other.secondary, t) ?? secondary,
      onSecondary: Color.lerp(onSecondary, other.onSecondary, t) ?? onSecondary,
      surface: Color.lerp(surface, other.surface, t) ?? surface,
      onSurface: Color.lerp(onSurface, other.onSurface, t) ?? onSurface,
      background: Color.lerp(background, other.background, t) ?? background,
      onBackground:
          Color.lerp(onBackground, other.onBackground, t) ?? onBackground,
    );
  }
}
