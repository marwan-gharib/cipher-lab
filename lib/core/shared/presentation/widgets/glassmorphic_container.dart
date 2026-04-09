import 'dart:ui';

import 'package:flutter/material.dart';

import '../../../theme/app_radius.dart';
import '../../utils/extensions/context_extensions.dart';

class GlassmorphicContainer extends StatelessWidget {
  const GlassmorphicContainer({
    super.key,
    required this.child,
    this.borderRadius = AppRadius.lg,
    this.blur = 12.0,
    this.padding,
    this.margin,
    this.borderColor,
    this.glowColor,
    this.width,
    this.height,
  });

  final Widget child;
  final double borderRadius;
  final double blur;
  final EdgeInsetsGeometry? padding;
  final EdgeInsetsGeometry? margin;
  final Color? borderColor;
  final Color? glowColor;
  final double? width;
  final double? height;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: width,
      height: height,
      margin: margin,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(borderRadius),
        boxShadow: glowColor != null
            ? [BoxShadow(color: glowColor!, blurRadius: 20, spreadRadius: 2)]
            : null,
      ),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(borderRadius),
        child: BackdropFilter(
          filter: ImageFilter.blur(sigmaX: blur, sigmaY: blur),
          child: Container(
            padding: padding,
            decoration: BoxDecoration(
              gradient: LinearGradient(
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
                colors: [
                  context.cyberColors.glassWhiteStrong,
                  context.cyberColors.glassWhite,
                ],
              ),
              borderRadius: BorderRadius.circular(borderRadius),
              border: Border.all(
                color: borderColor ?? context.cyberColors.glassBorder,
                width: 1.0,
              ),
            ),
            child: child,
          ),
        ),
      ),
    );
  }
}
