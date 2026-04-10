import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../core/shared/widgets/glassmorphic_container.dart';
import '../../../../core/shared/utils/extensions/context_extensions.dart';
import '../../../../core/theme/app_spacing.dart';
import '../cubits/caesar/caesar_cubit.dart';
import '../cubits/caesar/caesar_state.dart';

class CaesarResultDisplay extends StatelessWidget {
  const CaesarResultDisplay({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<CaesarCubit, CaesarState>(
      buildWhen: (prev, next) =>
          prev.result != next.result ||
          prev.isAnimating != next.isAnimating ||
          prev.animatedOutput != next.animatedOutput,
      builder: (context, state) {
        final resultStr = state.result?.output;
        if (resultStr == null && !state.isAnimating) {
          return const SizedBox.shrink();
        }

        final textToShow =
            state.isAnimating ? state.animatedOutput : (resultStr ?? '');

        return Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(context.t.caesar.result, style: context.textTheme.labelLarge),
            const SizedBox(height: AppSpacing.sm),
            GlassmorphicContainer(
              padding: const EdgeInsets.all(AppSpacing.md),
              borderColor: context.cyberColors.neonCyan.withValues(alpha: 0.5),
              child: Row(
                children: [
                  Expanded(
                    child: SelectableText(
                      textToShow,
                      style: context.cyberText.cipherMedium
                          .copyWith(color: context.cyberColors.neonCyan),
                    ),
                  ),
                  if (!state.isAnimating &&
                      resultStr != null &&
                      resultStr.isNotEmpty)
                    IconButton(
                      icon: Icon(
                        Icons.copy_rounded,
                        color: context.cyberColors.neonCyan,
                      ),
                      onPressed: () {
                        Clipboard.setData(ClipboardData(text: resultStr));
                        context.showSnackBar(context.t.caesar.copied);
                      },
                    ),
                ],
              ),
            ),
          ],
        );
      },
    );
  }
}
