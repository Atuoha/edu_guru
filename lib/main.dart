import 'package:edu_guru/common/app_bloc_providers/app_bloc_providers.dart';
import 'package:edu_guru/common/routes/app_routes.dart';
import 'package:edu_guru/pages/main/authentication/sign_in.dart';
import 'package:edu_guru/pages/splash/entry.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'firebase_options.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(const EduGuru());
}

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
      providers: AppBlocProviders.allBlocProviders,
      child: ScreenUtilInit(
        builder: (context, child) => MaterialApp(
          theme: ThemeData(
            appBarTheme: const AppBarTheme(
              color: Colors.transparent,
              elevation: 0,
            ),
            fontFamily: 'Avenir',
          ),
          debugShowCheckedModeBanner: false,
          home: const EntryScreen(),
          routes: routes
        ),
      ),
    );
  }
}
