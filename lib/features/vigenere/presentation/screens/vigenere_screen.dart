import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../core/shared/domain/enums/app_language.dart';
import '../../../../core/shared/utils/extensions/context_extensions.dart';
import '../../../../core/shared/widgets/animated_gradient_background.dart';
import '../../../../core/shared/widgets/neon_button.dart';
import '../../../../core/theme/app_spacing.dart';
import '../cubits/vigenere/vigenere_cubit.dart';
import '../cubits/vigenere/vigenere_state.dart';
import '../widgets/tabula_recta_table.dart';
import '../widgets/vigenere_input_section.dart';
import '../widgets/vigenere_key_input.dart';
import '../widgets/vigenere_result_display.dart';
import '../widgets/vigenere_step_visualizer.dart';

class VigenereScreen extends StatelessWidget {
  const VigenereScreen({super.key, required this.language});

  final AppLanguage language;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(context.t.vigenere.title),
      ),
      body: AnimatedGradientBackground(
        child: SafeArea(
          child: BlocListener<VigenereCubit, VigenereState>(
            listener: (context, state) {
              if (state.errorMessage != null) {
                final message = switch (state.errorMessage) {
                  'emptyInput' => context.t.vigenere.errorEmptyInput,
                  'emptyKey' => context.t.vigenere.errorEmptyKey,
                  'invalidInput' => context.t.vigenere.errorInvalidInput,
                  'invalidKey' => context.t.vigenere.errorInvalidKey,
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
                  VigenereInputSection(language: language),
                  const SizedBox(height: AppSpacing.lg),
                  VigenereKeyInput(language: language),
                  const SizedBox(height: AppSpacing.xl),
                  const VigenereResultDisplay(),
                  const SizedBox(height: AppSpacing.lg),
                  const VigenereStepVisualizer(),
                  const SizedBox(height: AppSpacing.lg),
                  _buildTableToggle(context, language),
                  const SizedBox(height: AppSpacing.md),
                  TabulaRectaTable(language: language),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildTableToggle(
    BuildContext context,
    AppLanguage language,
  ) {
    return BlocBuilder<VigenereCubit, VigenereState>(
      buildWhen: (prev, next) => prev.showTable != next.showTable,
      builder: (context, state) {
        return Center(
          child: NeonButton(
            label: state.showTable
                ? context.t.vigenere.hideTable
                : context.t.vigenere.showTable,
            icon: state.showTable
                ? Icons.visibility_off_rounded
                : Icons.visibility_rounded,
            onPressed: () => context.read<VigenereCubit>().toggleShowTable(),
            color: context.cyberColors.neonCyan,
          ),
        );
      },
    );
  }
}
