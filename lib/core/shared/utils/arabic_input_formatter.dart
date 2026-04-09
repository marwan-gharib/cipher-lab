import 'package:flutter/services.dart';

class ArabicInputFormatter extends TextInputFormatter {
  const ArabicInputFormatter();
  static final RegExp _allowed = RegExp(r'[\u0600-\u06FF\s]');

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
