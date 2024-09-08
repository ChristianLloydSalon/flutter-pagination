import 'package:exam/common/theme/extension/app_theme_extension.dart';
import 'package:exam/common/theme/layout/screen_size.dart';
import 'package:exam/modules/person/presentation/component/person_avatar.dart';
import 'package:flutter/material.dart';

class PersonCard extends StatelessWidget {
  const PersonCard._({
    required this.state,
    required this.onPressed,
    super.key,
  });

  final PersonCardUiState state;
  final void Function()? onPressed;

  factory PersonCard.gridView({
    required PersonCardUiState state,
    void Function()? onPressed,
    Key? key,
  }) {
    return _PersonGridViewCard(
      state: state,
      onPressed: onPressed,
      key: key,
    );
  }

  factory PersonCard.listView({
    required PersonCardUiState state,
    void Function()? onPressed,
    Key? key,
  }) {
    return _PersonListViewCard(
      state: state,
      onPressed: onPressed,
      key: key,
    );
  }

  @override
  Widget build(BuildContext context) {
    return const Placeholder();
  }
}

class _PersonGridViewCard extends PersonCard {
  const _PersonGridViewCard({
    required super.state,
    super.onPressed,
    super.key,
  }) : super._();

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onPressed,
      child: Card(
        child: Padding(
          padding: EdgeInsets.all(context.layout.paddingMedium),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              PersonAvatar(
                state: PersonAvatarUiState(
                  imageUrl: state.imageUrl,
                  radius: context.layout.radiusMedium,
                ),
              ),
              SizedBox(height: context.layout.spacingSmall),
              Flexible(
                child: Text(
                  state.name,
                  style: context.isMobile
                      ? context.textStyle.body3
                      : context.textStyle.body4,
                  overflow: TextOverflow.ellipsis,
                  maxLines: 1,
                ),
              ),
              Text(
                state.email,
                style: context.textStyle.label1.copyWith(
                  color: context.colors.interactive,
                ),
                overflow: TextOverflow.ellipsis,
                maxLines: 1,
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class _PersonListViewCard extends PersonCard {
  const _PersonListViewCard({
    required super.state,
    super.onPressed,
    super.key,
  }) : super._();

  @override
  Widget build(BuildContext context) {
    return ListTile(
      onTap: onPressed,
      leading: PersonAvatar(
        state: PersonAvatarUiState(
          imageUrl: state.imageUrl,
          radius: context.layout.radiusSmall,
        ),
      ),
      title: Text(
        state.name,
        style: context.textStyle.body3,
        overflow: TextOverflow.ellipsis,
        maxLines: 1,
      ),
      subtitle: Text(
        state.email,
        style: context.textStyle.body2.copyWith(
          color: context.colors.interactive,
        ),
        overflow: TextOverflow.ellipsis,
        maxLines: 1,
      ),
      trailing: const Icon(Icons.arrow_forward_ios_rounded),
    );
  }
}

class PersonCardUiState {
  const PersonCardUiState({
    required this.name,
    required this.email,
    required this.imageUrl,
  });

  final String name;
  final String email;
  final String imageUrl;
}
