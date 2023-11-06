import 'package:flutter/material.dart';

class CustomAnimatedText extends StatefulWidget {
  const CustomAnimatedText({
    super.key,
    required this.child,
    required this.begin,
    required this.end,
    this.duration = const Duration(milliseconds: 1000),
  });
  final Widget child;
  final Offset begin;
  final Offset end;
  final Duration duration;
  @override
  State<CustomAnimatedText> createState() => _CustomAnimatedTextState();
}

class _CustomAnimatedTextState extends State<CustomAnimatedText>
    with SingleTickerProviderStateMixin {
  late AnimationController animationController;

  // use Animation<Offset> to scale the value comes
  // from animation controller which is from 0-1 only
  late Animation<Offset> slidingAnimation;

  @override
  void initState() {
    super.initState();
    _initSlidingAnimation();
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: slidingAnimation,
      builder: (context, _) {
        return SlideTransition(
          position: slidingAnimation,
          child: widget.child,
        );
      },
    );
  }

  void _initSlidingAnimation() {
    animationController = AnimationController(
      vsync: this,
      duration: widget.duration,
    );

    slidingAnimation = Tween<Offset>(
      begin: widget.begin,
      end: widget.end,
    ).animate(animationController);

    animationController.forward();
  }

  @override
  void dispose() {
    animationController.dispose();
    super.dispose();
  }
}
