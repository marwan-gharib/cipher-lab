import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../core/shared/domain/enums/app_language.dart';
import '../../../../core/shared/presentation/widgets/animated_gradient_background.dart';
import '../../../../core/shared/presentation/widgets/neon_button.dart';
import '../../../../core/shared/utils/extensions/context_extensions.dart';
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
          child: BlocConsumer<VigenereCubit, VigenereState>(
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
            builder: (context, state) {
              return SingleChildScrollView(
                padding: const EdgeInsets.all(AppSpacing.lg),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    VigenereInputSection(language: language),
                    const SizedBox(height: AppSpacing.lg),
                    VigenereKeyInput(language: language),
                    const SizedBox(height: AppSpacing.xl),
                    VigenereResultDisplay(
                      result: state.result?.output,
                      isAnimating: state.isAnimating,
                      animatedOutput: state.animatedOutput,
                    ),
                    if (state.isAnimating &&
                        state.currentStepIndex >= 0 &&
                        state.result != null) ...[
                      const SizedBox(height: AppSpacing.xl),
                      VigenereStepVisualizer(
                        inputChar: state
                            .result!.steps[state.currentStepIndex].inputChar,
                        keyChar:
                            state.result!.steps[state.currentStepIndex].keyChar,
                        outputChar: state
                            .result!.steps[state.currentStepIndex].outputChar,
                      ),
                    ],
                    const SizedBox(height: AppSpacing.xl),
                    _buildTableToggle(context, state, language),
                    if (state.showTable) ...[
                      const SizedBox(height: AppSpacing.md),
                      TabulaRectaTable(
                        table: state.tabulaRecta,
                        language: language,
                        highlightedRow: state.highlightedRow,
                        highlightedCol: state.highlightedCol,
                      ),
                    ],
                  ],
                ),
              );
            },
          ),
        ),
      ),
    );
  }

  Widget _buildTableToggle(
    BuildContext context,
    VigenereState state,
    language,
  ) {
    return Center(
      child: NeonButton(
        label: state.showTable
            ? context.t.vigenere.hideTable
            : context.t.vigenere.showTable,
        icon: state.showTable
            ? Icons.visibility_off_rounded
            : Icons.visibility_rounded,
        onPressed: () => context.read<VigenereCubit>().toggleTable(language),
        color: context.cyberColors.neonCyan,
      ),
    );
  }
}
