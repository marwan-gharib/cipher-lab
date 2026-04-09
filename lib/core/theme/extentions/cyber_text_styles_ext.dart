import 'package:flutter/material.dart';

class CyberTextStyles extends ThemeExtension<CyberTextStyles> {
  const CyberTextStyles({
    required this.cipherLarge,
    required this.cipherMedium,
    required this.cipherSmall,
    required this.arabicBody,
    required this.arabicCipher,
  });

  final TextStyle cipherLarge;
  final TextStyle cipherMedium;
  final TextStyle cipherSmall;
  final TextStyle arabicBody;
  final TextStyle arabicCipher;

  @override
  CyberTextStyles copyWith({
    TextStyle? cipherLarge,
    TextStyle? cipherMedium,
    TextStyle? cipherSmall,
    TextStyle? arabicBody,
    TextStyle? arabicCipher,
  }) {
    return CyberTextStyles(
      cipherLarge: cipherLarge ?? this.cipherLarge,
      cipherMedium: cipherMedium ?? this.cipherMedium,
      cipherSmall: cipherSmall ?? this.cipherSmall,
      arabicBody: arabicBody ?? this.arabicBody,
      arabicCipher: arabicCipher ?? this.arabicCipher,
    );
  }

  @override
  CyberTextStyles lerp(ThemeExtension<CyberTextStyles>? other, double t) {
    if (other is! CyberTextStyles) return this;
    return CyberTextStyles(
      cipherLarge: TextStyle.lerp(cipherLarge, other.cipherLarge, t)!,
      cipherMedium: TextStyle.lerp(cipherMedium, other.cipherMedium, t)!,
      cipherSmall: TextStyle.lerp(cipherSmall, other.cipherSmall, t)!,
      arabicBody: TextStyle.lerp(arabicBody, other.arabicBody, t)!,
      arabicCipher: TextStyle.lerp(arabicCipher, other.arabicCipher, t)!,
    );
  }

  static CyberTextStyles of(BuildContext context) =>
      Theme.of(context).extension<CyberTextStyles>()!;
}
