import 'package:flutter/material.dart';
import 'package:simple_animations/multi_tween/multi_tween.dart';
import 'package:simple_animations/simple_animations.dart';

enum AnimationType {opacity, translateX}

class FadeAnimation extends StatelessWidget {
  final double delay;
  final Widget child;
  const FadeAnimation({Key? key, required this.delay, required this.child}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final tween = MultiTween<AnimationType>()
    ..add(AnimationType.opacity,
    Tween(begin: 0.0, end: 1.0),
    const Duration(milliseconds: 500),
    )
    ..add(AnimationType.translateX,
    Tween(begin: -30.0, end: 1.0),
    const Duration(milliseconds: 500),
    );

    return PlayAnimation<MultiTweenValues<AnimationType>>(
      delay: Duration(milliseconds: (500 * delay).round()),
      duration: tween.duration,
      tween: tween,
      builder: (context, child, valus)=> Opacity(
        opacity: valus.get(AnimationType.opacity),
        child: Transform.translate(offset: Offset(0, valus.get(AnimationType.translateX)), child: child,),
      ),
    );
  }
}
