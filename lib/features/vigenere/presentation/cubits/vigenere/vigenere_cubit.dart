import 'dart:async';

import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../core/constants/app_constants.dart';
import '../../../../../core/shared/domain/enums/app_language.dart';
import '../../../domain/entities/vigenere_result.dart';
import '../../../domain/usecases/vigenere_cipher_usecase.dart';
import 'vigenere_state.dart';

class VigenereCubit extends Cubit<VigenereState> {
  VigenereCubit(
    this._cipherUseCase,
  ) : super(const VigenereState());

  final VigenereCipherUseCase _cipherUseCase;

  void updateInput(String value) => emit(
        state.copyWith(
          input: value,
          clearResult: true,
          clearError: true,
          highlightedRow: -1,
          highlightedCol: -1,
          currentStepIndex: -1,
        ),
      );

  void updateKey(String value) =>
      emit(state.copyWith(key: value, clearResult: true, clearError: true));

  void toggleShowTable() => emit(state.copyWith(showTable: !state.showTable));

  void toggleAnimation(bool value) =>
      emit(state.copyWith(shouldAnimate: value));

  Future<void> encrypt(AppLanguage language) async {
    if (state.input.trim().isEmpty) {
      emit(state.copyWith(errorMessage: 'emptyInput'));
      return;
    }
    if (state.key.trim().isEmpty) {
      emit(state.copyWith(errorMessage: 'emptyKey'));
      return;
    }

    emit(
      state.copyWith(
        clearError: true,
        isAnimating: true,
        animatedOutput: '',
        currentStepIndex: -1,
        highlightedRow: -1,
        highlightedCol: -1,
      ),
    );

    final table = language.tabulaRecta;
    final result = _cipherUseCase(
      text: state.input,
      key: state.key,
      language: language,
      isEncrypt: true,
    );
    emit(state.copyWith(tabulaRecta: table, result: result));

    if (state.shouldAnimate) {
      await _animateOutput(result, language);
    }

    emit(
      state.copyWith(
        animatedOutput: result.output,
        isAnimating: false,
        highlightedRow: -1,
        highlightedCol: -1,
      ),
    );
  }

  Future<void> decrypt(AppLanguage language) async {
    if (state.input.trim().isEmpty) {
      emit(state.copyWith(errorMessage: 'emptyInput'));
      return;
    }
    if (state.key.trim().isEmpty) {
      emit(state.copyWith(errorMessage: 'emptyKey'));
      return;
    }

    emit(
      state.copyWith(
        clearError: true,
        isAnimating: true,
        animatedOutput: '',
        currentStepIndex: -1,
        highlightedRow: -1,
        highlightedCol: -1,
      ),
    );

    final table = language.tabulaRecta;
    final result = _cipherUseCase(
      text: state.input,
      key: state.key,
      language: language,
      isEncrypt: false,
    );
    emit(state.copyWith(tabulaRecta: table, result: result));

    if (state.shouldAnimate) {
      await _animateOutput(result, language);
    }

    emit(
      state.copyWith(
        animatedOutput: result.output,
        isAnimating: false,
        highlightedRow: -1,
        highlightedCol: -1,
      ),
    );
  }

  Future<void> _animateOutput(
    VigenereResult vigenereResult,
    AppLanguage language,
  ) async {
    final animated = StringBuffer();

    final output = vigenereResult.output;
    int stepIndex = 0;
    for (int i = 0; i < output.length; i++) {
      if (!state.shouldAnimate) break;

      if (!language.alphabet.contains(output[i])) {
        animated.write(output[i]);
        continue;
      }

      animated.write(output[i]);
      final step = vigenereResult.steps[stepIndex];
      emit(
        state.copyWith(
          animatedOutput: animated.toString(),
          highlightedRow: step.rowIndex,
          highlightedCol: step.colIndex,
          currentStepIndex: stepIndex,
        ),
      );

      await Future<void>.delayed(AppConstants.vigenereLetterAnimationDelay);
      stepIndex++;
    }
  }
}
