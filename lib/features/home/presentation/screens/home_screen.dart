import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../core/shared/cubits/locale/locale_cubit.dart';
import '../../../../core/shared/cubits/locale/locale_state.dart';
import '../../../../core/shared/domain/enums/app_language.dart';
import '../../../../core/shared/domain/enums/cipher_type.dart';
import '../../../../core/shared/presentation/widgets/animated_gradient_background.dart';
import '../../../../core/shared/utils/extensions/context_extensions.dart';
import '../../../../core/theme/app_spacing.dart';
import '../widgets/animated_title.dart';
import '../widgets/cipher_selection_card.dart';
import '../widgets/language_toggle_button.dart';
import '../widgets/theme_toggle_button.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<LocaleCubit, LocaleState>(
      buildWhen: (prev, next) => prev != next,
      builder: (context, localeState) {
        final t = context.t;
        return Scaffold(
          appBar: _buildAppBar(context, t),
          body: AnimatedGradientBackground(
            child: SafeArea(
              child: SingleChildScrollView(
                padding: const EdgeInsets.all(AppSpacing.lg),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const SizedBox(height: AppSpacing.xl),
                    _buildHero(context, localeState.language),
                    const SizedBox(height: AppSpacing.xxl),
                    Text(
                      t.home.chooseCipher,
                      style: context.textTheme.labelLarge?.copyWith(
                        color: context.colorScheme.onSurface
                            .withValues(alpha: 0.6),
                      ),
                    ),
                    const SizedBox(height: AppSpacing.md),
                    _buildCaesarCard(context, t, localeState.language),
                    const SizedBox(height: AppSpacing.lg),
                    _buildVigenereCard(context, t, localeState.language),
                    const SizedBox(height: AppSpacing.xl),
                  ],
                ),
              ),
            ),
          ),
        );
      },
    );
  }

  PreferredSizeWidget _buildAppBar(BuildContext context, t) {
    return AppBar(
      title: Text(
        t.app.title,
        style: context.textTheme.displaySmall
            ?.copyWith(color: context.cyberColors.neonCyan),
      ),
      actions: const [
        ThemeToggleButton(),
        SizedBox(width: AppSpacing.sm),
        LanguageToggleButton(),
        SizedBox(width: AppSpacing.md),
      ],
    );
  }

  Widget _buildHero(
    BuildContext context,
    AppLanguage language,
  ) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        AnimatedTitle(
          text: context.t.home.title,
          style: context.textTheme.displayLarge!
              .copyWith(color: context.cyberColors.neonCyan),
        ),
        const SizedBox(height: AppSpacing.sm),
        Text(
          context.t.home.subtitle,
          style: context.textTheme.bodyLarge!.copyWith(
            color: context.colorScheme.onSurface.withValues(alpha: 0.7),
          ),
        ),
      ],
    );
  }

  Widget _buildCaesarCard(BuildContext context, t, AppLanguage language) {
    return CipherSelectionCard(
      type: CipherType.caesar,
      title: t.home.caesar.title,
      description: t.home.caesar.description,
      icon: Icons.rotate_right_rounded,
      color: context.cyberColors.neonCyan,
      delay: const Duration(milliseconds: 200),
    );
  }

  Widget _buildVigenereCard(BuildContext context, t, AppLanguage language) {
    return CipherSelectionCard(
      type: CipherType.vigenere,
      title: t.home.vigenere.title,
      description: t.home.vigenere.description,
      icon: Icons.grid_on_rounded,
      color: context.cyberColors.neonPurple,
      delay: const Duration(milliseconds: 400),
    );
  }
}
