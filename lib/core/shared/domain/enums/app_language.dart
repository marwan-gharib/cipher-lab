import 'package:encryption_caeser_vigenere/core/constants/app_constants.dart';

enum AppLanguage {
  english,
  arabic;

  List<String> get alphabet => switch (this) {
        AppLanguage.english => AppConstants.englishAlphabet,
        AppLanguage.arabic => AppConstants.arabicAlphabet,
      };

  List<List<String>> get tabulaRecta => switch (this) {
        AppLanguage.english => AppConstants.englishTabulaRecta,
        AppLanguage.arabic => AppConstants.arabicTabulaRecta,
      };

  int get alphabetLength => alphabet.length;

  String get localeCode => switch (this) {
        AppLanguage.english => 'en',
        AppLanguage.arabic => 'ar',
      };

  bool get isRtl => this == AppLanguage.arabic;

  String get displayCode => switch (this) {
        AppLanguage.english => 'EN',
        AppLanguage.arabic => 'AR',
      };
}
