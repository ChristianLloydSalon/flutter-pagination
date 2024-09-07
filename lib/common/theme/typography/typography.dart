import 'package:flutter/material.dart';

class AppTextStyle extends ThemeExtension<AppTextStyle> {
  const AppTextStyle({
    required this.label1,
    required this.label2,
    required this.label3,
    required this.body1,
    required this.body2,
    required this.body3,
    required this.body4,
    required this.smallText1,
    required this.smallText2,
    required this.smallText3,
    required this.smallText4,
    required this.headline1,
    required this.headline2,
    required this.headline3,
    required this.title1,
    required this.title2,
    required this.title3,
    required this.subtitle1,
    required this.subtitle2,
    required this.subtitle3,
    required this.subtitle4,
  });

  final TextStyle label1;
  final TextStyle label2;
  final TextStyle label3;

  final TextStyle body1;
  final TextStyle body2;
  final TextStyle body3;
  final TextStyle body4;

  final TextStyle smallText1;
  final TextStyle smallText2;
  final TextStyle smallText3;
  final TextStyle smallText4;

  final TextStyle headline1;
  final TextStyle headline2;
  final TextStyle headline3;

  final TextStyle title1;
  final TextStyle title2;
  final TextStyle title3;

  final TextStyle subtitle1;
  final TextStyle subtitle2;
  final TextStyle subtitle3;
  final TextStyle subtitle4;

  static const _fontFamily = 'Outfit';

  @override
  ThemeExtension<AppTextStyle> copyWith({
    TextStyle? label1,
    TextStyle? label2,
    TextStyle? label3,
    TextStyle? body1,
    TextStyle? body2,
    TextStyle? body3,
    TextStyle? body4,
    TextStyle? smallText1,
    TextStyle? smallText2,
    TextStyle? smallText3,
    TextStyle? smallText4,
    TextStyle? headline1,
    TextStyle? headline2,
    TextStyle? headline3,
    TextStyle? title1,
    TextStyle? title2,
    TextStyle? title3,
    TextStyle? subtitle1,
    TextStyle? subtitle2,
    TextStyle? subtitle3,
    TextStyle? subtitle4,
  }) {
    return AppTextStyle(
      label1: label1 ?? this.label1,
      label2: label2 ?? this.label2,
      label3: label3 ?? this.label3,
      body1: body1 ?? this.body1,
      body2: body2 ?? this.body2,
      body3: body3 ?? this.body3,
      body4: body4 ?? this.body4,
      smallText1: smallText1 ?? this.smallText1,
      smallText2: smallText2 ?? this.smallText2,
      smallText3: smallText3 ?? this.smallText3,
      smallText4: smallText4 ?? this.smallText4,
      headline1: headline1 ?? this.headline1,
      headline2: headline2 ?? this.headline2,
      headline3: headline3 ?? this.headline3,
      title1: title1 ?? this.title1,
      title2: title2 ?? this.title2,
      title3: title3 ?? this.title3,
      subtitle1: subtitle1 ?? this.subtitle1,
      subtitle2: subtitle2 ?? this.subtitle2,
      subtitle3: subtitle3 ?? this.subtitle3,
      subtitle4: subtitle4 ?? this.subtitle4,
    );
  }

