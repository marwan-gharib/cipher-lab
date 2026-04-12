import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../core/shared/utils/extensions/context_extensions.dart';
import '../../../../core/theme/app_spacing.dart';
import '../cubits/caesar/caesar_cubit.dart';
import '../cubits/caesar/caesar_state.dart';
import 'shift_selector_item.dart';

class CaesarShiftSlider extends StatefulWidget {
  const CaesarShiftSlider({super.key, required this.alphabetLength});

  final int alphabetLength;

  @override
  State<CaesarShiftSlider> createState() => _CaesarShiftSliderState();
}

class _CaesarShiftSliderState extends State<CaesarShiftSlider> {
  late final ScrollController _scrollController;
  static const double _itemWidth = 76.0; // 60 (size) + 8*2 (padding)

  @override
  void initState() {
    super.initState();
    _scrollController = ScrollController();

    // Initial scroll after first frame
    WidgetsBinding.instance.addPostFrameCallback((_) {
      final currentShift = context.read<CaesarCubit>().state.shift;
      _scrollToIndex(currentShift - 1, animate: false);
    });
  }

  @override
  void dispose() {
    _scrollController.dispose();
    super.dispose();
  }

  void _scrollToIndex(int index, {bool animate = true}) {
    if (!_scrollController.hasClients) return;

    final targetOffset = index * _itemWidth;
    final clampedOffset = targetOffset.clamp(
      0.0,
      _scrollController.position.maxScrollExtent,
    );

    if (animate) {
      _scrollController.animateTo(
        clampedOffset,
        duration: const Duration(milliseconds: 500),
        curve: Curves.easeInOutCubic,
      );
    } else {
      _scrollController.jumpTo(clampedOffset);
    }
  }

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<CaesarCubit, CaesarState>(
      listenWhen: (prev, next) => prev.shift != next.shift,
      listener: (context, state) => _scrollToIndex(state.shift - 1),
      buildWhen: (prev, next) => prev.shift != next.shift,
      builder: (context, state) {
        return Column(
          crossAxisAlignment: CrossAxisAlignment.start,
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
            LayoutBuilder(
              builder: (context, constraints) {
                final horizontalPadding =
                    (constraints.maxWidth - _itemWidth) / 2;

                return SizedBox(
                  height: 100,
                  child: ListView.builder(
                    controller: _scrollController,
                    scrollDirection: Axis.horizontal,
                    physics: const BouncingScrollPhysics(),
                    itemCount: widget.alphabetLength - 1,
                    padding: EdgeInsets.symmetric(
                      horizontal: horizontalPadding,
                    ),
                    itemBuilder: (context, index) {
                      final shiftValue = index + 1;
                      final isSelected = state.shift == shiftValue;

                      return SizedBox(
                        width: _itemWidth,
                        child: Center(
                          child: ShiftSelectorItem(
                            value: shiftValue,
                            isSelected: isSelected,
                            onTap: () => context
                                .read<CaesarCubit>()
                                .updateShift(shiftValue),
                          ),
                        ),
                      );
                    },
                  ),
                );
              },
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
