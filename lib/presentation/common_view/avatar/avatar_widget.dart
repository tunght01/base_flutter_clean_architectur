import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:soft_dream_test/presentation/resource/generated/assets.gen.dart';

class AvatarWidget extends StatelessWidget {
  const AvatarWidget({
    super.key,
    this.avatarUrl,
    this.size = 32,
    this.radius = 100,
  });

  final String? avatarUrl;
  final double size, radius;

  @override
  Widget build(BuildContext context) {
    late final Widget img;
    try {
      img = CachedNetworkImage(
        imageUrl: avatarUrl ?? '',
        width: size,
        height: size,
        placeholderFadeInDuration: const Duration(seconds: 1),
        placeholder: (_, _) => const CircularProgressIndicator(),
        errorWidget: (_, _, _) => Assets.images.imgAvatarDefault.image(),
      );
    } catch (e) {
      img = Assets.images.imgAvatarDefault.image();
    }
    return ClipRRect(
      borderRadius: BorderRadius.circular(radius),
      child: SizedBox(
        width: size,
        height: size,
        child: avatarUrl?.isEmpty ?? true
            ? Assets.images.imgAvatarDefault.image()
            : img,
      ),
    );
  }
}
