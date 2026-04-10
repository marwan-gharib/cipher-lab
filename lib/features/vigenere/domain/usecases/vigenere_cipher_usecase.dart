import '../../../../core/shared/domain/enums/app_language.dart';
import '../entities/vigenere_result.dart';
import '../entities/vigenere_step.dart';

class VigenereCipherUseCase {
  VigenereCipherUseCase();

  VigenereResult call({
    required String text,
    required String key,
    required AppLanguage language,
    required bool isEncrypt,
  }) {
    final table = language.tabulaRecta;
    final alphabet = language.alphabet;
    final keyLower = key.toLowerCase();
    final keyLowerLength = keyLower.length;
    final steps = <VigenereStep>[];
    final buffer = StringBuffer();
    int keyIndex = 0;

    for (final char in text.split('')) {
      if (char == ' ') {
        buffer.write(' ');
        continue;
      }

      final keyChar = keyLower[keyIndex % keyLowerLength];
      final rowIndex = alphabet.indexOf(keyChar);
      if (rowIndex == -1) {
        buffer.write(char);
        keyIndex++;
        continue;
      }

      final lower = char.toLowerCase();

      final int? colIndex = isEncrypt
          ? _encryptColIndex(alphabet, lower)
          : _decryptColIndex(table, rowIndex, lower);

      if (colIndex == null) {
        buffer.write(char);
        keyIndex++;
        continue;
      }

      final resultChar = isEncrypt ? table[rowIndex][colIndex] : alphabet[colIndex];
      final output = char != lower ? resultChar.toUpperCase() : resultChar;
      buffer.write(output);

      steps.add(
        VigenereStep(
          inputChar: char,
          keyChar: keyChar,
          outputChar: output,
          rowIndex: rowIndex,
          colIndex: colIndex,
        ),
      );
      keyIndex++;
    }

    return VigenereResult(
      input: text,
      output: buffer.toString(),
      key: key,
      steps: steps,
      isEncrypt: isEncrypt,
    );
  }

  // Encrypt: find char position in alphabet → that is the column index.
  int? _encryptColIndex(List<String> alphabet, String lower) {
    final index = alphabet.indexOf(lower);
    return index == -1 ? null : index;
  }

  // Decrypt: search the row for the cipher char → column index = original char.
  int? _decryptColIndex(List<List<String>> table, int rowIndex, String lower) {
    final col = table[rowIndex].indexOf(lower);
    return col == -1 ? null : col;
  }
}
