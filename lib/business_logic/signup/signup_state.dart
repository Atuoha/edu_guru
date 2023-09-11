part of 'signup_bloc.dart';


class SignUpState extends Equatable {
  final String email;
  final String username;
  final String password;

  const SignUpState({
    required this.email,
    required this.username,
    required this.password,
  });

  factory SignUpState.initial() => const SignUpState(
    email: "",
    username: "",
    password: "",
  );

  @override
  List<Object> get props => [email,username, password];

  SignUpState copyWith({
    String? email,
    String? username,
    String? password,
  }) {
    return SignUpState(
      email: email ?? this.email,
      username: username ?? this.username,
      password: password ?? this.password,
    );
  }
}

