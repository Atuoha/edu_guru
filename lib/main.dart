import 'package:edu_guru/common/app_bloc_providers/app_bloc_providers.dart';
import 'package:edu_guru/common/pages/pages.dart';
import 'package:edu_guru/pages/splash/entry.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'common/routes/app_routes.dart';
import 'firebase_options.dart';
import 'gen/fonts.gen.dart';
import 'global_config/global.dart';

Future<void> main() async {
  await Global.init();
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

    EasyLoading.instance
      ..dismissOnTap = false
      ..indicatorType = EasyLoadingIndicatorType.fadingCircle
      ..animationDuration = const Duration(seconds: 5)
      ..loadingStyle = EasyLoadingStyle.light;

    return MultiBlocProvider(
      providers: AppBlocProviders.allBlocProviders,
      child: ScreenUtilInit(
        builder: (context, child) => MaterialApp(
          debugShowCheckedModeBanner: false,
          theme: ThemeData(
            appBarTheme: const AppBarTheme(
              color: Colors.transparent,
              elevation: 0,
            ),
            fontFamily: FontFamily.avenir,
          ),
          builder: EasyLoading.init(),
          onGenerateRoute: AppPages.generateRoute,
        ),
      ),
    );
  }
}
