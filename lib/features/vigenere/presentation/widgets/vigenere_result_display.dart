import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../core/shared/widgets/glassmorphic_container.dart';
import '../../../../core/shared/utils/extensions/context_extensions.dart';
import '../../../../core/theme/app_spacing.dart';
import '../cubits/vigenere/vigenere_cubit.dart';
import '../cubits/vigenere/vigenere_state.dart';

class VigenereResultDisplay extends StatelessWidget {
  const VigenereResultDisplay({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<VigenereCubit, VigenereState>(
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
            Text(context.t.vigenere.result, style: context.textTheme.labelLarge),
            const SizedBox(height: AppSpacing.sm),
            GlassmorphicContainer(
              padding: const EdgeInsets.all(AppSpacing.md),
              borderColor: context.cyberColors.neonCyan.withValues(alpha: 0.5),
              child: Row(
                children: [
                  Expanded(
                    child: SelectableText(
                      textToShow,
                      style: context.cyberText.cipherMedium,
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
                        context.showSnackBar(context.t.vigenere.copied);
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
