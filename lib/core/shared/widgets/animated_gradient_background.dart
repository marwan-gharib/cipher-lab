import 'package:flutter/material.dart';

import '../utils/extensions/context_extensions.dart';

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
      duration: const Duration(seconds: 3),
    )..repeat(reverse: true);

    _topAlignment = AlignmentTween(
      begin: Alignment.topLeft,
      end: Alignment.topRight,
    ).animate(CurvedAnimation(parent: _controller, curve: Curves.easeInOut));

    _bottomAlignment = AlignmentTween(
      begin: Alignment.bottomRight,
      end: Alignment.bottomLeft,
    ).animate(CurvedAnimation(parent: _controller, curve: Curves.easeInOut));
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
        width: double.infinity,
        height: double.infinity,
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: _topAlignment.value,
            end: _bottomAlignment.value,
            colors: [
              context.colorScheme.surface,
              context.isDarkMode
                  ? context.colorScheme.surface
                  : context.cyberColors.backgroundGradientColor,
              context.cyberColors.backgroundGradientColor,
              context.isDarkMode
                  ? context.colorScheme.surface
                  : context.cyberColors.backgroundGradientColor,
              context.colorScheme.surface,
            ],
          ),
        ),
        child: child,
      ),
      child: RepaintBoundary(child: widget.child),
    );
  }
}
