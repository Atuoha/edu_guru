import 'dart:async';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:edu_guru/business_logic/export.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import '../constants/constants.dart';
import '../constants/enums/status.dart';
import '../pages/main/widgets/flutter_toast.dart';

class SignUpRepo {
  final BuildContext context;

  SignUpRepo({required this.context});

  void handleSignUp() async {
    final state = context.read<SignUpBloc>().state;
    final email = state.email;
    final username = state.username;
    final password = state.password;

    try {
      EasyLoading.show();
      UserCredential credential =
          await FirebaseAuth.instance.createUserWithEmailAndPassword(
        email: email,
        password: password,
      );

      var user = credential.user;

      if (user != null) {
        await user.sendEmailVerification();
        await user.updateDisplayName(username);
        await user.updateEmail(email);
        await user.updatePhotoURL(AppConstants.defaultImg);

        await FirebaseFirestore.instance.collection('users').doc(user.uid).set({
          'user_id': user.uid,
          'email': user.email,
          'username': username,
          'photo_url': AppConstants.defaultImg
        });

        toastInfo(
          msg: 'Success! Account created. Check your email for verification.',
          status: Status.success,
        );

        Future.delayed(const Duration(seconds: 3));
        navigateBack();
      }
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
  }

  void navigateBack() {
    EasyLoading.dismiss();
    Navigator.of(context).pop();
  }
}
