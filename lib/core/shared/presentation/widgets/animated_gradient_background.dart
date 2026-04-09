import 'package:flutter/material.dart';

import '../../utils/extensions/context_extensions.dart';

class AnimatedGradientBackground extends StatefulWidget {
  const AnimatedGradientBackground({super.key, required this.child});

  final Widget child;

  @override
  State<AnimatedGradientBackground> createState() =>
      _AnimatedGradientBackgroundState();
}

class _AnimatedGradientBackgroundState extends State<AnimatedGradientBackground>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<Alignment> _topAlignment;
  late Animation<Alignment> _bottomAlignment;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 6),
    )..repeat(reverse: true);

    _topAlignment = TweenSequence<Alignment>([
      TweenSequenceItem(
        tween:
            AlignmentTween(begin: Alignment.topLeft, end: Alignment.topRight),
        weight: 1,
      ),
      TweenSequenceItem(
        tween:
            AlignmentTween(begin: Alignment.topRight, end: Alignment.topLeft),
        weight: 1,
      ),
    ]).animate(CurvedAnimation(parent: _controller, curve: Curves.easeInOut));

    _bottomAlignment = TweenSequence<Alignment>([
      TweenSequenceItem(
        tween: AlignmentTween(
          begin: Alignment.bottomRight,
          end: Alignment.bottomLeft,
        ),
        weight: 1,
      ),
      TweenSequenceItem(
        tween: AlignmentTween(
          begin: Alignment.bottomLeft,
          end: Alignment.bottomRight,
        ),
        weight: 1,
      ),
    ]).animate(CurvedAnimation(parent: _controller, curve: Curves.easeInOut));
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: _controller,
      builder: (context, child) => Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: _topAlignment.value,
            end: _bottomAlignment.value,
            colors: [
              context.colorScheme.surface,
              context.colorScheme.surfaceContainerHigh,
              const Color(0xFF0D1B3E),
              context.colorScheme.surface,
            ],
          ),
        ),
        child: child,
      ),
      child: widget.child,
    );
  }
}
