import 'package:flutter/services.dart';

class EnglishInputFormatter extends TextInputFormatter {
  const EnglishInputFormatter();
  static final RegExp _allowed = RegExp(r'[A-Za-z\s]');

  @override
  TextEditingValue formatEditUpdate(
    TextEditingValue oldValue,
    TextEditingValue newValue,
  ) {
    final filtered =
        newValue.text.split('').where((c) => _allowed.hasMatch(c)).join();
    if (filtered == newValue.text) return newValue;
    return newValue.copyWith(
      text: filtered,
      selection: TextSelection.collapsed(offset: filtered.length),
    );
  }
}
