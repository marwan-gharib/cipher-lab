import '../../../../core/shared/domain/enums/app_language.dart';

class BuildTabulaRectaUseCase {
  List<List<String>> call({required AppLanguage language}) {
    final alphabet = language.alphabet;
    final len = alphabet.length;
    return List.generate(
      len,
      (row) => List.generate(len, (col) => alphabet[(row + col) % len]),
    );
  }
}
