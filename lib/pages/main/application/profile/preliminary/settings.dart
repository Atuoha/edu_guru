import 'package:edu_guru/common/routes/app_routes.dart';
import 'package:edu_guru/common/theme/styles_manager.dart';
import 'package:edu_guru/repositories/repos.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../../../common/theme/font_manager.dart';
import '../../../../../constants/color.dart';
import '../../../widgets/are_you_sure_dialog.dart';
import '../../../widgets/settings_menu_tile.dart';

class SettingsScreen extends StatefulWidget {
  const SettingsScreen({super.key});

  @override
  State<SettingsScreen> createState() => _SettingsScreenState();
}

class _SettingsScreenState extends State<SettingsScreen> {
  // Sign out dialog
  void signOutDialog() {
    areYouSureDialog(
      title: 'Sign out account',
      content: 'Are you sure you want to sign out your account?',
      context: context,
      action: signOut,
    );
  }

  // sign out fnc
  void signOut() {
    SignInRepo signInRepo = SignInRepo(context: context);
    signInRepo.signOut();
  }

  // navigate to change password
  void navigateToChangePassword() {
    Navigator.of(context).pushNamed(AppRoutes.changePassword);
  }

  // navigateToEditProfile
  void navigateToEditProfile() {
    Navigator.of(context).pushNamed(AppRoutes.editProfileScreen);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        leading: Builder(
          builder: (BuildContext context) => GestureDetector(
            onTap: () => Navigator.of(context).pop(),
            child: const Icon(Icons.chevron_left),
          ),
        ),
        title: Text(
          'Setting',
          style: getRegularStyle(
            color: Colors.black,
          ),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(
          horizontal: 19.0,
          vertical: 10,
        ),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'App Settings',
                style: getBoldStyle(
                  color: Colors.black,
                  fontSize: FontSize.s16,
                ),
              ),
              const SizedBox(height: 10),
              SettingsMenuTile(
                title: 'Edit Account',
                fnc: navigateToEditProfile,
              ),
              SettingsMenuTile(
                title: 'Change your password',
                fnc: navigateToChangePassword,
              ),
              SettingsMenuTile(
                title: 'Security & privacy',
                fnc: () => null,
              ),
              const Divider(
                color: AppColors.primaryFourElementText,
              ),
              const SizedBox(height: 30),
              Text(
                'Notification',
                style: getBoldStyle(
                  color: Colors.black,
                  fontSize: FontSize.s16,
                ),
              ),
              SettingsMenuTile(
                title: 'Notification',
                fnc: () => null,
              ),
              SettingsMenuTile(
                title: 'App Notification',
                fnc: () => null,
              ),
              const Divider(
                color: AppColors.primaryFourElementText,
              ),
              const SizedBox(height: 30),
              Text(
                'Others',
                style: getBoldStyle(
                  color: Colors.black,
                  fontSize: FontSize.s16,
                ),
              ),
              SettingsMenuTile(
                title: 'Language',
                fnc: () => null,
              ),
              SettingsMenuTile(
                title: 'Country',
                fnc: () => null,
              ),
            ],
          ),
        ),
      ),
      bottomSheet: Padding(
        padding: const EdgeInsets.symmetric(vertical: 18.0, horizontal: 18),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            GestureDetector(
              onTap: () => signOutDialog(),
              child: Container(
                height: 50,
                width: double.infinity,
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(10),
                  border: Border.all(
                    color: AppColors.primaryFourElementText,
                  ),
                ),
                child: Center(
                  child: Wrap(
                    crossAxisAlignment: WrapCrossAlignment.center,
                    children: [
                      const Icon(Icons.logout),
                      const SizedBox(width: 10),
                      Text(
                        'Sign out',
                        style: TextStyle(
                          color: AppColors.primaryText,
                          fontSize: 16.sp,
                          fontWeight: FontWeight.normal,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
            const SizedBox(height: 20),
          ],
        ),
      ),
    );
  }
}
