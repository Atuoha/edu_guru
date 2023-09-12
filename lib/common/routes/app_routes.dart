import 'package:edu_guru/pages/main/authentication/sign_in.dart';
import 'package:edu_guru/pages/main/authentication/sign_up.dart';
import 'package:edu_guru/pages/main/screens/home.dart';
import 'package:edu_guru/pages/main/screens/main_entry.dart';
import 'package:edu_guru/pages/splash/splash.dart';
import 'package:flutter/cupertino.dart';

class AppRoute {
  static const String splashScreen = '/splashScreen';
  static const String signInScreen = '/signInScreen';
  static const String signUpScreen = '/signUpScreen';
  static const String homeScreen = '/homeScreen';
}

final routes = {
  AppRoute.splashScreen: (context) => const SplashScreen(),
  AppRoute.signInScreen: (context) => const SignInScreen(),
  AppRoute.signUpScreen: (context) => const SignUpScreen(),
  AppRoute.homeScreen: (context) => const MainEntryScreen(),
};
