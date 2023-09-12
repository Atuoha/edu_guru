import 'dart:async';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:edu_guru/business_logic/export.dart';
import 'package:edu_guru/constants/enums/signin_type.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';

import '../business_logic/sign_in/sign_in_bloc.dart';
import '../common/routes/app_routes.dart';
import '../constants/enums/status.dart';
import '../pages/main/widgets/flutter_toast.dart';

class SignInRepo {
  final BuildContext context;

  SignInRepo({required this.context});

  void handleSignIn(SignInType type) async {
    switch (type) {
      case SignInType.email:
        final state = context.read<SignInBloc>().state;
        String email = state.email;
        String password = state.password;
        try {
          EasyLoading.show();
          UserCredential credential =
              await FirebaseAuth.instance.signInWithEmailAndPassword(
            email: email,
            password: password,
          );

          if (!credential.user!.emailVerified) {
            toastInfo(msg: 'Ops! Email not verified!', status: Status.error);
            return;
          }
          navigateToMain();
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
          EasyLoading.dismiss();
          toastInfo(msg: 'Ops! $error', status: Status.error);

          if (kDebugMode) {
            print(error);
          }
        } catch (e) {
          // error
          if (kDebugMode) {
            print(e);
          }
          EasyLoading.dismiss();
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

  void navigateToMain() {
    EasyLoading.dismiss();
    Navigator.of(context).pushNamed(AppRoute.homeScreen);
  }
}