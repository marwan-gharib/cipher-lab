import 'dart:ui';

import 'package:flutter/material.dart';

import '../../theme/app_radius.dart';
import '../utils/extensions/context_extensions.dart';

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
    this.isCircle = false,
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
  final bool isCircle;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: width,
      height: height,
      margin: margin,
      decoration: BoxDecoration(
        shape: isCircle ? BoxShape.circle : BoxShape.rectangle,
        borderRadius: isCircle ? null : BorderRadius.circular(borderRadius),
        boxShadow: glowColor != null
            ? [BoxShadow(color: glowColor!, blurRadius: 20, spreadRadius: 2)]
            : null,
      ),
      child: ClipPath(
        clipper: isCircle ? const ShapeBorderClipper(shape: CircleBorder()) : null,
        child: BackdropFilter(
          filter: ImageFilter.blur(sigmaX: blur, sigmaY: blur),
          child: Container(
            padding: padding,
            decoration: BoxDecoration(
              shape: isCircle ? BoxShape.circle : BoxShape.rectangle,
              gradient: LinearGradient(
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
                colors: [
                  context.cyberColors.glassWhiteStrong,
                  context.cyberColors.glassWhite,
                ],
              ),
              borderRadius: isCircle ? null : BorderRadius.circular(borderRadius),
              border: Border.all(
                color: borderColor ?? context.cyberColors.glassBorder,
                width: 2.0,
              ),
            ),
            child: child,
          ),
        ),
      ),
    );
  }
}
