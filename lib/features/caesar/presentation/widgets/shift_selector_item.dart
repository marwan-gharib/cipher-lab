import 'package:flutter/material.dart';

import '../../../../core/shared/utils/extensions/context_extensions.dart';
import '../../../../core/shared/widgets/glassmorphic_container.dart';

class ShiftSelectorItem extends StatelessWidget {
  const ShiftSelectorItem({
    super.key,
    required this.value,
    required this.isSelected,
    required this.onTap,
  });

  final int value;
  final bool isSelected;
  final VoidCallback onTap;

  static const double _size = 60;

  @override
  Widget build(BuildContext context) {
    final activeColor = context.cyberColors.neonCyan;

    return GestureDetector(
      onTap: onTap,
      child: AnimatedScale(
        scale: isSelected ? 1.15 : 1.0,
        duration: const Duration(milliseconds: 300),
        curve: Curves.easeOutBack,
        child: SizedBox(
          width: _size,
          height: _size,
          child: Stack(
            alignment: Alignment.center,
            children: [
              if (isSelected)
                AnimatedContainer(
                  duration: const Duration(milliseconds: 300),
                  width: _size,
                  height: _size,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    border: Border.all(
                      color: activeColor.withValues(alpha: 0.5),
                      width: 2,
                    ),
                    boxShadow: [
                      BoxShadow(
                        color: activeColor.withValues(alpha: 0.3),
                        blurRadius: 10,
                        spreadRadius: 7,
                      ),
                    ],
                  ),
                ),
              GlassmorphicContainer(
                isCircle: true,
                width: isSelected ? _size - 4 : _size,
                height: isSelected ? _size - 4 : _size,
                borderColor: Colors.transparent,
                child: Center(
                  child: AnimatedDefaultTextStyle(
                    duration: const Duration(milliseconds: 300),
                    style: context.cyberText.cipherLarge.copyWith(
                      color: isSelected
                          ? activeColor
                          : context.colorScheme.onSurface
                              .withValues(alpha: 0.6),
                      fontWeight:
                          isSelected ? FontWeight.w900 : FontWeight.w500,
                      fontSize: isSelected ? 22 : 18,
                    ),
                    child: Text(value.toString()),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
