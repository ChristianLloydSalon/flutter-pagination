import 'package:exam/common/theme/extension/app_theme_extension.dart';
import 'package:exam/common/theme/layout/screen_size.dart';
import 'package:flutter/material.dart';

class NoMoreItemsSpiel extends StatelessWidget {
  const NoMoreItemsSpiel({super.key});

  @override
  Widget build(BuildContext context) {
    return Text(
      'No more items to show',
      style: context.isMobile
          ? context.textStyle.smallText1
          : context.textStyle.smallText2,
    );
  }
}
