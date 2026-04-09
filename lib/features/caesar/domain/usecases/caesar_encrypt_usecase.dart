import 'dart:developer';

import '../../../../core/shared/domain/enums/app_language.dart';
import '../entities/caesar_result.dart';

class CaesarEncryptUseCase {
  CaesarResult call({
    required String plaintext,
    required int shift,
    required AppLanguage language,
  }) {
    final alphabet = language.alphabet;
    final len = alphabet.length;
    final result = _applyShift(plaintext, shift, len, alphabet);
    return CaesarResult(
      input: plaintext,
      output: result,
      shift: shift,
      isEncrypt: true,
    );
  }

  String _applyShift(
    String text,
    int shift,
    int len,
    List<String> alphabet,
  ) {
    final buffer = StringBuffer();
    for (final char in text.split('')) {
      log(char);
      if (char == ' ') {
        buffer.write(' ');
        continue;
      }
      final lower = char.toLowerCase();
      final index = alphabet.indexOf(lower);
      if (index == -1) {
        buffer.write(char);
        continue;
      }
      final shifted = (index + shift) % len;
      final result = alphabet[shifted];
      // Preserve original case for English
      buffer.write(char != lower ? result.toUpperCase() : result);
    }
    return buffer.toString();
  }
}
