import 'dart:async';

import 'package:edu_guru/business_logic/export.dart';
import 'package:edu_guru/pages/main/application/main_entry.dart';
import 'package:edu_guru/pages/main/authentication/sign_in.dart';
import 'package:edu_guru/pages/main/authentication/sign_up.dart';
import 'package:edu_guru/pages/main/error_screen.dart';
import 'package:edu_guru/pages/splash/entry.dart';
import 'package:edu_guru/pages/splash/splash.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../constants/constants.dart';
import '../../global_config/global.dart';
import '../routes/app_routes.dart';

class AppPages {
  static List<PageEntity> routes() => [
        PageEntity(
          route: AppRoutes.entryScreen,
          page: const EntryScreen(),
        ),
        PageEntity(
          route: AppRoutes.splashScreen,
          page: const SplashScreen(),
          bloc: BlocProvider(
            create: (_) => SplashBloc(),
          ),
        ),
        PageEntity(
          route: AppRoutes.errorScreen,
          page: const ErrorScreen(),
        ),
        PageEntity(
          route: AppRoutes.signInScreen,
          page: const SignInScreen(),
          bloc: BlocProvider(
            create: (_) => SignInBloc(),
          ),
        ),
        PageEntity(
          route: AppRoutes.splashScreen,
          page: const SignUpScreen(),
          bloc: BlocProvider(
            create: (_) => SignUpBloc(),
          ),
        ),
        PageEntity(
          route: AppRoutes.homeScreen,
          page: const MainEntryScreen(),
        ),
      ];

  static List<dynamic> allBlocProviders(BuildContext context) {
    List<dynamic> blocProviders = <dynamic>[];

    for (var bloc in routes()) {
      blocProviders.add(bloc.bloc);
    }
    return blocProviders;
  }

  static MaterialPageRoute generateRoute(RouteSettings routeSettings) {
    if (routeSettings.name != null) {
      // check if routeSettings is available in routes
      var result =
          routes().where((element) => element.route == routeSettings.name);

      if (result.isNotEmpty) {
        bool isAppPreviouslyRan =
            Global.storageService.getBoolValue(AppConstants.isAppPreviouslyRan);

        bool isUserLoggedIn =
            Global.storageService.getBoolValue(AppConstants.isUserLoggedIn);

        if (isAppPreviouslyRan) {

          if (isUserLoggedIn) {
            return MaterialPageRoute(
              builder: (_) => const MainEntryScreen(),
              settings: routeSettings,
            );
          } else {
            return MaterialPageRoute(
              builder: (_) => const SignInScreen(),
              settings: routeSettings,
            );
          }
        }
      }

      return MaterialPageRoute(
        builder: (_) => result.first.page,
        settings: routeSettings,
      );
    }

    print('Unknown route name');
    return MaterialPageRoute(
      builder: (_) => const ErrorScreen(),
      settings: routeSettings,
    );
  }
}

class PageEntity {
  final String route;
  final Widget page;
  final dynamic bloc;

  PageEntity({
    required this.route,
    required this.page,
    this.bloc,
  });
}
