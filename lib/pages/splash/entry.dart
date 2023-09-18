import 'dart:async';
import 'package:edu_guru/common/routes/app_routes.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

import '../../gen/assets.gen.dart';

class EntryScreen extends StatefulWidget {
  const EntryScreen({
    super.key,
    required this.isAppPreviouslyRun,
  });

  final bool isAppPreviouslyRun;

  @override
  State<EntryScreen> createState() => _EntryScreenState();
}

class _EntryScreenState extends State<EntryScreen> {


 void  isFirstRun() {
    if (widget.isAppPreviouslyRun) {
      // app has ran before
      FirebaseAuth.instance.authStateChanges().listen((User? user) {
        if (user != null) {
          // user is logged in
          Timer(const Duration(seconds: 3), () {
            Navigator.of(context).pushNamedAndRemoveUntil(
              AppRoute.homeScreen,
              (route) => false,
            );
          });
        } else {
          // user is not logged in
          Timer(const Duration(seconds: 3), () {
            Navigator.of(context).pushNamedAndRemoveUntil(
                AppRoute.signUpScreen, (route) => false);
          });
        }
      });
    } else {
      // app has not ran before
      Timer(const Duration(seconds: 3), () {
        Navigator.of(context).pushNamedAndRemoveUntil(
          AppRoute.splashScreen,
          (router) => false,
        );
      });
    }
  }

  @override
  void initState() {
    super.initState();
    isFirstRun();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Image.asset(Assets.images.eduGuruTransparent.path),
      ),
    );
  }
}
