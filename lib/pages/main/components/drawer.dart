import 'dart:io';

import 'package:edu_guru/common/theme/styles_manager.dart';
import 'package:edu_guru/repositories/home_repo.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../common/models/drawer_menu.dart';
import '../../../common/theme/font_manager.dart';
import '../../../constants/color.dart';
import '../../../gen/assets.gen.dart';
import '../../../repositories/sign_in_repo.dart';
import '../widgets/are_you_sure_dialog.dart';
import '../widgets/drawer_menu_list_tile.dart';

class DrawerComponent extends StatefulWidget {
  const DrawerComponent({super.key});

  @override
  State<DrawerComponent> createState() => _DrawerComponentState();
}

class _DrawerComponentState extends State<DrawerComponent> {
  void goToBuyCourse() {
    // Todo go to buy course
  }

  void goToMyProfile() {
    // Todo go to profile
  }

  void goToWishList() {
    // Todo go to Wish List
  }

  void goToWallet() {
    // Todo go to Wallet
  }

  void goToNotifications() {
    // Todo go to Notifications
    print('Notifications');
  }

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

  @override
  Widget build(BuildContext context) {
    // drawer menu list
    final List<DrawerMenu> drawerMenus = [
      DrawerMenu(
        title: 'My Profile',
        icon: Platform.isAndroid ? Icons.person_outline : CupertinoIcons.person,
        actionHandler: goToMyProfile,
      ),
      DrawerMenu(
        title: 'My Courses',
        icon: CupertinoIcons.videocam_fill,
        actionHandler: goToBuyCourse,
      ),
      DrawerMenu(
        title: 'Notifications',
        icon: Platform.isAndroid
            ? Icons.notifications_active_outlined
            : CupertinoIcons.bell,
        actionHandler: goToNotifications,
      ),
      DrawerMenu(
        title: 'My Wallet',
        icon: Icons.wallet,
        actionHandler: goToWallet,
      ),
      DrawerMenu(
        title: 'Wish List',
        icon: CupertinoIcons.heart_fill,
        actionHandler: goToWishList,
      ),
      DrawerMenu(
        title: 'Sign out',
        icon: Icons.logout,
        actionHandler: signOutDialog,
      ),
    ];

    return Drawer(
      elevation: 0,
      child: Padding(
        padding: const EdgeInsets.all(5.0),
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Builder(
                  builder: (context) {
                    return GestureDetector(
                      onTap: () => Scaffold.of(context).closeDrawer(),
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Image.asset(
                          Assets.icons.menu.path,
                          width: 20.w,
                        ),
                      ),
                    );
                  },
                ),
              ],
            ),
            const SizedBox(height: 20),
            Container(
              height: 90.h,
              width: 120.w,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                image: DecorationImage(
                  image: NetworkImage(
                    HomeRepo(context: context).userItem.avatar!,
                  ),
                ),
              ),
            ),
            const SizedBox(height: 10),
            Text(
              HomeRepo(context: context).userItem.name!,
              style: getMediumStyle(
                color: Colors.black,
                fontSize: FontSize.s16,
              ),
            ),
            const SizedBox(height: 5),
            Text(
              HomeRepo(context: context).userItem.email!,
              style: getRegularStyle(
                color: Colors.black,
                fontSize: FontSize.s14,
              ),
            ),
            const SizedBox(height: 10),
            SizedBox(
              height: MediaQuery.of(context).size.height / 2.h,
              child: ListView.builder(
                itemCount: drawerMenus.length,
                itemBuilder: (context, index) {
                  var menu = drawerMenus[index];

                  return GestureDetector(
                    onTap: () => menu.actionHandler(),
                    child: DrawerMenuListTile(menu: menu),
                  );
                },
              ),
            )
          ],
        ),
      ),
    );
  }
}
