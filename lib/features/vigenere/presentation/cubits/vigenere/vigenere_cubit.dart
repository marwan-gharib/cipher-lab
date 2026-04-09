import 'dart:async';

import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../core/constants/app_constants.dart';
import '../../../../../core/shared/domain/enums/app_language.dart';
import '../../../domain/entities/vigenere_result.dart';
import '../../../domain/usecases/build_tabula_recta_usecase.dart';
import '../../../domain/usecases/vigenere_decrypt_usecase.dart';
import '../../../domain/usecases/vigenere_encrypt_usecase.dart';
import 'vigenere_state.dart';

class VigenereCubit extends Cubit<VigenereState> {
  VigenereCubit(
    this._encryptUseCase,
    this._decryptUseCase,
    this._buildTableUseCase,
  ) : super(const VigenereState());

  final VigenereEncryptUseCase _encryptUseCase;
  final VigenereDecryptUseCase _decryptUseCase;
  final BuildTabulaRectaUseCase _buildTableUseCase;

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

  void clearAll() => emit(const VigenereState());

  void onLanguageChanged() => emit(const VigenereState());

  void toggleTable(AppLanguage language) {
    if (!state.showTable) {
      final table = _buildTableUseCase(language: language);
      emit(state.copyWith(showTable: true, tabulaRecta: table));
    } else {
      emit(state.copyWith(showTable: false));
    }
  }

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

    final table = _buildTableUseCase(language: language);
    final result = _encryptUseCase(
      plaintext: state.input,
      key: state.key,
      language: language,
    );
    emit(state.copyWith(tabulaRecta: table));

    await _animateOutput(result);
    emit(state.copyWith(result: result, isAnimating: false));
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

    final table = _buildTableUseCase(language: language);
    final result = _decryptUseCase(
      ciphertext: state.input,
      key: state.key,
      language: language,
    );
    emit(state.copyWith(tabulaRecta: table));

    await _animateOutput(result);
    emit(state.copyWith(result: result, isAnimating: false));
  }

  Future<void> _animateOutput(VigenereResult vigenereResult) async {
    var animated = '';
    for (var i = 0; i < vigenereResult.steps.length; i++) {
      final step = vigenereResult.steps[i];
      animated += step.outputChar;
      emit(
        state.copyWith(
          animatedOutput: animated,
          highlightedRow: step.rowIndex,
          highlightedCol: step.colIndex,
          currentStepIndex: i,
        ),
      );
      await Future<void>.delayed(AppConstants.letterAnimationDelay);
    }
  }
}
