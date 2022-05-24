import 'package:flutter/material.dart';

class FavoriteIcon extends StatelessWidget {
  final bool isFavorite;
  const FavoriteIcon({required this.isFavorite, Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    if (!isFavorite) {
      return TweenAnimationBuilder<Color?>(
        duration: const Duration(seconds: 2),
        tween: ColorTween(begin: Colors.white, end: Colors.yellow),
        builder: (_, value, __) {
          return Icon(
            Icons.star,
            color: value,
          );
        },
      );
    } else {
      return TweenAnimationBuilder<Color?>(
        duration: const Duration(seconds: 2),
        tween: ColorTween(begin: Colors.amber, end: Colors.blueGrey),
        builder: (_, value, __) {
          return Icon(
            Icons.star_outline_outlined,
            color: value,
          );
        },
      );
    }
  }
}
