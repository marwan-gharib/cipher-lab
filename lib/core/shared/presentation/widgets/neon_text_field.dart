import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import '../../../theme/app_radius.dart';
import '../../domain/enums/app_language.dart';
import '../../utils/arabic_input_formatter.dart';
import '../../utils/english_input_formatter.dart';
import '../../utils/extensions/context_extensions.dart';

class NeonTextField extends StatefulWidget {
  const NeonTextField({
    super.key,
    required this.controller,
    required this.hint,
    required this.language,
    this.label,
    this.maxLines = 1,
    this.onChanged,
    this.glowColor,
    this.textDirection,
  });

  final TextEditingController controller;
  final String hint;
  final String? label;
  final AppLanguage language;
  final int maxLines;
  final ValueChanged<String>? onChanged;
  final Color? glowColor;
  final TextDirection? textDirection;

  @override
  State<NeonTextField> createState() => _NeonTextFieldState();
}

class _NeonTextFieldState extends State<NeonTextField> {
  final FocusNode _focusNode = FocusNode();
  bool _isFocused = false;

  @override
  void initState() {
    super.initState();
    _focusNode.addListener(_onFocusChange);
  }

  void _onFocusChange() {
    setState(() => _isFocused = _focusNode.hasFocus);
  }

  @override
  void dispose() {
    _focusNode.removeListener(_onFocusChange);
    _focusNode.dispose();
    super.dispose();
  }

  List<TextInputFormatter> get _formatters => switch (widget.language) {
        AppLanguage.english => [const EnglishInputFormatter()],
        AppLanguage.arabic => [const ArabicInputFormatter()],
      };

  TextDirection get _resolvedDirection =>
      widget.textDirection ??
      (widget.language.isRtl ? TextDirection.rtl : TextDirection.ltr);

  @override
  Widget build(BuildContext context) {
    final resolvedGlow = widget.glowColor ?? context.cyberColors.neonCyan;
    return AnimatedContainer(
      duration: const Duration(milliseconds: 200),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(AppRadius.md),
        boxShadow: _isFocused
            ? [
                BoxShadow(
                  color: resolvedGlow.withValues(alpha: 0.3),
                  blurRadius: 12,
                  spreadRadius: 1,
                ),
              ]
            : [],
      ),
      child: TextField(
        controller: widget.controller,
        focusNode: _focusNode,
        maxLines: widget.maxLines,
        inputFormatters: _formatters,
        textDirection: _resolvedDirection,
        textAlign: widget.language.isRtl ? TextAlign.right : TextAlign.left,
        style: widget.language == AppLanguage.arabic
            ? context.cyberText.arabicBody
                .copyWith(color: context.colorScheme.onSurface)
            : context.textTheme.bodyLarge,
        onChanged: widget.onChanged,
        decoration: InputDecoration(
          hintText: widget.hint,
          labelText: widget.label,
          hintTextDirection: _resolvedDirection,
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(AppRadius.md),
            borderSide: BorderSide(color: context.cyberColors.glassBorder),
          ),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(AppRadius.md),
            borderSide: BorderSide(color: resolvedGlow, width: 2),
          ),
          filled: true,
          fillColor: context.cyberColors.glassBlack,
        ),
      ),
    );
  }
}
