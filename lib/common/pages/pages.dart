import 'package:edu_guru/business_logic/export.dart';
import 'package:edu_guru/pages/main/application/main_entry.dart';
import 'package:edu_guru/pages/main/authentication/sign_in.dart';
import 'package:edu_guru/pages/main/authentication/sign_up.dart';
import 'package:edu_guru/pages/splash/splash.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../routes/app_routes.dart';

class AppPages {
  static List<PageEntity> routes() => [
        PageEntity(
          route: AppRoute.splashScreen,
          page: const SplashScreen(),
          bloc: BlocProvider(
            create: (_) => SplashBloc(),
          ),
        ),
        PageEntity(
          route: AppRoute.splashScreen,
          page: const SignInScreen(),
          bloc: BlocProvider(
            create: (_) => SignInBloc(),
          ),
        ),
        PageEntity(
          route: AppRoute.splashScreen,
          page: const SignUpScreen(),
          bloc: BlocProvider(
            create: (_) => SignUpBloc(),
          ),
        ),
        PageEntity(
          route: AppRoute.homeScreen,
          page: const MainEntryScreen(),
          // bloc: BlocProvider(
          //   create: (_) => SignUpBloc(),
          // ),
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
          routes().where((element) => routeSettings.name == element.route);

      if (result.isNotEmpty) {
        return MaterialPageRoute(
          builder: (_) => result.first.page,
          settings: routeSettings,
        );
      }
    }

    return MaterialPageRoute(
      builder: (_) => const SignInScreen(),
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
