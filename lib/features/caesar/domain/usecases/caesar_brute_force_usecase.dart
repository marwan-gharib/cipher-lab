import '../../../../core/shared/domain/enums/app_language.dart';
import '../entities/caesar_result.dart';
import 'caesar_decrypt_usecase.dart';

class CaesarBruteForceUseCase {
  CaesarBruteForceUseCase(this._decryptUseCase);

  final CaesarDecryptUseCase _decryptUseCase;

  List<CaesarResult> call({
    required String ciphertext,
    required AppLanguage language,
  }) {
    final results = <CaesarResult>[];
    for (int shift = 1; shift < language.alphabetLength; shift++) {
      results.add(
        _decryptUseCase.call(
          ciphertext: ciphertext,
          shift: shift,
          language: language,
        ),
      );
    }
    return results;
  }
}
