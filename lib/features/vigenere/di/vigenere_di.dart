import 'package:get_it/get_it.dart';

import '../domain/usecases/vigenere_cipher_usecase.dart';
import '../presentation/cubits/vigenere/vigenere_cubit.dart';

void setupVigenereDi(GetIt sl) {
  sl.registerLazySingleton<VigenereCipherUseCase>(
    VigenereCipherUseCase.new,
  );
  sl.registerFactory<VigenereCubit>(
    () => VigenereCubit(sl()),
  );
}
