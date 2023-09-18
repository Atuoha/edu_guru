import 'package:edu_guru/common/app_bloc_providers/app_bloc_providers.dart';
import 'package:edu_guru/common/pages/pages.dart';
import 'package:edu_guru/common/routes/app_routes.dart';
import 'package:edu_guru/pages/main/authentication/sign_in.dart';
import 'package:edu_guru/pages/splash/entry.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'common/helpers/shared_prefs.dart';
import 'constants/color.dart';
import 'firebase_options.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  bool isAppPreviouslyRun = await checkIfAppPreviouslyRun();

  runApp(
    EduGuru(
      isAppPreviouslyRun: isAppPreviouslyRun,
    ),
  );
}

class EduGuru extends StatelessWidget {
  const EduGuru({
    super.key,
    this.isAppPreviouslyRun = false,
  });

  final bool isAppPreviouslyRun;

  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(
      const SystemUiOverlayStyle(
        statusBarColor: Colors.transparent,
      ),
    );

    EasyLoading.instance
      ..dismissOnTap = false
      ..indicatorType = EasyLoadingIndicatorType.fadingCircle
      ..animationDuration = const Duration(seconds: 5)
      ..loadingStyle = EasyLoadingStyle.light;

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
          home: child,
          // routes: routes,
          builder: EasyLoading.init(),
          onGenerateRoute: AppPages.generateRoute,
        ),
        child: EntryScreen(
          isAppPreviouslyRun: isAppPreviouslyRun,
        ),

      ),
    );
  }
}
