import 'dart:async';
import 'dart:convert';
import 'package:edu_guru/business_logic/export.dart';
import 'package:edu_guru/common/models/entities.dart';
import 'package:edu_guru/constants/constants.dart';
import 'package:edu_guru/constants/enums/signin_type.dart';
import 'package:edu_guru/repositories/home_repo.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import '../business_logic/sign_in/sign_in_bloc.dart';
import '../common/apis/user_api.dart';
import '../common/routes/app_routes.dart';
import '../constants/enums/status.dart';
import '../global_config/global.dart';
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

          User? user = credential.user;
          if (user != null) {
            String? username = user.displayName;
            String? emailAddress = user.email;
            String? userId = user.uid;
            String? photoUrl = user.photoURL;
            String? phoneNumber = user.phoneNumber;

            print("Open_id: $userId");
            print("Photo_url: $photoUrl");
            print("Phone: $phoneNumber");

            LoginRequestEntity loginRequestEntity = LoginRequestEntity();
            loginRequestEntity.avatar = photoUrl;
            loginRequestEntity.email = emailAddress;
            loginRequestEntity.open_id = userId;
            // loginRequestEntity.phone = phoneNumber;
            loginRequestEntity.type = 1;
            loginRequestEntity.name = username;

            asyncPostData(
              loginRequestEntity: loginRequestEntity,
            );
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

        break;

      case SignInType.facebook:
        break;

      case SignInType.apple:
        break;

      case SignInType.google:
        break;
    }
  }

  // navigating to main screen after signing in
  void navigateToMain() {
    EasyLoading.dismiss();
    // set logged in to true
    Global.storageService.setBoolValue(AppConstants.isUserLoggedIn, true);

    Navigator.of(context).pushNamedAndRemoveUntil(
      AppRoutes.homeScreen,
      (route) => false,
    );
  }

  // sign out
  Future<void> signOut() async {
    EasyLoading.show();
    // logout
    try {
      await FirebaseAuth.instance.signOut();
      navigateToSignIn();
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
      print('Error occurred');
    }
  }

  // for navigating to sign in after signing out
  void navigateToSignIn() {
    // dismiss loading
    EasyLoading.dismiss();

    // set token to empty
    Global.storageService.removeKey(AppConstants.userTokenKey);

    // set logged in to false
    Global.storageService.removeKey(AppConstants.isUserLoggedIn);

    // set profile key to empty
    Global.storageService.removeKey(AppConstants.userProfileKey);

    // navigate to sign in screen
    Navigator.of(context).pushNamedAndRemoveUntil(
      AppRoutes.signInScreen,
      (route) => false,
    );
  }

  // API data action and setting data
  Future<void> asyncPostData({
    required LoginRequestEntity loginRequestEntity,
  }) async {
    EasyLoading.show();
    var result = await UserAPI.login(params: loginRequestEntity); // API Call
    if (result.code == 200) {
      try {
        //setting user token
        Global.storageService.setStringValue(
          AppConstants.userTokenKey,
          result.data!.access_token.toString(),
        );

        //setting user profile details
        Global.storageService.setStringValue(
          AppConstants.userProfileKey,
          jsonEncode(result.data),
        );

        EasyLoading.dismiss(); // dismissing loading
        navigateToMain(); // navigating to main screen
      } catch (e) {
        EasyLoading.dismiss(); // dismissing loading
        toastInfo(msg: 'Ops! An error occurred.', status: Status.error);
      }
    } else {
      EasyLoading.dismiss(); // dismissing loading
      toastInfo(
          msg: 'Ops! An error occurred - ${result.msg}.', status: Status.error);
    }
  }
}
