import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

import '../../features/caesar/presentation/cubits/caesar/caesar_cubit.dart';
import '../../features/caesar/presentation/screens/caesar_screen.dart';
import '../../features/home/presentation/screens/home_screen.dart';
import '../../features/splash/presentation/cubits/splash/splash_cubit.dart';
import '../../features/splash/presentation/screens/splash_screen.dart';
import '../../features/vigenere/presentation/cubits/vigenere/vigenere_cubit.dart';
import '../../features/vigenere/presentation/screens/vigenere_screen.dart';
import '../di/service_locator.dart';
import '../shared/domain/enums/app_language.dart';
import 'routes.dart';

final GoRouter appRouter = GoRouter(
  initialLocation: Routes.splash,
  routes: [
    GoRoute(
      path: Routes.splash,
      builder: (context, state) => BlocProvider(
        create: (_) => sl<SplashCubit>(),
        child: const SplashScreen(),
      ),
    ),
    GoRoute(
      path: Routes.home,
      builder: (context, state) => const HomeScreen(),
    ),
    GoRoute(
      path: Routes.caesar,
      builder: (context, state) {
        final language = state.extra as AppLanguage;

        return BlocProvider(
          create: (_) => sl<CaesarCubit>(),
          child: CaesarScreen(language: language),
        );
      },
    ),
    GoRoute(
      path: Routes.vigenere,
      builder: (context, state) {
        final language = state.extra as AppLanguage;

        return BlocProvider(
          create: (_) => sl<VigenereCubit>(),
          child: VigenereScreen(language: language),
        );
      },
    ),
  ],
);
