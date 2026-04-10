import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../core/shared/utils/extensions/context_extensions.dart';
import '../../../../core/shared/widgets/glassmorphic_container.dart';
import '../../../../core/theme/app_spacing.dart';
import '../cubits/caesar/caesar_cubit.dart';
import '../cubits/caesar/caesar_state.dart';
import 'animated_brute_force_item.dart';

class CaesarBruteForceResults extends StatelessWidget {
  const CaesarBruteForceResults({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<CaesarCubit, CaesarState>(
      buildWhen: (prev, next) =>
          prev.bruteForceResults != next.bruteForceResults,
      builder: (context, state) {
        final results = state.bruteForceResults;
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
                return AnimatedBruteForceItem(
                  index: index,
                  child: GlassmorphicContainer(
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
                            color: context.cyberColors.neonGreen
                                .withValues(alpha: 0.1),
                            borderRadius: BorderRadius.circular(4),
                            border: Border.all(
                              color: context.cyberColors.neonGreen
                                  .withValues(alpha: 0.5),
                            ),
                          ),
                          child: Text(
                            '${result.shift}',
                            style: context.textTheme.labelMedium?.copyWith(
                              color: context.cyberColors.neonGreen,
                            ),
                          ),
                        ),
                        const SizedBox(width: AppSpacing.md),
                        Expanded(
                          child: Text(
                            result.output,
                            style: context.cyberText.cipherSmall.copyWith(
                              color: context.colorScheme.onSurface,
                              fontWeight: FontWeight.w600,
                              fontSize: 14,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                );
              },
            ),
          ],
        );
      },
    );
  }
}
