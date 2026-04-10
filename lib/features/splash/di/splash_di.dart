import 'package:get_it/get_it.dart';

import '../presentation/cubits/splash/splash_cubit.dart';

void setupSplashDi(GetIt sl) {
  // Cubits
  sl.registerFactory(() => SplashCubit());
}
