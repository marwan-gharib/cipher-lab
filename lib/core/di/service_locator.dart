import 'package:get_it/get_it.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../features/caesar/di/caesar_di.dart';
import '../../features/vigenere/di/vigenere_di.dart';
import '../../features/splash/di/splash_di.dart';

import '../shared/cubits/locale/locale_cubit.dart';
import '../theme/cubit/theme_cubit.dart';
import '../local/cache/cache_service.dart';
import '../local/cache/shared_preferences_service.dart';

final sl = GetIt.instance;

Future<void> setupServiceLocator() async {
  // External
  final sharedPreferences = await SharedPreferences.getInstance();
  sl.registerLazySingleton<SharedPreferences>(() => sharedPreferences);

  // Services
  sl.registerLazySingleton<CacheService>(
    () => SharedPreferencesService(sl()),
  );

  // Core cubits — singletons so app-wide state is shared
  sl.registerLazySingleton<ThemeCubit>(() => ThemeCubit(sl()));
  sl.registerLazySingleton<LocaleCubit>(() => LocaleCubit(sl()));

  // Feature DI
  setupCaesarDi(sl);
  setupVigenereDi(sl);
  setupSplashDi(sl);
}
