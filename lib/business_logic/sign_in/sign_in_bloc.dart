import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

import '../../repositories/authentication_repo.dart';

part 'sign_in_event.dart';

part 'sign_in_state.dart';

class SignInBloc extends Bloc<SignInEvent, SignInState> {
  final AuthenticationRepo authRepo;
  SignInBloc({required this.authRepo}) : super(SignInState.initial()) {

    on<SignInEvent>((event, emit) {
      // TODO: implement event handler
    });

    on<EmailEvent>(_emailEmitter);

    on<PasswordEvent>(_passwordEmitter);
  }

  void _emailEmitter(EmailEvent event, Emitter<SignInState> emit) {
    emit(state.copyWith(email: event.email));
  }

  void _passwordEmitter(PasswordEvent event, Emitter<SignInState> emit) {
    emit(state.copyWith(password: event.password));
  }


}
