class AppConstants {
  AppConstants._();

  // English alphabet (26 letters)
  static const List<String> englishAlphabet = [
    'a', 'b', 'c', 'd', 'e', 'f', 'g', 'h', 'i', 'j', 'k', 'l', 'm',
    'n', 'o', 'p', 'q', 'r', 's', 't', 'u', 'v', 'w', 'x', 'y', 'z',
  ];

  // Arabic alphabet (28 letters — standard Modern Standard Arabic)
  static const List<String> arabicAlphabet = [
    'ا', 'ب', 'ت', 'ث', 'ج', 'ح', 'خ',
    'د', 'ذ', 'ر', 'ز', 'س', 'ش', 'ص',
    'ض', 'ط', 'ظ', 'ع', 'غ', 'ف', 'ق',
    'ك', 'ل', 'م', 'ن', 'ه', 'و', 'ي',
  ];

  // Animation durations
  static const Duration animationFast = Duration(milliseconds: 200);
  static const Duration animationNormal = Duration(milliseconds: 400);
  static const Duration animationSlow = Duration(milliseconds: 700);
  static const Duration letterAnimationDelay = Duration(milliseconds: 80);
  static const Duration typingDelay = Duration(milliseconds: 100);

  // UI constants
  static const double appBarElevation = 0;
  static const int maxBruteForceDisplay = 28;
}
