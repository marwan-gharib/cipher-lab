import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../core/shared/utils/extensions/context_extensions.dart';
import '../../../../core/theme/cubit/theme_cubit.dart';
import '../../../../core/theme/cubit/theme_state.dart';

class ThemeToggleButton extends StatelessWidget {
  const ThemeToggleButton({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ThemeCubit, ThemeState>(
      buildWhen: (prev, next) => prev != next,
      builder: (context, state) => IconButton(
        icon: Icon(
          state.isDark ? Icons.light_mode_rounded : Icons.dark_mode_rounded,
          color: context.cyberColors.neonCyan,
        ),
        tooltip: state.isDark
            ? context.t.common.lightMode
            : context.t.common.darkMode,
        onPressed: () => context.read<ThemeCubit>().toggleTheme(),
      ),
    );
  }
}
