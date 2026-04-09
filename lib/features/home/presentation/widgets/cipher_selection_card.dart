import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../../../../core/routing/routes.dart';
import '../../../../core/shared/domain/enums/cipher_type.dart';
import '../../../../core/shared/presentation/widgets/glassmorphic_container.dart';
import '../../../../core/shared/utils/extensions/context_extensions.dart';
import '../../../../core/theme/app_radius.dart';
import '../../../../core/theme/app_spacing.dart';

class CipherSelectionCard extends StatefulWidget {
  const CipherSelectionCard({
    super.key,
    required this.type,
    required this.title,
    required this.description,
    required this.icon,
    required this.color,
    required this.delay,
  });

  final CipherType type;
  final String title;
  final String description;
  final IconData icon;
  final Color color;
  final Duration delay;

  @override
  State<CipherSelectionCard> createState() => _CipherSelectionCardState();
}

class _CipherSelectionCardState extends State<CipherSelectionCard>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _scaleAnim;
  late Animation<double> _fadeAnim;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 2000),
    );
    _scaleAnim = Tween<double>(begin: 0.8, end: 1.0).animate(
      CurvedAnimation(parent: _controller, curve: Curves.elasticOut),
    );
    _fadeAnim = Tween<double>(begin: 0.0, end: 1.0).animate(
      CurvedAnimation(parent: _controller, curve: Curves.easeIn),
    );

    Future<void>.delayed(widget.delay, () {
      if (mounted) _controller.forward();
    });
  }

  @override
  void didUpdateWidget(covariant CipherSelectionCard oldWidget) {
    super.didUpdateWidget(oldWidget);
    if (oldWidget.delay != widget.delay) {
      _controller.reset();
      Future<void>.delayed(widget.delay, () {
        if (mounted) _controller.forward();
      });
    }
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  void _navigate() {
    final route =
        widget.type == CipherType.caesar ? Routes.caesar : Routes.vigenere;
    context.push(route, extra: context.locale);
  }

  @override
  Widget build(BuildContext context) {
    return FadeTransition(
      opacity: _fadeAnim,
      child: ScaleTransition(
        scale: _scaleAnim,
        child: GestureDetector(
          onTap: _navigate,
          child: AnimatedContainer(
            duration: const Duration(milliseconds: 200),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(AppRadius.xl),
              boxShadow: [
                BoxShadow(
                  color: widget.color.withValues(alpha: 0.2),
                  blurRadius: 15,
                  spreadRadius: 1,
                ),
              ],
            ),
            child: GlassmorphicContainer(
              borderRadius: AppRadius.xl,
              borderColor: widget.color.withValues(alpha: 0.4),
              padding: const EdgeInsets.all(AppSpacing.xl),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  _buildIconHeader(),
                  const SizedBox(height: AppSpacing.lg),
                  _buildTitle(),
                  const SizedBox(height: AppSpacing.sm),
                  _buildDescription(),
                  const SizedBox(height: AppSpacing.lg),
                  _buildLaunchRow(),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildIconHeader() {
    return Container(
      width: 56,
      height: 56,
      decoration: BoxDecoration(
        color: widget.color.withValues(alpha: 0.15),
        borderRadius: BorderRadius.circular(AppRadius.md),
        border: Border.all(color: widget.color.withValues(alpha: 0.5)),
      ),
      child: Icon(widget.icon, color: widget.color, size: 28),
    );
  }

  Widget _buildTitle() {
    return Text(
      widget.title,
      style: Theme.of(context)
          .textTheme
          .displaySmall
          ?.copyWith(color: widget.color),
    );
  }

  Widget _buildDescription() {
    return Text(
      widget.description,
      style: Theme.of(context).textTheme.bodyMedium,
    );
  }

  Widget _buildLaunchRow() {
    return Row(
      children: [
        Text(
          context.t.common.launch,
          style: Theme.of(context)
              .textTheme
              .labelMedium
              ?.copyWith(color: widget.color),
        ),
      ],
    );
  }
}
