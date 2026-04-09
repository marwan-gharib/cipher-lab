import 'package:flutter/material.dart';
import '../../../../core/shared/utils/extensions/context_extensions.dart';

class CaesarAnimatedLetter extends StatelessWidget {
  const CaesarAnimatedLetter({
    super.key,
    required this.letter,
    required this.color,
  });

  final String letter;
  final Color color;

  @override
  Widget build(BuildContext context) {
    return AnimatedContainer(
      duration: const Duration(milliseconds: 300),
      child: Text(
        letter,
        style: context.cyberText.cipherLarge.copyWith(color: color),
      ),
    );
  }
}
