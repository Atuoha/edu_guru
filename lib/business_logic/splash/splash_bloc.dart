import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'splash_event.dart';

part 'splash_state.dart';

class SplashBloc extends Bloc<SplashEvent, SplashState> {
  SplashBloc() : super(SplashState.initial()) {
    on<SplashEvent>((event, emit) {
      emit(
        state.copyWith(page: state.page),
      );
    });

    on<NextSlide>((event, emit) {
      emit(
        state.copyWith(page: state.page + 1),
      );
    });

    on<PreviousSlide>((event, emit) {
      state.copyWith(page: state.page + 1);
    });

    on<LaunchApp>((event, emit) {});
  }
}
