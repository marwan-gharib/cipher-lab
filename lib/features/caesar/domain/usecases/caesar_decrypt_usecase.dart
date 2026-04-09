import '../../../../core/shared/domain/enums/app_language.dart';
import '../entities/caesar_result.dart';

class CaesarDecryptUseCase {
  CaesarResult call({
    required String ciphertext,
    required int shift,
    required AppLanguage language,
  }) {
    final alphabet = language.alphabet;
    final len = alphabet.length;
    final result = _applyReverseShift(ciphertext, shift, len, alphabet);
    return CaesarResult(
      input: ciphertext,
      output: result,
      shift: shift,
      isEncrypt: false,
    );
  }

  String _applyReverseShift(
    String text,
    int shift,
    int len,
    List<String> alphabet,
  ) {
    final buffer =
        StringBuffer(); // create buffer for efficient string concatenation and performance
    for (final char in text.split('')) {
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
      final shifted = (index - shift + len) % len;
      final result = alphabet[shifted];
      buffer.write(char != lower ? result.toUpperCase() : result);
    }
    return buffer.toString();
  }
}
