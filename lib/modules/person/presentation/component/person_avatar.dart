import 'package:exam/common/component/image/custom_network_image.dart';
import 'package:exam/common/theme/extension/app_theme_extension.dart';
import 'package:flutter/material.dart';

class PersonAvatar extends StatelessWidget {
  const PersonAvatar({
    required this.state,
    super.key,
  });

  final PersonAvatarUiState state;

  @override
  Widget build(BuildContext context) {
    return CircleAvatar(
      backgroundColor: context.colors.interactive,
      radius: state.radius ?? context.layout.radiusLarge,
      child: CustomNetworkImage(
        imageUrl: state.imageUrl,
      ),
    );
  }
}

class PersonAvatarUiState {
  const PersonAvatarUiState({
    required this.imageUrl,
    this.radius,
  });

  final String imageUrl;
  final double? radius;
}
