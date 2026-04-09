import 'package:flutter/material.dart';

import '../../../theme/app_radius.dart';
import '../../../theme/app_spacing.dart';
import '../../utils/extensions/context_extensions.dart';

class NeonButton extends StatefulWidget {
  const NeonButton({
    super.key,
    required this.label,
    required this.onPressed,
    this.color,
    this.icon,
    this.isLoading = false,
    this.width,
  });

  final String label;
  final VoidCallback? onPressed;
  final Color? color;
  final IconData? icon;
  final bool isLoading;
  final double? width;

  @override
  State<NeonButton> createState() => _NeonButtonState();
}

class _NeonButtonState extends State<NeonButton>
    with SingleTickerProviderStateMixin {
  late AnimationController _glowController;
  late Animation<double> _glowAnimation;

  @override
  void initState() {
    super.initState();
    _glowController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 1500),
    )..repeat(reverse: true);
    _glowAnimation = Tween<double>(begin: 0.3, end: 0.8).animate(
      CurvedAnimation(parent: _glowController, curve: Curves.easeInOut),
    );
  }

  @override
  void dispose() {
    _glowController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: _glowAnimation,
      builder: (context, _) {
        final resolvedColor = widget.color ?? context.cyberColors.neonCyan;
        return Container(
          width: widget.width,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(AppRadius.md),
            boxShadow: [
              BoxShadow(
                color:
                    resolvedColor.withValues(alpha: _glowAnimation.value * 0.5),
                blurRadius: 16,
                spreadRadius: 2,
              ),
            ],
          ),
          child: ElevatedButton(
            onPressed: widget.isLoading ? null : widget.onPressed,
            style: ElevatedButton.styleFrom(
              backgroundColor: resolvedColor.withValues(alpha: 0.15),
              foregroundColor: resolvedColor,
              side: BorderSide(color: resolvedColor, width: 1.5),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(AppRadius.md),
              ),
              padding: const EdgeInsets.symmetric(
                horizontal: AppSpacing.lg,
                vertical: AppSpacing.md,
              ),
              elevation: 0,
            ),
            child: widget.isLoading
                ? SizedBox(
                    width: 20,
                    height: 20,
                    child: CircularProgressIndicator(
                      strokeWidth: 2,
                      valueColor: AlwaysStoppedAnimation<Color>(resolvedColor),
                    ),
                  )
                : Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      if (widget.icon != null) ...[
                        Icon(widget.icon, size: 18),
                        const SizedBox(width: AppSpacing.sm),
                      ],
                      Text(
                        widget.label,
                        style: context.textTheme.labelLarge
                            ?.copyWith(color: resolvedColor),
                      ),
                    ],
                  ),
          ),
        );
      },
    );
  }
}
