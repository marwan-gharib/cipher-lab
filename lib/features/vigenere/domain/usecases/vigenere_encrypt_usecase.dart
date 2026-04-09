import '../../../../core/shared/domain/enums/app_language.dart';
import '../entities/vigenere_result.dart';
import '../entities/vigenere_step.dart';
import 'build_tabula_recta_usecase.dart';

class VigenereEncryptUseCase {
  VigenereEncryptUseCase(this._buildTable);

  final BuildTabulaRectaUseCase _buildTable;

  VigenereResult call({
    required String plaintext,
    required String key,
    required AppLanguage language,
  }) {
    final table = _buildTable(language: language);
    final alphabet = language.alphabet;
    final keyLower = key.toLowerCase();
    final steps = <VigenereStep>[];
    final buffer = StringBuffer();
    var keyIndex = 0;

    for (final char in plaintext.split('')) {
      if (char == ' ') {
        buffer.write(' ');
        continue;
      }
      final lower = char.toLowerCase();
      final colIndex = alphabet.indexOf(lower);
      if (colIndex == -1) {
        buffer.write(char);
        continue;
      }

      final keyChar = keyLower[keyIndex % keyLower.length];
      final rowIndex = alphabet.indexOf(keyChar);
      if (rowIndex == -1) {
        buffer.write(char);
        keyIndex++;
        continue;
      }

      final resultChar = table[rowIndex][colIndex];
      final output = char == char.toUpperCase() && char != lower
          ? resultChar.toUpperCase()
          : resultChar;
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
      input: plaintext,
      output: buffer.toString(),
      key: key,
      steps: steps,
      isEncrypt: true,
    );
  }
}
