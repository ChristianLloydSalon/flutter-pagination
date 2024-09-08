import 'package:cached_network_image/cached_network_image.dart';
import 'package:exam/common/theme/extension/app_theme_extension.dart';
import 'package:flutter/material.dart';

class CustomNetworkImage extends StatelessWidget {
  const CustomNetworkImage({required this.imageUrl, super.key});

  final String imageUrl;

  @override
  Widget build(BuildContext context) {
    return CachedNetworkImage(
      imageUrl: imageUrl,
      fit: BoxFit.cover,
      placeholder: (context, url) => const CircularProgressIndicator(),
      errorWidget: (context, url, error) => Icon(
        Icons.person_2_rounded,
        color: context.colors.fontPrimary,
      ),
    );
  }
}
