import 'package:flutter/material.dart';

class AnimatedArrow extends StatelessWidget {
  const AnimatedArrow({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TweenAnimationBuilder<double>(
      child: const Icon(Icons.arrow_forward),
      duration: const Duration(seconds: 3),
      curve: Curves.bounceOut,
      tween: Tween(begin: 0.0, end: 1.0),
      builder: (context, value, child) {
        return Transform.translate(
          offset: Offset(value * 15, 10.0),
          child: child,
        );
      },
    );
  }
}
