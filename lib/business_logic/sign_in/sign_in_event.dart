part of 'sign_in_bloc.dart';

class SignInEvent extends Equatable {
  const SignInEvent();

  @override
  List<Object?> get props => [];
}


class SignInEmailEvent extends SignInEvent{
  final String email;
  const SignInEmailEvent(this.email);
}


class SignInPasswordEvent extends SignInEvent{
  final String password;
  const SignInPasswordEvent(this.password);
}