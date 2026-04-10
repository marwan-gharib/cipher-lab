class InputValidators {
  InputValidators._();

  static final RegExp _englishPattern =
      RegExp(r'^([^a-zA-Z\p{L}]|[a-zA-Z\s])*$', unicode: true);
  static final RegExp _arabicPattern =
      RegExp(r'^([^\u0600-\u06FF\p{L}]|[\u0600-\u06FF\s])*$', unicode: true);

  static bool isValidEnglish(String value) => _englishPattern.hasMatch(value);
  static bool isValidArabic(String value) => _arabicPattern.hasMatch(value);
}
