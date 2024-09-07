import 'package:exam/common/theme/color/color.dart';
import 'package:exam/common/theme/layout/layout.dart';
import 'package:exam/common/theme/typography/typography.dart';
import 'package:flutter/material.dart';

extension AppThemeExtension on BuildContext {
  ThemeData get theme => Theme.of(this);
  AppColor get colors => theme.extension<AppColor>() ?? AppColor.dark();
  AppTextStyle get textStyle =>
      theme.extension<AppTextStyle>() ?? AppTextStyle.preset();
  AppLayout get layout => theme.extension<AppLayout>() ?? AppLayout.preset();

  ThemeData get lightTheme {
    return ThemeData.light(useMaterial3: false).copyWith(
      brightness: Brightness.light,
      extensions: <ThemeExtension<dynamic>>[
        AppColor.light(),
        AppTextStyle.preset(),
        AppLayout.preset(),
      ],
      textTheme: theme.textTheme.apply(
        bodyColor: AppColor.light().onSurface,
        displayColor: AppColor.light().onSurface,
      ),
      scaffoldBackgroundColor: AppColor.light().background,
      appBarTheme: AppBarTheme(
        backgroundColor: AppColor.light().primary,
        foregroundColor: AppColor.light().onPrimary,
        titleTextStyle: textStyle.headline1.copyWith(
          color: AppColor.light().onPrimary,
        ),
      ),
      cardTheme: CardTheme(
        color: AppColor.light().surface,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(
            AppLayout.preset().borderRadiusMedium,
          ),
        ),
      ),
    );
  }

  ThemeData get darkTheme {
    return ThemeData.dark(useMaterial3: false).copyWith(
      brightness: Brightness.dark,
      extensions: <ThemeExtension<dynamic>>[
        AppColor.dark(),
        AppTextStyle.preset(),
        AppLayout.preset(),
      ],
      textTheme: theme.textTheme.apply(
        bodyColor: AppColor.dark().onSurface,
        displayColor: AppColor.dark().onSurface,
      ),
      scaffoldBackgroundColor: AppColor.dark().background,
      appBarTheme: AppBarTheme(
        backgroundColor: AppColor.dark().primary,
        foregroundColor: AppColor.dark().onPrimary,
        titleTextStyle: textStyle.headline1.copyWith(
          color: AppColor.dark().onPrimary,
        ),
      ),
      cardTheme: CardTheme(
        color: AppColor.dark().surface,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(
            AppLayout.preset().borderRadiusMedium,
          ),
        ),
      ),
    );
  }
}
