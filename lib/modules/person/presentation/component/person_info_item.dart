import 'package:exam/common/theme/extension/app_theme_extension.dart';
import 'package:flutter/material.dart';

class PersonInfoItem extends StatelessWidget {
  const PersonInfoItem({
    required this.state,
    super.key,
  });

  final PersonInfoItemUiState state;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Icon(
          state.icon,
          color: context.colors.fontTertiary,
        ),
        SizedBox(width: context.layout.spacingSmall),
        Flexible(
          child: Text(
            state.value,
            style: context.textStyle.label2.copyWith(
              color: state.valueColor ?? context.colors.fontPrimary,
            ),
          ),
        ),
      ],
    );
  }
}

class PersonInfoItemUiState {
  const PersonInfoItemUiState({
    required this.icon,
    required this.value,
    this.valueColor,
  });

  final IconData icon;
  final String value;
  final Color? valueColor;
}
