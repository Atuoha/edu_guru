import 'package:edu_guru/common/theme/styles_manager.dart';
import 'package:edu_guru/repositories/repos.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../../common/theme/font_manager.dart';
import '../../../../../constants/color.dart';
import '../../../widgets/are_you_sure_dialog.dart';

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
      content: 'Are you sure you want to sign out your account',
      context: context,
      action: signOut,
    );
  }

  // sign out fnc
  void signOut() {
    SignInRepo signInRepo = SignInRepo(context: context);
    signInRepo.signOut();
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
          horizontal: 18.0,
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
              ListTile(
                contentPadding: EdgeInsets.zero,
                title: Text('Settings'),
              )
            ],
          ),
        ),
      ),
      bottomSheet: GestureDetector(
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
            child: Text(
              'Sign out',
              style: TextStyle(
                color: AppColors.primaryText,
                fontSize: 16.sp,
                fontWeight: FontWeight.normal,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
