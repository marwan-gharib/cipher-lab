import 'package:get_it/get_it.dart';

import '../../features/caesar/di/caesar_di.dart';
import '../../features/vigenere/di/vigenere_di.dart';
import '../shared/cubits/locale/locale_cubit.dart';
import '../theme/cubit/theme_cubit.dart';

final sl = GetIt.instance;

void setupServiceLocator() {
  // Core cubits — singletons so app-wide state is shared
  sl.registerLazySingleton<ThemeCubit>(ThemeCubit.new);
  sl.registerLazySingleton<LocaleCubit>(LocaleCubit.new);

  // Feature DI
  setupCaesarDi(sl);
  setupVigenereDi(sl);
}
