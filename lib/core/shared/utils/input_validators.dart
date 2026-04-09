class InputValidators {
  InputValidators._();

  static final RegExp _englishPattern = RegExp(r'^[A-Za-z\s]*$');
  static final RegExp _arabicPattern = RegExp(r'^[\u0600-\u06FF\s]*$');

  static bool isValidEnglish(String value) => _englishPattern.hasMatch(value);
  static bool isValidArabic(String value) => _arabicPattern.hasMatch(value);
}
