import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import '../../../../core/shared/presentation/widgets/glassmorphic_container.dart';
import '../../../../core/shared/utils/extensions/context_extensions.dart';
import '../../../../core/theme/app_spacing.dart';

class CaesarResultDisplay extends StatelessWidget {
  const CaesarResultDisplay({
    super.key,
    required this.result,
    required this.isAnimating,
    required this.animatedOutput,
  });

  final String? result;
  final bool isAnimating;
  final String animatedOutput;

  @override
  Widget build(BuildContext context) {
    if (result == null && !isAnimating) return const SizedBox.shrink();

    final textToShow = isAnimating ? animatedOutput : (result ?? '');

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
              if (!isAnimating && result != null && result!.isNotEmpty)
                IconButton(
                  icon: Icon(
                    Icons.copy_rounded,
                    color: context.cyberColors.neonCyan,
                  ),
                  onPressed: () {
                    Clipboard.setData(ClipboardData(text: result!));
                    context.showSnackBar(context.t.caesar.copied);
                  },
                ),
            ],
          ),
        ),
      ],
    );
  }
}
