import 'package:edu_guru/common/services/storage_service.dart';
import 'package:edu_guru/common/utils/app_bloc_observer.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../firebase_options.dart';

class Global {
  static late StorageService storageService;

  static Future init() async {
    Bloc.observer = AppBlocObserver();

    WidgetsFlutterBinding.ensureInitialized();
    await Firebase.initializeApp(
      options: DefaultFirebaseOptions.currentPlatform,
    );

    storageService = await StorageService().init();
  }
}
