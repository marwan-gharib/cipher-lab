import 'package:flutter/material.dart';

import '../../../../core/shared/presentation/widgets/glassmorphic_container.dart';
import '../../../../core/shared/utils/extensions/context_extensions.dart';
import '../../../../core/theme/app_spacing.dart';

class VigenereStepVisualizer extends StatelessWidget {
  const VigenereStepVisualizer({
    super.key,
    required this.inputChar,
    required this.keyChar,
    required this.outputChar,
  });

  final String inputChar;
  final String keyChar;
  final String outputChar;

  @override
  Widget build(BuildContext context) {
    if (inputChar.isEmpty) return const SizedBox.shrink();

    return GlassmorphicContainer(
      padding: const EdgeInsets.all(AppSpacing.md),
      borderColor: context.cyberColors.neonPurple.withValues(alpha: 0.5),
      child: Column(
        children: [
          Text(
            context.t.vigenere.stepTitle,
            style: context.textTheme.labelLarge,
          ),
          const SizedBox(height: AppSpacing.md),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              _buildStepItem(
                context,
                context.t.vigenere.stepCol,
                inputChar,
                context.cyberColors.neonCyan,
              ),
              Icon(
                Icons.add,
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
                context.t.vigenere.stepResult,
                outputChar,
                context.cyberColors.neonGreen,
              ),
            ],
          ),
        ],
      ),
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
