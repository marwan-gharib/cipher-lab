import 'dart:async';

import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../core/constants/app_constants.dart';
import '../../../../../core/shared/domain/enums/app_language.dart';
import '../../../domain/usecases/caesar_brute_force_usecase.dart';
import '../../../domain/usecases/caesar_decrypt_usecase.dart';
import '../../../domain/usecases/caesar_encrypt_usecase.dart';
import 'caesar_state.dart';

class CaesarCubit extends Cubit<CaesarState> {
  CaesarCubit(
    this._encryptUseCase,
    this._decryptUseCase,
    this._bruteForceUseCase,
  ) : super(const CaesarState());

  final CaesarEncryptUseCase _encryptUseCase;
  final CaesarDecryptUseCase _decryptUseCase;
  final CaesarBruteForceUseCase _bruteForceUseCase;

  void updateInput(String value) => emit(
        state.copyWith(
          input: value,
          clearResult: true,
          clearError: true,
          clearBruteForce: true,
        ),
      );

  void updateShift(int value) => emit(state.copyWith(shift: value));

  void clearAll() => emit(const CaesarState());

  void onLanguageChanged() => emit(const CaesarState());

  Future<void> encrypt(AppLanguage language) async {
    if (state.input.trim().isEmpty) {
      emit(state.copyWith(errorMessage: 'emptyInput'));
      return;
    }
    emit(
      state.copyWith(
        clearError: true,
        isAnimating: true,
        animatedOutput: '',
        clearBruteForce: true,
      ),
    );

    final result = _encryptUseCase.call(
      plaintext: state.input,
      shift: state.shift,
      language: language,
    );

    await _animateOutput(result.output);

    emit(state.copyWith(result: result, isAnimating: false));
  }

  Future<void> decrypt(AppLanguage language) async {
    if (state.input.trim().isEmpty) {
      emit(state.copyWith(errorMessage: 'emptyInput'));
      return;
    }
    emit(
      state.copyWith(
        clearError: true,
        isAnimating: true,
        animatedOutput: '',
        clearBruteForce: true,
      ),
    );

    final result = _decryptUseCase.call(
      ciphertext: state.input,
      shift: state.shift,
      language: language,
    );

    await _animateOutput(result.output);

    emit(state.copyWith(result: result, isAnimating: false));
  }

  Future<void> bruteForce(AppLanguage language) async {
    if (state.input.trim().isEmpty) {
      emit(state.copyWith(errorMessage: 'emptyInput'));
      return;
    }
    emit(state.copyWith(clearError: true, clearResult: true));

    final results =
        _bruteForceUseCase.call(ciphertext: state.input, language: language);
    emit(state.copyWith(bruteForceResults: results));
  }

  Future<void> _animateOutput(String output) async {
    String animated = '';
    for (final char in output.split('')) {
      animated += char;
      emit(state.copyWith(animatedOutput: animated));
      await Future<void>.delayed(AppConstants.letterAnimationDelay);
    }
  }
}
