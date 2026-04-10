import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../core/shared/cubits/locale/locale_cubit.dart';
import '../../../../core/shared/cubits/locale/locale_state.dart';
import '../../../../core/shared/domain/enums/app_language.dart';
import '../../../../core/shared/utils/extensions/context_extensions.dart';
import '../../../../core/shared/utils/flag_emoji.dart';
import '../../../../core/theme/app_radius.dart';
import '../../../../core/theme/app_spacing.dart';

class LanguageToggleButton extends StatelessWidget {
  const LanguageToggleButton({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<LocaleCubit, LocaleState>(
      buildWhen: (prev, next) => prev != next,
      builder: (context, state) {
        final isEnglish = state.language == AppLanguage.english;
        final color = isEnglish
            ? context.cyberColors.neonCyan
            : context.cyberColors.neonPurple;

        return GestureDetector(
          onTap: () => context.read<LocaleCubit>().toggleLanguage(),
          child: AnimatedSwitcher(
            duration: const Duration(milliseconds: 300),
            transitionBuilder: (child, animation) {
              final rotateAnim =
                  Tween<double>(begin: 3.14159, end: 0.0).animate(animation);
              return AnimatedBuilder(
                animation: rotateAnim,
                child: child,
                builder: (context, child) {
                  final isBack = rotateAnim.value > 1.57079;
                  final value =
                      isBack ? 3.14159 - rotateAnim.value : rotateAnim.value;
                  return Transform(
                    transform: Matrix4.identity()
                      ..setEntry(3, 2, 0.001)
                      ..rotateY(value),
                    alignment: Alignment.center,
                    child: child,
                  );
                },
              );
            },
            child: Container(
              key: ValueKey(state.language),
              padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 8),
              decoration: BoxDecoration(
                color: color.withValues(alpha: 0.15),
                borderRadius: BorderRadius.circular(AppRadius.full),
                border: Border.all(color: color, width: 1.5),
                boxShadow: [
                  BoxShadow(
                    color: color.withValues(alpha: 0.2),
                    blurRadius: 10,
                    spreadRadius: 2,
                  ),
                ],
              ),
              child: Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Text(
                    FlagEmoji.getFlagEmoji(isEnglish ? 'US' : 'EG'),
                    style: const TextStyle(fontSize: 18),
                  ),
                  const SizedBox(width: AppSpacing.sm),
                  Text(
                    state.language.displayCode,
                    style: context.textTheme.labelMedium?.copyWith(
                      color: color,
                      fontWeight: FontWeight.w800,
                      letterSpacing: 1.2,
                    ),
                  ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}
