import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../core/shared/domain/enums/app_language.dart';
import '../../../../core/shared/utils/extensions/context_extensions.dart';
import '../../../../core/shared/widgets/neon_text_field.dart';
import '../../../../core/theme/app_spacing.dart';
import '../cubits/vigenere/vigenere_cubit.dart';
import '../cubits/vigenere/vigenere_state.dart';

class VigenereKeyInput extends StatefulWidget {
  const VigenereKeyInput({super.key, required this.language});

  final AppLanguage language;

  @override
  State<VigenereKeyInput> createState() => _VigenereKeyInputState();
}

class _VigenereKeyInputState extends State<VigenereKeyInput> {
  final TextEditingController _controller = TextEditingController();

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocListener<VigenereCubit, VigenereState>(
      listenWhen: (prev, next) => prev.key != next.key && next.key.isEmpty,
      listener: (context, state) {
        if (state.key.isEmpty && _controller.text.isNotEmpty) {
          _controller.clear();
        }
      },
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            context.t.vigenere.keyLabel,
            style: context.textTheme.labelLarge,
          ),
          const SizedBox(height: AppSpacing.sm),
          NeonTextField(
            controller: _controller,
            hint: context.t.vigenere.keyHint,
            language: widget.language,
            glowColor: context.cyberColors.neonPurple,
            onChanged: (val) => context.read<VigenereCubit>().updateKey(val),
          ),
        ],
      ),
    );
  }
}
