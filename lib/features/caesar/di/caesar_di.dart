import 'package:get_it/get_it.dart';

import '../domain/usecases/caesar_brute_force_usecase.dart';
import '../domain/usecases/caesar_decrypt_usecase.dart';
import '../domain/usecases/caesar_encrypt_usecase.dart';
import '../presentation/cubits/caesar/caesar_cubit.dart';

void setupCaesarDi(GetIt sl) {
  sl.registerLazySingleton<CaesarEncryptUseCase>(CaesarEncryptUseCase.new);
  sl.registerLazySingleton<CaesarDecryptUseCase>(CaesarDecryptUseCase.new);
  sl.registerLazySingleton<CaesarBruteForceUseCase>(
    () => CaesarBruteForceUseCase(sl()),
  );
  sl.registerFactory<CaesarCubit>(
    () => CaesarCubit(sl(), sl(), sl()),
  );
}
