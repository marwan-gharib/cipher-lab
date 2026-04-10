import 'package:flutter/material.dart';

import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../core/shared/widgets/glassmorphic_container.dart';
import '../../../../core/shared/utils/extensions/context_extensions.dart';
import '../../../../core/theme/app_spacing.dart';
import '../cubits/vigenere/vigenere_cubit.dart';
import '../cubits/vigenere/vigenere_state.dart';

class VigenereStepVisualizer extends StatelessWidget {
  const VigenereStepVisualizer({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<VigenereCubit, VigenereState>(
      buildWhen: (prev, next) =>
          prev.isAnimating != next.isAnimating ||
          prev.currentStepIndex != next.currentStepIndex ||
          prev.result != next.result,
      builder: (context, state) {
        if (!state.isAnimating ||
            state.currentStepIndex < 0 ||
            state.result == null) {
          return const SizedBox.shrink();
        }

        final step = state.result!.steps[state.currentStepIndex];
        final inputChar = step.inputChar;
        final keyChar = step.keyChar;
        final outputChar = step.outputChar;
        final isEncrypt = state.result!.isEncrypt;

        if (inputChar.isEmpty) return const SizedBox.shrink();

        return GlassmorphicContainer(
          padding: const EdgeInsets.all(AppSpacing.md),
          borderColor: context.cyberColors.neonPurple.withValues(alpha: 0.5),
          child: Column(
            children: [
              Text(
                isEncrypt
                    ? context.t.vigenere.stepTitleEncrypt
                    : context.t.vigenere.stepTitleDecrypt,
                style: context.textTheme.labelLarge,
              ),
              const SizedBox(height: AppSpacing.md),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  _buildStepItem(
                    context,
                    isEncrypt
                        ? context.t.vigenere.stepCol
                        : context.t.vigenere.stepResult,
                    inputChar,
                    isEncrypt
                        ? context.cyberColors.neonCyan
                        : context.cyberColors.neonGreen,
                  ),
                  Icon(
                    isEncrypt ? Icons.add : Icons.remove,
                    color: context.colorScheme.onSurface.withValues(alpha: 0.6),
                  ),
                  _buildStepItem(
                    context,
                    context.t.vigenere.stepRow,
                    keyChar,
                    context.cyberColors.neonPurple,
                  ),
                  Icon(
                    Icons.arrow_forward,
                    color: context.colorScheme.onSurface.withValues(alpha: 0.6),
                  ),
                  _buildStepItem(
                    context,
                    isEncrypt
                        ? context.t.vigenere.stepResult
                        : context.t.vigenere.stepCol,
                    outputChar,
                    isEncrypt
                        ? context.cyberColors.neonGreen
                        : context.cyberColors.neonCyan,
                  ),
                ],
              ),
            ],
          ),
        );
      },
    );
  }

  Widget _buildStepItem(
    BuildContext context,
    String label,
    String value,
    Color color,
  ) {
    return Column(
      children: [
        Text(label, style: context.textTheme.bodySmall),
        const SizedBox(height: AppSpacing.xs),
        Container(
          width: 40,
          height: 40,
          alignment: Alignment.center,
          decoration: BoxDecoration(
            color: color.withValues(alpha: 0.15),
            borderRadius: BorderRadius.circular(8),
            border: Border.all(color: color, width: 1.5),
          ),
          child: Text(
            value.toUpperCase(),
            style: context.textTheme.displaySmall
                ?.copyWith(color: color, fontSize: 18),
          ),
        ),
      ],
    );
  }
}
