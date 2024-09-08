import 'package:exam/common/bloc/theme_bloc.dart';
import 'package:exam/common/component/toggle/custom_toggle_switch.dart';
import 'package:exam/common/theme/extension/app_theme_extension.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ThemeModeSwitch extends StatelessWidget {
  const ThemeModeSwitch({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ThemeBloc, AppThemeMode>(
      builder: (context, state) {
        return CustomToggleSwitch(
          current: state,
          first: AppThemeMode.light,
          second: AppThemeMode.dark,
          firstIcon: Icon(
            Icons.wb_sunny,
            color: context.colors.primary,
          ),
          firstColor: context.colors.primary,
          secondIcon: Icon(
            Icons.nightlight_round,
            color: context.colors.primary,
          ),
          secondColor: context.colors.primary,
          onTap: (properties) {
            context.read<ThemeBloc>().toggle();
          },
        );
      },
    );
  }
}
