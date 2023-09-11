import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

import '../../repositories/authentication_repo.dart';

part 'sign_in_event.dart';

part 'sign_in_state.dart';

class SignInBloc extends Bloc<SignInEvent, SignInState> {
  SignInBloc() : super(SignInState.initial()) {

    on<SignInEvent>((event, emit) {
      // TODO: implement event handler
    });

    on<SignInEmailEvent>(_emailEmitter);

    on<SignInPasswordEvent>(_passwordEmitter);
  }

  void _emailEmitter(SignInEmailEvent event, Emitter<SignInState> emit) {
    emit(state.copyWith(email: event.email));
  }

  void _passwordEmitter(SignInPasswordEvent event, Emitter<SignInState> emit) {
    emit(state.copyWith(password: event.password));
  }


}