  factory AppTextStyle.preset() {
    return const AppTextStyle(
      label1: TextStyle(
        fontFamily: _fontFamily,
        fontSize: 12,
        fontWeight: FontWeight.w400,
      ),
      label2: TextStyle(
        fontFamily: _fontFamily,
        fontSize: 14,
        fontWeight: FontWeight.w400,
      ),
      label3: TextStyle(
        fontFamily: _fontFamily,
        fontSize: 16,
        fontWeight: FontWeight.w400,
      ),
      body1: TextStyle(
        fontFamily: _fontFamily,
        fontSize: 12,
        fontWeight: FontWeight.w400,
      ),
      body2: TextStyle(
        fontFamily: _fontFamily,
        fontSize: 14,
        fontWeight: FontWeight.w400,
      ),
      body3: TextStyle(
        fontFamily: _fontFamily,
        fontSize: 16,
        fontWeight: FontWeight.w400,
      ),
      body4: TextStyle(
        fontFamily: _fontFamily,
        fontSize: 18,
        fontWeight: FontWeight.w400,
      ),
      smallText1: TextStyle(
        fontFamily: _fontFamily,
        fontSize: 12,
        fontWeight: FontWeight.w400,
      ),
      smallText2: TextStyle(
        fontFamily: _fontFamily,
        fontSize: 14,
        fontWeight: FontWeight.w400,
      ),
      smallText3: TextStyle(
        fontFamily: _fontFamily,
        fontSize: 16,
        fontWeight: FontWeight.w400,
      ),
      smallText4: TextStyle(
        fontFamily: _fontFamily,
        fontSize: 18,
        fontWeight: FontWeight.w400,
      ),
      headline1: TextStyle(
        fontFamily: _fontFamily,
        fontSize: 24,
        fontWeight: FontWeight.w400,
      ),
      headline2: TextStyle(
        fontFamily: _fontFamily,
        fontSize: 28,
        fontWeight: FontWeight.w400,
      ),
      headline3: TextStyle(
        fontFamily: _fontFamily,
        fontSize: 32,
        fontWeight: FontWeight.w400,
      ),
      title1: TextStyle(
        fontFamily: _fontFamily,
        fontSize: 18,
        fontWeight: FontWeight.w400,
      ),
      title2: TextStyle(
        fontFamily: _fontFamily,
        fontSize: 20,
        fontWeight: FontWeight.w400,
      ),
      title3: TextStyle(
        fontFamily: _fontFamily,
        fontSize: 22,
        fontWeight: FontWeight.w400,
      ),
      subtitle1: TextStyle(
        fontFamily: _fontFamily,
        fontSize: 16,
        fontWeight: FontWeight.w400,
      ),
      subtitle2: TextStyle(
        fontFamily: _fontFamily,
        fontSize: 18,
        fontWeight: FontWeight.w400,
      ),
      subtitle3: TextStyle(
        fontFamily: _fontFamily,
        fontSize: 20,
        fontWeight: FontWeight.w400,
      ),
      subtitle4: TextStyle(
        fontFamily: _fontFamily,
        fontSize: 22,
        fontWeight: FontWeight.w400,
      ),
    );
  }

  @override
  ThemeExtension<AppTextStyle> lerp(
    covariant ThemeExtension<AppTextStyle>? other,
    double t,
  ) {
    if (other == null || other is! AppTextStyle) return this;

    return AppTextStyle(
      label1: TextStyle.lerp(label1, other.label1, t) ?? label1,
      label2: TextStyle.lerp(label2, other.label2, t) ?? label2,
      label3: TextStyle.lerp(label3, other.label3, t) ?? label3,
      body1: TextStyle.lerp(body1, other.body1, t) ?? body1,
      body2: TextStyle.lerp(body2, other.body2, t) ?? body2,
      body3: TextStyle.lerp(body3, other.body3, t) ?? body3,
      body4: TextStyle.lerp(body4, other.body4, t) ?? body4,
      smallText1: TextStyle.lerp(smallText1, other.smallText1, t) ?? smallText1,
      smallText2: TextStyle.lerp(smallText2, other.smallText2, t) ?? smallText2,
      smallText3: TextStyle.lerp(smallText3, other.smallText3, t) ?? smallText3,
      smallText4: TextStyle.lerp(smallText4, other.smallText4, t) ?? smallText4,
      headline1: TextStyle.lerp(headline1, other.headline1, t) ?? headline1,
      headline2: TextStyle.lerp(headline2, other.headline2, t) ?? headline2,
      headline3: TextStyle.lerp(headline3, other.headline3, t) ?? headline3,
      title1: TextStyle.lerp(title1, other.title1, t) ?? title1,
      title2: TextStyle.lerp(title2, other.title2, t) ?? title2,
      title3: TextStyle.lerp(title3, other.title3, t) ?? title3,
      subtitle1: TextStyle.lerp(subtitle1, other.subtitle1, t) ?? subtitle1,
      subtitle2: TextStyle.lerp(subtitle2, other.subtitle2, t) ?? subtitle2,
      subtitle3: TextStyle.lerp(subtitle3, other.subtitle3, t) ?? subtitle3,
      subtitle4: TextStyle.lerp(subtitle4, other.subtitle4, t) ?? subtitle4,
    );
  }
}
