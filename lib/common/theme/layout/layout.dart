import 'dart:ui';

import 'package:flutter/material.dart';

class AppLayout extends ThemeExtension<AppLayout> {
  const AppLayout({
    required this.paddingLarge,
    required this.paddingMedium,
    required this.paddingSmall,
    required this.borderRadiusLarge,
    required this.borderRadiusMedium,
    required this.borderRadiusSmall,
    required this.spacingLarge,
    required this.spacingMedium,
    required this.spacingSmall,
    required this.radiusLarge,
    required this.radiusMedium,
    required this.radiusSmall,
  });

  final double paddingLarge;
  final double paddingMedium;
  final double paddingSmall;

  final double borderRadiusLarge;
  final double borderRadiusMedium;
  final double borderRadiusSmall;

  final double spacingLarge;
  final double spacingMedium;
  final double spacingSmall;

  final double radiusLarge;
  final double radiusMedium;
  final double radiusSmall;

  factory AppLayout.preset() {
    return const AppLayout(
      paddingLarge: 24.0,
      paddingMedium: 16.0,
      paddingSmall: 8.0,
      borderRadiusLarge: 16.0,
      borderRadiusMedium: 8.0,
      borderRadiusSmall: 4.0,
      spacingLarge: 24.0,
      spacingMedium: 16.0,
      spacingSmall: 8.0,
      radiusLarge: 24.0,
      radiusMedium: 16.0,
      radiusSmall: 8.0,
    );
  }

  @override
  ThemeExtension<AppLayout> copyWith({
    double? paddingLarge,
    double? paddingMedium,
    double? paddingSmall,
    double? borderRadiusLarge,
    double? borderRadiusMedium,
    double? borderRadiusSmall,
    double? spacingLarge,
    double? spacingMedium,
    double? spacingSmall,
    double? radiusLarge,
    double? radiusMedium,
    double? radiusSmall,
  }) {
    return AppLayout(
      paddingLarge: paddingLarge ?? this.paddingLarge,
      paddingMedium: paddingMedium ?? this.paddingMedium,
      paddingSmall: paddingSmall ?? this.paddingSmall,
      borderRadiusLarge: borderRadiusLarge ?? this.borderRadiusLarge,
      borderRadiusMedium: borderRadiusMedium ?? this.borderRadiusMedium,
      borderRadiusSmall: borderRadiusSmall ?? this.borderRadiusSmall,
      spacingLarge: spacingLarge ?? this.spacingLarge,
      spacingMedium: spacingMedium ?? this.spacingMedium,
      spacingSmall: spacingSmall ?? this.spacingSmall,
      radiusLarge: radiusLarge ?? this.radiusLarge,
      radiusMedium: radiusMedium ?? this.radiusMedium,
      radiusSmall: radiusSmall ?? this.radiusSmall,
    );
  }

  @override
  ThemeExtension<AppLayout> lerp(
    covariant ThemeExtension<AppLayout>? other,
    double t,
  ) {
    if (other == null || other is! AppLayout) {
      return this;
    }

    return AppLayout(
      paddingLarge:
          lerpDouble(paddingLarge, other.paddingLarge, t) ?? paddingLarge,
      paddingMedium:
          lerpDouble(paddingMedium, other.paddingMedium, t) ?? paddingMedium,
      paddingSmall:
          lerpDouble(paddingSmall, other.paddingSmall, t) ?? paddingSmall,
      borderRadiusLarge:
          lerpDouble(borderRadiusLarge, other.borderRadiusLarge, t) ??
              borderRadiusLarge,
      borderRadiusMedium:
          lerpDouble(borderRadiusMedium, other.borderRadiusMedium, t) ??
              borderRadiusMedium,
      borderRadiusSmall:
          lerpDouble(borderRadiusSmall, other.borderRadiusSmall, t) ??
              borderRadiusSmall,
      spacingLarge:
          lerpDouble(spacingLarge, other.spacingLarge, t) ?? spacingLarge,
      spacingMedium:
          lerpDouble(spacingMedium, other.spacingMedium, t) ?? spacingMedium,
      spacingSmall:
          lerpDouble(spacingSmall, other.spacingSmall, t) ?? spacingSmall,
      radiusLarge: lerpDouble(radiusLarge, other.radiusLarge, t) ?? radiusLarge,
      radiusMedium:
          lerpDouble(radiusMedium, other.radiusMedium, t) ?? radiusMedium,
      radiusSmall: lerpDouble(radiusSmall, other.radiusSmall, t) ?? radiusSmall,
    );
  }
}
