import 'package:flutter/material.dart';

import '../../../../core/shared/presentation/widgets/glassmorphic_container.dart';
import '../../../../core/shared/utils/extensions/context_extensions.dart';
import '../../../../core/theme/app_spacing.dart';
import '../../domain/entities/caesar_result.dart';

class CaesarBruteForceResults extends StatelessWidget {
  const CaesarBruteForceResults({
    super.key,
    required this.results,
  });

  final List<CaesarResult> results;

  @override
  Widget build(BuildContext context) {
    if (results.isEmpty) return const SizedBox.shrink();

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          context.t.caesar.bruteForceTitle,
          style: context.textTheme.labelLarge,
        ),
        const SizedBox(height: AppSpacing.sm),
        ListView.separated(
          shrinkWrap: true,
          physics: const NeverScrollableScrollPhysics(),
          itemCount: results.length,
          separatorBuilder: (context, index) =>
              const SizedBox(height: AppSpacing.sm),
          itemBuilder: (context, index) {
            final result = results[index];
            return GlassmorphicContainer(
              padding: const EdgeInsets.symmetric(
                horizontal: AppSpacing.md,
                vertical: AppSpacing.sm,
              ),
              child: Row(
                children: [
                  Container(
                    padding: const EdgeInsets.symmetric(
                      horizontal: AppSpacing.sm,
                      vertical: AppSpacing.xs,
                    ),
                    decoration: BoxDecoration(
                      color:
                          context.cyberColors.neonGreen.withValues(alpha: 0.1),
                      borderRadius: BorderRadius.circular(4),
                      border: Border.all(
                        color: context.cyberColors.neonGreen
                            .withValues(alpha: 0.5),
                      ),
                    ),
                    child: Text(
                      '${result.shift}',
                      style: context.textTheme.labelMedium
                          ?.copyWith(color: context.cyberColors.neonGreen),
                    ),
                  ),
                  const SizedBox(width: AppSpacing.md),
                  Expanded(
                    child: Text(
                      result.output,
                      style: context.cyberText.cipherSmall
                          .copyWith(color: context.colorScheme.onSurface),
                    ),
                  ),
                ],
              ),
            );
          },
        ),
      ],
    );
  }
}
