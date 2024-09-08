import 'package:flutter/material.dart';

class AppColor extends ThemeExtension<AppColor> {
  const AppColor({
    required this.backgroundPrimary,
    required this.backgroundSecondary,
    required this.backgroundTertiary,
    required this.fontPrimary,
    required this.fontSecondary,
    required this.fontTertiary,
    required this.interactive,
    required this.positive,
    required this.negative,
  });

  final Color backgroundPrimary;
  final Color backgroundSecondary;
  final Color backgroundTertiary;

  final Color fontPrimary;
  final Color fontSecondary;
  final Color fontTertiary;

  final Color interactive;

  final Color positive;
  final Color negative;

  @override
  ThemeExtension<AppColor> copyWith({
    Color? backgroundPrimary,
    Color? backgroundSecondary,
    Color? backgroundTertiary,
    Color? fontPrimary,
    Color? fontSecondary,
    Color? fontTertiary,
    Color? interactive,
    Color? positive,
    Color? negative,
  }) {
    return AppColor(
      backgroundPrimary: backgroundPrimary ?? this.backgroundPrimary,
      backgroundSecondary: backgroundSecondary ?? this.backgroundSecondary,
      backgroundTertiary: backgroundTertiary ?? this.backgroundTertiary,
      fontPrimary: fontPrimary ?? this.fontPrimary,
      fontSecondary: fontSecondary ?? this.fontSecondary,
      fontTertiary: fontTertiary ?? this.fontTertiary,
      interactive: interactive ?? this.interactive,
      positive: positive ?? this.positive,
      negative: negative ?? this.negative,
    );
  }

  factory AppColor.dark() {
    return const AppColor(
      backgroundPrimary: Color(0xFF101010),
      backgroundSecondary: Color(0xFF1D1D1D),
      backgroundTertiary: Color(0xFF16151A),
      fontPrimary: Color(0xFFF3F3F3),
      fontSecondary: Color(0xFF515151),
      fontTertiary: Color(0xFF656565),
      interactive: Color(0xFF2186CC),
      positive: Color(0xFF57CC99),
      negative: Color(0xFFce4257),
    );
  }

  factory AppColor.light() {
    return const AppColor(
      backgroundPrimary: Color(0xFFFEFEFE),
      backgroundSecondary: Color(0xFFF5F5F5),
      backgroundTertiary: Color(0xFFE5E5E5),
      fontPrimary: Color(0xFF020202),
      fontSecondary: Color(0xFF8B8B8B),
      fontTertiary: Color(0xFF4B4B4B),
      interactive: Color(0xFF2186CC),
      positive: Color(0xFF57CC99),
      negative: Color(0xFFce4257),
    );
  }

  @override
  ThemeExtension<AppColor> lerp(
    covariant ThemeExtension<AppColor>? other,
    double t,
  ) {
    if (other == null || other is! AppColor) return this;

    return AppColor(
      backgroundPrimary:
          Color.lerp(backgroundPrimary, other.backgroundPrimary, t) ??
              backgroundPrimary,
      backgroundSecondary:
          Color.lerp(backgroundSecondary, other.backgroundSecondary, t) ??
              backgroundSecondary,
      backgroundTertiary:
          Color.lerp(backgroundTertiary, other.backgroundTertiary, t) ??
              backgroundTertiary,
      fontPrimary: Color.lerp(fontPrimary, other.fontPrimary, t) ?? fontPrimary,
      fontSecondary:
          Color.lerp(fontSecondary, other.fontSecondary, t) ?? fontSecondary,
      fontTertiary:
          Color.lerp(fontTertiary, other.fontTertiary, t) ?? fontTertiary,
      interactive: Color.lerp(interactive, other.interactive, t) ?? interactive,
      positive: Color.lerp(positive, other.positive, t) ?? positive,
      negative: Color.lerp(negative, other.negative, t) ?? negative,
    );
  }
}
