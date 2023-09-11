import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'signup_event.dart';

part 'signup_state.dart';

class SignUpBloc extends Bloc<SignUpEvent, SignUpState> {
  SignUpBloc() : super(SignUpState.initial()) {
    on<SignUpEvent>((event, emit) {
      // TODO: implement event handler
    });

    on<SignUpEmailEvent>(_emailEmitter);

    on<SignUpUsernameEvent>(_usernameEmitter);

    on<SignUpPasswordEvent>(_passwordEmitter);
  }

  void _emailEmitter(SignUpEmailEvent event, Emitter<SignUpState> emit) {
    emit(state.copyWith(email: event.email));
  }


  void _usernameEmitter(SignUpUsernameEvent event, Emitter<SignUpState> emit) {
    emit(state.copyWith(username: event.username));
  }

  void _passwordEmitter(SignUpPasswordEvent event, Emitter<SignUpState> emit) {
    emit(state.copyWith(password: event.password));
  }
}
