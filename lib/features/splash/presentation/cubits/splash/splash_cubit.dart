import 'dart:async';

import 'package:flutter_bloc/flutter_bloc.dart';

import 'splash_state.dart';

class SplashCubit extends Cubit<SplashState> {
  SplashCubit() : super(const SplashInitial());

  void startSplash() {
    Timer(const Duration(seconds: 4), () {
      emit(const SplashCompleted());
    });
  }
}
