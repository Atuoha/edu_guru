import 'package:edu_guru/business_logic/change_password/change_password_bloc.dart';
import 'package:edu_guru/business_logic/export.dart';
import 'package:edu_guru/business_logic/settings/settings_bloc.dart';
import 'package:edu_guru/pages/main/application/main_entry.dart';
import 'package:edu_guru/pages/main/application/profile/preliminary/change_password.dart';
import 'package:edu_guru/pages/main/application/profile/preliminary/edit_profile.dart';
import 'package:edu_guru/pages/main/application/profile/preliminary/settings.dart';
import 'package:edu_guru/pages/main/authentication/sign_in.dart';
import 'package:edu_guru/pages/main/authentication/sign_up.dart';
import 'package:edu_guru/pages/main/error_screen.dart';
import 'package:edu_guru/pages/splash/entry.dart';
import 'package:edu_guru/pages/splash/splash.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../constants/constants.dart';
import '../../global_config/global.dart';
import '../routes/app_routes.dart';

class AppPages {
  static List<PageEntity> routes() => [
        // entry screen
        PageEntity(
          route: AppRoutes.entryScreen,
          page: const EntryScreen(),
        ),

        // splash screen
        PageEntity(
          route: AppRoutes.splashScreen,
          page: const SplashScreen(),
          bloc: BlocProvider(
            create: (_) => SplashBloc(),
          ),
        ),

        // error screen
        PageEntity(
          route: AppRoutes.errorScreen,
          page: const ErrorScreen(),
        ),

        // sign in screen
        PageEntity(
          route: AppRoutes.signInScreen,
          page: const SignInScreen(),
          bloc: BlocProvider(
            create: (_) => SignInBloc(),
          ),
        ),

        // sign up screen
        PageEntity(
          route: AppRoutes.signUpScreen,
          page: const SignUpScreen(),
          bloc: BlocProvider(
            create: (_) => SignUpBloc(),
          ),
        ),

        // home screen
        PageEntity(
          route: AppRoutes.homeScreen,
          page: const MainEntryScreen(),
        ),

        // settings screen
        PageEntity(
          route: AppRoutes.settingScreen,
          page: const SettingsScreen(),
          bloc: BlocProvider(
            create: (_) => SettingsBloc(),
          ),
        ),

        // change password screen
        PageEntity(
          route: AppRoutes.changePassword,
          page: const ChangePasswordScreen(),
          bloc: BlocProvider(
            create: (_) => ChangePasswordBloc(),
          ),
        ),

        // edit profile screen
        PageEntity(
          route: AppRoutes.editProfileScreen,
          page: const EditProfileScreen(),
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

        if (result.first.route == AppRoutes.entryScreen && isAppPreviouslyRan) {
          if (isUserLoggedIn) {
            return MaterialPageRoute(
              builder: (_) => const MainEntryScreen(),
              settings: routeSettings,
            );
          }
          return MaterialPageRoute(
            builder: (_) => const SignInScreen(),
            settings: routeSettings,
          );
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
