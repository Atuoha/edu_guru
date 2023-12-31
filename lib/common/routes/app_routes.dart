import 'package:edu_guru/common/models/course.dart';
import 'package:edu_guru/pages/main/application/chat/chat_screen.dart';
import 'package:edu_guru/pages/main/application/courses/course_details.dart';
import 'package:edu_guru/pages/main/application/profile/preliminary/edit_profile.dart';
import 'package:edu_guru/pages/main/application/profile/preliminary/settings.dart';
import 'package:edu_guru/pages/main/authentication/sign_in.dart';
import 'package:edu_guru/pages/main/authentication/sign_up.dart';
import 'package:edu_guru/pages/main/application/main_entry.dart';
import 'package:edu_guru/pages/splash/entry.dart';
import 'package:edu_guru/pages/splash/splash.dart';

class AppRoutes {
  static const String entryScreen = '/';
  static const String splashScreen = '/splashScreen';
  static const String signInScreen = '/signInScreen';
  static const String signUpScreen = '/signUpScreen';
  static const String homeScreen = '/homeScreen';
  static const String errorScreen = '/errorScreen';
  static const String settingScreen = '/settingScreen';
  static const String changePassword = '/changePassword';
  static const String editProfileScreen = '/editProfileScreen';
  static const String courseDetails = '/courseDetails';
  static const String chatScreen = '/chatScreen';
}

final routes = {
  AppRoutes.entryScreen: (context) => const EntryScreen(),
  AppRoutes.splashScreen: (context) => const SplashScreen(),
  AppRoutes.signInScreen: (context) => const SignInScreen(),
  AppRoutes.signUpScreen: (context) => const SignUpScreen(),
  AppRoutes.homeScreen: (context) => const MainEntryScreen(),
  AppRoutes.settingScreen: (context) => const SettingsScreen(),
  AppRoutes.editProfileScreen: (context) => const EditProfileScreen(),
  AppRoutes.courseDetails: (context) => CourseDetails(course: CourseItem()),
  AppRoutes.chatScreen: (context) => const ChatScreen(),
};
