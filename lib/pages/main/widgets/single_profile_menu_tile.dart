import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../common/theme/font_manager.dart';
import '../../../common/theme/styles_manager.dart';
import '../../../constants/color.dart';


class SingleProfileMenuTile extends StatelessWidget {
  const SingleProfileMenuTile({
    super.key,
    required this.icon,
    required this.title,
    required this.fnc,
  });

  final IconData icon;
  final String title;
  final Function fnc;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => fnc(),
      child: ListTile(
        leading: Container(
          width: 35.w,
          height: 35.h,
          decoration: BoxDecoration(
            color: AppColors.secondaryOpacity,
            borderRadius: BorderRadius.circular(10),
          ),
          child: Icon(
            icon,
            color: Colors.white,
          ),
        ),
        title: Text(
          title,
          style: getBoldStyle(
            color: Colors.black,
            fontSize: FontSize.s16,
          ),
        ),
      ),
    );
  }
}
