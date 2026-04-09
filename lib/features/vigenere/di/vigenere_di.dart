import 'package:get_it/get_it.dart';

import '../domain/usecases/build_tabula_recta_usecase.dart';
import '../domain/usecases/vigenere_decrypt_usecase.dart';
import '../domain/usecases/vigenere_encrypt_usecase.dart';
import '../presentation/cubits/vigenere/vigenere_cubit.dart';

void setupVigenereDi(GetIt sl) {
  sl.registerLazySingleton<BuildTabulaRectaUseCase>(BuildTabulaRectaUseCase.new);
  sl.registerLazySingleton<VigenereEncryptUseCase>(
    () => VigenereEncryptUseCase(sl()),
  );
  sl.registerLazySingleton<VigenereDecryptUseCase>(
    () => VigenereDecryptUseCase(sl()),
  );
  sl.registerFactory<VigenereCubit>(
    () => VigenereCubit(sl(), sl(), sl()),
  );
}
