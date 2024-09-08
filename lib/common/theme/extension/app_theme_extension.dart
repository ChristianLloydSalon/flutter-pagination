import 'package:exam/common/theme/color/color.dart';
import 'package:exam/common/theme/layout/layout.dart';
import 'package:exam/common/theme/typography/typography.dart';
import 'package:flutter/material.dart';

extension AppThemeExtension on BuildContext {
  ThemeData get theme => Theme.of(this);
  AppColor get colors => theme.extension<AppColor>() ?? AppColor.dark();
  AppTextStyle get textStyle =>
      theme.extension<AppTextStyle>() ?? AppTextStyle.dark();
  AppLayout get layout => theme.extension<AppLayout>() ?? AppLayout.preset();

  ThemeData get lightTheme {
    return ThemeData.light(useMaterial3: false).copyWith(
      brightness: Brightness.light,
      extensions: <ThemeExtension<dynamic>>[
        AppColor.light(),
        AppTextStyle.light(),
      ],
      textTheme: theme.textTheme.apply(
        bodyColor: AppColor.light().fontPrimary,
        displayColor: AppColor.light().fontPrimary,
      ),
      scaffoldBackgroundColor: AppColor.light().backgroundPrimary,
      appBarTheme: AppBarTheme(
        backgroundColor: AppColor.light().backgroundTertiary,
        foregroundColor: AppColor.light().fontPrimary,
        titleTextStyle: textStyle.headline1.copyWith(
          color: AppColor.light().fontPrimary,
        ),
      ),
      cardTheme: CardTheme(
        color: AppColor.light().backgroundSecondary,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(
            AppLayout.preset().borderRadiusMedium,
          ),
        ),
      ),
      listTileTheme: ListTileThemeData(
        tileColor: AppColor.light().backgroundSecondary,
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
        AppTextStyle.dark(),
      ],
      textTheme: theme.textTheme.apply(
        bodyColor: AppColor.dark().fontPrimary,
        displayColor: AppColor.dark().fontPrimary,
      ),
      scaffoldBackgroundColor: AppColor.dark().backgroundPrimary,
      appBarTheme: AppBarTheme(
        backgroundColor: AppColor.dark().backgroundTertiary,
        foregroundColor: AppColor.dark().fontPrimary,
        titleTextStyle: textStyle.headline1.copyWith(
          color: AppColor.dark().fontPrimary,
        ),
      ),
      cardTheme: CardTheme(
        color: AppColor.dark().backgroundSecondary,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(
            AppLayout.preset().borderRadiusMedium,
          ),
        ),
      ),
      listTileTheme: ListTileThemeData(
        tileColor: AppColor.dark().backgroundSecondary,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(
            AppLayout.preset().borderRadiusMedium,
          ),
        ),
      ),
    );
  }
}
