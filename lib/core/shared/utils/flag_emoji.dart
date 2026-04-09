class FlagEmoji {
  const FlagEmoji._();

  static String getFlagEmoji(String countryCode) {
    final int base = 0x1F1E6 - 'A'.codeUnitAt(0);
    final int first = countryCode.codeUnitAt(0) + base;
    final int second = countryCode.codeUnitAt(1) + base;
    return String.fromCharCode(first) + String.fromCharCode(second);
  }
}
