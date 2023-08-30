import 'package:edu_guru/business_logic/splash/splash_bloc.dart';
import 'package:edu_guru/pages/main/authentication/sign_in.dart';
import 'package:edu_guru/pages/splash/entry.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

void main() => runApp(const EduGuru());

class EduGuru extends StatelessWidget {
  const EduGuru({super.key});

  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(
      const SystemUiOverlayStyle(
        statusBarColor: Colors.transparent,
      ),
    );

    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => SplashBloc(),
        ),
      ],
      child: ScreenUtilInit(
        builder: (context, child) => MaterialApp(
          theme: ThemeData(
            appBarTheme: const AppBarTheme(
              color: Colors.transparent,
              elevation: 0,
            ),
            fontFamily: 'Avenir'
          ),
          debugShowCheckedModeBanner: false,
          home: const EntryScreen(),
          routes: {
            'login': (context) => const SignInScreen(),
          },
        ),
      ),
    );
  }
}
