import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../core/shared/utils/extensions/context_extensions.dart';
import '../../../../core/theme/app_spacing.dart';
import '../cubits/caesar/caesar_cubit.dart';
import '../cubits/caesar/caesar_state.dart';

class CaesarShiftSlider extends StatelessWidget {
  const CaesarShiftSlider({super.key, required this.alphabetLength});

  final int alphabetLength;

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<CaesarCubit, CaesarState>(
      buildWhen: (prev, next) => prev.shift != next.shift,
      builder: (context, state) {
        return Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  context.t.caesar.shiftLabel,
                  style: context.textTheme.labelLarge,
                ),
                _buildShiftBadge(context, state.shift),
              ],
            ),
            const SizedBox(height: AppSpacing.xs),
            Slider(
              value: state.shift.toDouble(),
              min: 1,
              max: (alphabetLength - 1).toDouble(),
              divisions: alphabetLength - 2,
              label: state.shift.toString(),
              onChanged: (val) =>
                  context.read<CaesarCubit>().updateShift(val.round()),
            ),
          ],
        );
      },
    );
  }

  Widget _buildShiftBadge(BuildContext context, int shift) {
    return Container(
      padding: const EdgeInsets.symmetric(
        horizontal: AppSpacing.md,
        vertical: AppSpacing.xs,
      ),
      decoration: BoxDecoration(
        color: context.cyberColors.neonCyan.withValues(alpha: 0.15),
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: context.cyberColors.neonCyan, width: 1),
      ),
      child: Text(
        '+$shift',
        style: context.cyberText.cipherSmall.copyWith(
          fontWeight: FontWeight.w900,
          color: context.cyberColors.neonCyan,
        ),
      ),
    );
  }
}
