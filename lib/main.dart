import 'package:edu_guru/common/app_bloc_providers/app_bloc_providers.dart';
import 'package:edu_guru/common/pages/pages.dart';
import 'package:edu_guru/common/theme/app_theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
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
          theme: getLightTheme(),
          builder: EasyLoading.init(),
          onGenerateRoute: AppPages.generateRoute,
        ),
      ),
    );
  }
}
