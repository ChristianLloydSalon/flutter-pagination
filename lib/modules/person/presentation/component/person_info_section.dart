import 'package:exam/common/helper/extension/iterable_extension.dart';
import 'package:exam/common/theme/extension/app_theme_extension.dart';
import 'package:exam/modules/person/presentation/component/person_info_item.dart';
import 'package:flutter/material.dart';

class PersonInfoSection extends StatelessWidget {
  const PersonInfoSection({
    super.key,
    required this.state,
  });

  final PersonInfoUiState state;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          state.title,
          style: context.textStyle.title1,
          overflow: TextOverflow.ellipsis,
          maxLines: 1,
        ),
        Divider(color: context.colors.divider),
        SizedBox(height: context.layout.spacingSmall),
        ...state.items.mapIndexed(
          (index, item) => Padding(
            padding: EdgeInsets.only(
              bottom: index == state.items.length - 1
                  ? 0
                  : context.layout.spacingSmall,
            ),
            child: PersonInfoItem(
              state: item.state,
            ),
          ),
        ),
      ],
    );
  }
}

class PersonInfoUiState {
  const PersonInfoUiState({
    required this.title,
    required this.items,
  });

  final String title;
  final List<PersonInfoItem> items;
}
