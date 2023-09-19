import 'package:edu_guru/pages/main/authentication/sign_in.dart';
import 'package:edu_guru/pages/main/authentication/sign_up.dart';
import 'package:edu_guru/pages/main/application/home.dart';
import 'package:edu_guru/pages/main/application/main_entry.dart';
import 'package:edu_guru/pages/splash/entry.dart';
import 'package:edu_guru/pages/splash/splash.dart';
import 'package:flutter/cupertino.dart';

class AppRoutes {
  static const String entryScreen = '/';
  static const String splashScreen = '/splashScreen';
  static const String signInScreen = '/signInScreen';
  static const String signUpScreen = '/signUpScreen';
  static const String homeScreen = '/homeScreen';
  static const String errorScreen = '/errorScreen';
}

final routes = {
  AppRoutes.entryScreen: (context)=>const EntryScreen(),
  AppRoutes.splashScreen: (context) => const SplashScreen(),
  AppRoutes.signInScreen: (context) => const SignInScreen(),
  AppRoutes.signUpScreen: (context) => const SignUpScreen(),
  AppRoutes.homeScreen: (context) => const MainEntryScreen(),
};
