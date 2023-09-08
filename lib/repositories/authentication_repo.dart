import 'package:edu_guru/constants/enums/signin_type.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../business_logic/sign_in/sign_in_bloc.dart';
import '../constants/enums/status.dart';
import '../pages/main/widgets/flutter_toast.dart';

class AuthenticationRepo {
  final BuildContext context;

  AuthenticationRepo({required this.context});

  void handleSignIn(SignInType type) async {
    switch (type) {
      case SignInType.email:
        final state = context.read<SignInBloc>().state;
        String email = state.email;
        String password = state.password;

        print('Email:$email | Password $password');

        try {
          UserCredential credential =
              await FirebaseAuth.instance.signInWithEmailAndPassword(
            email: email,
            password: password,
          );

          if (!credential.user!.emailVerified) {
            //
            toastInfo(msg: 'Ops! Email not verified!', status: Status.error);
          }

          var user = credential.user;

          if (user != null) {
            // user is not null!
          } else {}
        } on FirebaseAuthException catch (e) {
          String error = "Error occurred!";
          if (e.message != null) {
            if (e.code == 'user-not-found') {
              error = "Email not recognised!";
            } else if (e.code == 'account-exists-with-different-credential') {
              error = "Email already in use!";
            } else if (e.code == 'wrong-password') {
              error = 'Email or Password Incorrect!';
            } else if (e.code == 'network-request-failed') {
              error = 'Network error!';
            } else {
              error = e.code;
            }
          }
          toastInfo(msg: 'Ops! $error', status: Status.error);

          print(error);
        } catch (e) {
          // error
          if (kDebugMode) {
            print(e);
          }
        }

        break;

      case SignInType.facebook:
        break;

      case SignInType.apple:
        break;

      case SignInType.google:
        break;
    }
  }
}
