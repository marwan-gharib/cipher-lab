import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../core/shared/domain/enums/app_language.dart';
import '../../../../core/shared/widgets/animated_gradient_background.dart';
import '../../../../core/shared/utils/extensions/context_extensions.dart';
import '../../../../core/theme/app_spacing.dart';
import '../cubits/caesar/caesar_cubit.dart';
import '../cubits/caesar/caesar_state.dart';
import '../widgets/caesar_brute_force_results.dart';
import '../widgets/caesar_input_section.dart';
import '../widgets/caesar_result_display.dart';
import '../widgets/caesar_shift_slider.dart';

class CaesarScreen extends StatelessWidget {
  const CaesarScreen({super.key, required this.language});

  final AppLanguage language;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(context.t.caesar.title),
      ),
      body: AnimatedGradientBackground(
        child: SafeArea(
          child: BlocListener<CaesarCubit, CaesarState>(
            listener: (context, state) {
              if (state.errorMessage != null) {
                final message = switch (state.errorMessage) {
                  'emptyInput' => context.t.caesar.errorEmptyInput,
                  'invalidInput' => context.t.caesar.errorInvalidInput,
                  _ => state.errorMessage!,
                };
                context.showSnackBar(message, isError: true);
              }
            },
            child: SingleChildScrollView(
              padding: const EdgeInsets.all(AppSpacing.lg),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  CaesarInputSection(language: language),
                  const SizedBox(height: AppSpacing.xl),
                  CaesarShiftSlider(
                    alphabetLength: language.alphabetLength,
                  ),
                  const SizedBox(height: AppSpacing.xl),
                  const CaesarResultDisplay(),
                  const SizedBox(height: AppSpacing.xl),
                  const CaesarBruteForceResults(),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
