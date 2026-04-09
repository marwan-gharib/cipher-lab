import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../core/shared/domain/enums/app_language.dart';
import '../../../../core/shared/presentation/widgets/neon_button.dart';
import '../../../../core/shared/presentation/widgets/neon_text_field.dart';
import '../../../../core/shared/utils/extensions/context_extensions.dart';
import '../../../../core/theme/app_spacing.dart';
import '../cubits/vigenere/vigenere_cubit.dart';
import '../cubits/vigenere/vigenere_state.dart';

class VigenereInputSection extends StatefulWidget {
  const VigenereInputSection({super.key, required this.language});

  final AppLanguage language;

  @override
  State<VigenereInputSection> createState() => _VigenereInputSectionState();
}

class _VigenereInputSectionState extends State<VigenereInputSection> {
  final TextEditingController _controller = TextEditingController();

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocListener<VigenereCubit, VigenereState>(
      listenWhen: (prev, next) => prev.input != next.input && next.input.isEmpty,
      listener: (context, state) {
        if (state.input.isEmpty && _controller.text.isNotEmpty) {
          _controller.clear();
        }
      },
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(context.t.vigenere.inputLabel, style: context.textTheme.labelLarge),
          const SizedBox(height: AppSpacing.sm),
          NeonTextField(
            controller: _controller,
            hint: context.t.vigenere.inputHint,
            language: widget.language,
            maxLines: 3,
            onChanged: (val) => context.read<VigenereCubit>().updateInput(val),
          ),
          const SizedBox(height: AppSpacing.md),
          _buildActionRow(context),
        ],
      ),
    );
  }

  Widget _buildActionRow(BuildContext context) {
    final t = context.t;
    return Row(
      children: [
        Expanded(
          child: NeonButton(
            label: t.vigenere.encrypt,
            icon: Icons.lock_rounded,
            onPressed: () => context.read<VigenereCubit>().encrypt(widget.language),
            color: context.cyberColors.neonCyan,
          ),
        ),
        const SizedBox(width: AppSpacing.sm),
        Expanded(
          child: NeonButton(
            label: t.vigenere.decrypt,
            icon: Icons.lock_open_rounded,
            onPressed: () => context.read<VigenereCubit>().decrypt(widget.language),
            color: context.cyberColors.neonPurple,
          ),
        ),
      ],
    );
  }
}
