class AppConstants {
  AppConstants._();

  static const List<String> englishAlphabet = [
    'a',
    'b',
    'c',
    'd',
    'e',
    'f',
    'g',
    'h',
    'i',
    'j',
    'k',
    'l',
    'm',
    'n',
    'o',
    'p',
    'q',
    'r',
    's',
    't',
    'u',
    'v',
    'w',
    'x',
    'y',
    'z',
  ];

  static const List<String> arabicAlphabet = [
    'ا',
    'ب',
    'ت',
    'ث',
    'ج',
    'ح',
    'خ',
    'د',
    'ذ',
    'ر',
    'ز',
    'س',
    'ش',
    'ص',
    'ض',
    'ط',
    'ظ',
    'ع',
    'غ',
    'ف',
    'ق',
    'ك',
    'ل',
    'م',
    'ن',
    'ه',
    'و',
    'ي',
  ];

  static final List<List<String>> englishTabulaRecta =
      _buildTable(englishAlphabet);
  static final List<List<String>> arabicTabulaRecta =
      _buildTable(arabicAlphabet);

  static List<List<String>> _buildTable(List<String> alphabet) {
    final len = alphabet.length;
    return List.generate(
      len,
      (row) => List.generate(
        len,
        (col) => alphabet[(row + col) % len],
        growable: false,
      ),
      growable: false,
    );
  }

  // Animation durations
  static const Duration animationFast = Duration(milliseconds: 200);
  static const Duration animationNormal = Duration(milliseconds: 400);
  static const Duration animationSlow = Duration(milliseconds: 700);
  static const Duration caeserLetterAnimationDelay = Duration(milliseconds: 3);
  static const Duration vigenereLetterAnimationDelay =
      Duration(milliseconds: 500);
  static const Duration typingDelay = Duration(milliseconds: 100);
  static const Duration bruteForceStaggerDelay = Duration(milliseconds: 100);
  static const Duration bruteForceItemDuration = Duration(milliseconds: 400);

  // UI constants
  static const double appBarElevation = 0;
  static const int maxBruteForceDisplay = 28;

  // Cache keys
  static const String themeKey = 'theme_mode';
  static const String languageKey = 'language_code';
}
