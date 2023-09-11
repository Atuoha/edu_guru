import 'package:edu_guru/business_logic/export.dart';
import 'package:flutter_bloc/flutter_bloc.dart';


class AppBlocProviders{
  static get allBlocProviders=>[
    // splash bloc
    BlocProvider(
      create: (context) => SplashBloc(),
    ),

    // sign in bloc
    BlocProvider(
      create: (context) => SignInBloc(),
    ),

  // sign up bloc
  BlocProvider(
  create: (context) => SignUpBloc(),
  ),

  ];
}