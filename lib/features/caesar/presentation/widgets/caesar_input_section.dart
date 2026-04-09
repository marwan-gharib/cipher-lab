import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../core/shared/domain/enums/app_language.dart';
import '../../../../core/shared/presentation/widgets/neon_button.dart';
import '../../../../core/shared/presentation/widgets/neon_text_field.dart';
import '../../../../core/shared/utils/extensions/context_extensions.dart';
import '../../../../core/theme/app_spacing.dart';
import '../cubits/caesar/caesar_cubit.dart';
import '../cubits/caesar/caesar_state.dart';

class CaesarInputSection extends StatefulWidget {
  const CaesarInputSection({super.key, required this.language});

  final AppLanguage language;

  @override
  State<CaesarInputSection> createState() => _CaesarInputSectionState();
}

class _CaesarInputSectionState extends State<CaesarInputSection> {
  final TextEditingController _controller = TextEditingController();

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocListener<CaesarCubit, CaesarState>(
      listenWhen: (prev, next) => prev != next && next.input.isEmpty,
      listener: (context, state) {
        if (state.input.isEmpty && _controller.text.isNotEmpty) {
          _controller.clear();
        }
      },
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            context.t.caesar.inputLabel,
            style: context.textTheme.labelLarge,
          ),
          const SizedBox(height: AppSpacing.sm),
          NeonTextField(
            controller: _controller,
            hint: context.t.caesar.inputHint,
            language: widget.language,
            maxLines: 4,
            onChanged: (val) => context.read<CaesarCubit>().updateInput(val),
          ),
          const SizedBox(height: AppSpacing.md),
          _buildActionRow(context),
        ],
      ),
    );
  }

  Widget _buildActionRow(BuildContext context) {
    final t = context.t;
    return Column(
      spacing: AppSpacing.sm,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          spacing: AppSpacing.sm,
          children: [
            Expanded(
              child: NeonButton(
                width: double.infinity,
                label: t.caesar.encrypt,
                icon: Icons.lock_rounded,
                onPressed: () =>
                    context.read<CaesarCubit>().encrypt(widget.language),
                color: context.cyberColors.neonCyan,
              ),
            ),
            Expanded(
              child: NeonButton(
                width: double.infinity,
                label: t.caesar.decrypt,
                icon: Icons.lock_open_rounded,
                onPressed: () =>
                    context.read<CaesarCubit>().decrypt(widget.language),
                color: context.cyberColors.neonPurple,
              ),
            ),
          ],
        ),
        NeonButton(
          width: double.infinity,
          label: t.caesar.bruteForce,
          icon: Icons.search_rounded,
          onPressed: () =>
              context.read<CaesarCubit>().bruteForce(widget.language),
          color: context.cyberColors.neonGreen,
        ),
      ],
    );
  }
}
