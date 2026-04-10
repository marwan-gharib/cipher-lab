import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../core/shared/domain/enums/app_language.dart';
import '../../../../core/shared/utils/extensions/context_extensions.dart';
import '../../../../core/shared/widgets/neon_button.dart';
import '../../../../core/shared/widgets/neon_text_field.dart';
import '../../../../core/theme/app_spacing.dart';
import '../cubits/vigenere/vigenere_cubit.dart';
import '../cubits/vigenere/vigenere_state.dart';

class VigenereInputSection extends StatefulWidget {
  const VigenereInputSection({super.key, required this.language});

  final AppLanguage language;

  @override
  State<VigenereInputSection> createState() => _VigenereInputSectionState();
}

class _VigenereInputSectionState extends State<VigenereInputSection> {
  final TextEditingController _controller = TextEditingController();

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocListener<VigenereCubit, VigenereState>(
      listenWhen: (prev, next) =>
          prev.input != next.input && next.input.isEmpty,
      listener: (context, state) {
        if (state.input.isEmpty && _controller.text.isNotEmpty) {
          _controller.clear();
        }
      },
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            context.t.vigenere.inputLabel,
            style: context.textTheme.labelLarge,
          ),
          const SizedBox(height: AppSpacing.sm),
          NeonTextField(
            controller: _controller,
            hint: context.t.vigenere.inputHint,
            language: widget.language,
            maxLines: 3,
            onChanged: (val) => context.read<VigenereCubit>().updateInput(val),
          ),
          const SizedBox(height: AppSpacing.md),
          _buildAnimationToggle(context),
          const SizedBox(height: AppSpacing.md),
          _buildActionRow(context),
        ],
      ),
    );
  }

  Widget _buildAnimationToggle(BuildContext context) {
    return BlocBuilder<VigenereCubit, VigenereState>(
      buildWhen: (prev, next) => prev.shouldAnimate != next.shouldAnimate,
      builder: (context, state) {
        return Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(
              children: [
                Icon(
                  Icons.animation_rounded,
                  size: 20,
                  color: context.cyberColors.neonCyan.withValues(alpha: 0.8),
                ),
                const SizedBox(width: AppSpacing.sm),
                Text(
                  context.t.vigenere.animateResult,
                  style: context.textTheme.labelLarge?.copyWith(
                    color: context.colorScheme.onSurface.withValues(alpha: 0.9),
                  ),
                ),
              ],
            ),
            Switch.adaptive(
              value: state.shouldAnimate,
              activeThumbColor: context.cyberColors.neonCyan,
              activeTrackColor: context.cyberColors.neonCyan.withValues(alpha: 0.3),
              inactiveThumbColor: context.colorScheme.outline,
              inactiveTrackColor: context.colorScheme.surfaceContainerHighest,
              onChanged: (val) =>
                  context.read<VigenereCubit>().toggleAnimation(val),
            ),
          ],
        );
      },
    );
  }

  Widget _buildActionRow(BuildContext context) {
    final t = context.t;
    return BlocBuilder<VigenereCubit, VigenereState>(
      buildWhen: (prev, next) => prev.isAnimating != next.isAnimating,
      builder: (context, state) {
        final isAnimating = state.isAnimating;
        return Row(
          children: [
            Expanded(
              child: NeonButton(
                label: t.vigenere.encrypt,
                icon: Icons.lock_rounded,
                onPressed: isAnimating
                    ? null
                    : () => context.read<VigenereCubit>().encrypt(widget.language),
                color: context.cyberColors.neonCyan,
              ),
            ),
            const SizedBox(width: AppSpacing.sm),
            Expanded(
              child: NeonButton(
                label: t.vigenere.decrypt,
                icon: Icons.lock_open_rounded,
                onPressed: isAnimating
                    ? null
                    : () => context.read<VigenereCubit>().decrypt(widget.language),
                color: context.cyberColors.neonPurple,
              ),
            ),
          ],
        );
      },
    );
  }
}
