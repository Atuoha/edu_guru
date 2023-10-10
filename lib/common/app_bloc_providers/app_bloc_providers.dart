import 'package:edu_guru/business_logic/category/category_cubit.dart';
import 'package:edu_guru/business_logic/course_list/course_list_cubit.dart';
import 'package:edu_guru/business_logic/course_tab_header/course_tab_header_cubit.dart';
import 'package:edu_guru/business_logic/export.dart';
import 'package:edu_guru/business_logic/settings/settings_bloc.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class AppBlocProviders {
  static get allBlocProviders => [
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

        // carousel slider cubit
        BlocProvider(
          create: (context) => CarouselSliderCubit(),
        ),

        // category  cubit
        BlocProvider(
          create: (context) => CategoryCubit(),
        ),

        // settings bloc
        BlocProvider(
          create: (context) => SettingsBloc(),
        ),

        // settings cubit
        BlocProvider(
          create: (context) => CourseListCubit(),
        ),

        // course tab header cubit
        BlocProvider(
          create: (context) => CourseTabHeaderCubit(),
        )
      ];
}
