import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../common/models/drawer_menu.dart';
import '../../../constants/color.dart';


class DrawerMenuListTile extends StatelessWidget {
  const DrawerMenuListTile({
    super.key,
    required this.menu,
  });

  final DrawerMenu menu;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: Container(
        height: 40.h,
        width: 50.w,
        decoration: BoxDecoration(
          shape: BoxShape.circle,
          color:
          AppColors.primaryFourElementText.withOpacity(0.3),
        ),
        child: Icon(menu.icon),
      ),
      title: Text(menu.title),
      trailing: const Icon(
        Icons.chevron_right,
        color: AppColors.primaryFourElementText,
      ),
    );
  }
}
