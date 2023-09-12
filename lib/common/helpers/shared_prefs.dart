import 'package:shared_preferences/shared_preferences.dart';


// check if app has ran before
Future<bool> checkIfAppPreviouslyRun() async {
  SharedPreferences prefs = await SharedPreferences.getInstance();
  return prefs.getBool('isAppPreviouslyRun') ?? false;
}

// set appIsPreviouslyRun
Future<void> setAppPreviouslyRun() async {
  SharedPreferences prefs = await SharedPreferences.getInstance();
  await prefs.setBool('isAppPreviouslyRun', true);
}


