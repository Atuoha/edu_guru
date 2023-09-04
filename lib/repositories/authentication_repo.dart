
import 'package:edu_guru/constants/enums/signin_type.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../business_logic/sign_in/sign_in_bloc.dart';

class AuthenticationRepo {
  final BuildContext context;

  AuthenticationRepo({required this.context});

  void handleSignIn(SignInType type) async {
      switch (type) {
        case SignInType.email:
          final state = context.read<SignInBloc>().state;
          String email = state.email;
          String password = state.password;


          if (email.isEmpty) {
            //
          }
          if (password.isEmpty) {
            //
          }


          try{
            UserCredential credential =
            await FirebaseAuth.instance.signInWithEmailAndPassword(
              email: email,
              password: password,
            );

            if(credential.user == null){
              //
            }


            if(!credential.user!.emailVerified){
              //
            }

            var user = credential.user;

            if(user != null){
              // user is verified!
            }else{

            }

          }catch(e){
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
