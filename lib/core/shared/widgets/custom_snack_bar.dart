import 'package:flutter/material.dart';

import '../../theme/app_radius.dart';
import '../../theme/app_spacing.dart';

class CustomSnackBar {
  const CustomSnackBar._();

  static void show(
    BuildContext context, {
    required String message,
    bool isError = false,
  }) {
    final messenger = ScaffoldMessenger.of(context);

    messenger
      ..hideCurrentSnackBar()
      ..showSnackBar(
        SnackBar(
          content: Text(
            message,
            textAlign: TextAlign.center,
            style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                  color: Theme.of(context).colorScheme.onSurface,
                ),
          ),
          dismissDirection: DismissDirection.horizontal,
          backgroundColor: isError
              ? Theme.of(context).colorScheme.error
              : Theme.of(
                  context,
                ).colorScheme.surfaceContainerHighest,
          padding: const EdgeInsets.all(AppSpacing.md),
          behavior: SnackBarBehavior.floating,
          margin: const EdgeInsets.only(
            bottom: AppSpacing.xxl,
            left: AppSpacing.xl,
            right: AppSpacing.xl,
          ),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(AppRadius.md),
          ),
          duration: const Duration(seconds: 3),
        ),
        snackBarAnimationStyle: const AnimationStyle(
          duration: Duration(seconds: 1),
          reverseDuration: Duration(seconds: 1),
        ),
      );
  }
}
