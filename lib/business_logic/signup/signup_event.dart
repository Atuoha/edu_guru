part of 'signup_bloc.dart';

class SignUpEvent extends Equatable {
  const SignUpEvent();

  @override
  List<Object?> get props => [];
}


class SignUpEmailEvent extends SignUpEvent{
  final String email;
  const SignUpEmailEvent(this.email);
}

class SignUpUsernameEvent extends SignUpEvent{
  final String username;
  const SignUpUsernameEvent(this.username);
}

class SignUpPasswordEvent extends SignUpEvent{
  final String password;
  const SignUpPasswordEvent(this.password);
}