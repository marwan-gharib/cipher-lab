import 'package:encryption_caeser_vigenere/core/constants/app_constants.dart';
import 'package:encryption_caeser_vigenere/i18n/strings.g.dart';

enum AppLanguage {
  english,
  arabic;

  static AppLanguage fromDeviceLocale() {
    final deviceLocale = AppLocaleUtils.findDeviceLocale();
    return switch (deviceLocale) {
      AppLocale.en => AppLanguage.english,
      AppLocale.ar => AppLanguage.arabic,
    };
  }

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
