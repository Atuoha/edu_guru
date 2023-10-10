import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../business_logic/course_tab_header/course_tab_header_cubit.dart';
import '../../../common/theme/font_manager.dart';
import '../../../common/theme/styles_manager.dart';
import '../../../constants/color.dart';

// course tab header widget
Widget courseTabHeader({
  required int index,
  String? title,
  IconData? icon,
  String? number,
  required BuildContext context,
}) {
  var currentTabIndex =
      context.watch<CourseTabHeaderCubit>().state.tabHeaderIndex;

  return Container(
    height: 30.h,
    width: 100.w,
    decoration: BoxDecoration(
      color: currentTabIndex == index
          ? AppColors.secondaryOpacity
          : Colors.transparent,
      borderRadius: BorderRadius.circular(10),
    ),
    child: Center(
      child: index == 0
          ? Text(
              title!,
              style: getMediumStyle(
                color: currentTabIndex == index ? Colors.white : Colors.black38,
                fontSize: FontSize.s16,
              ),
            )
          : Wrap(
              crossAxisAlignment: WrapCrossAlignment.center,
              children: [
                Icon(
                  icon,
                  size: index == 1 ? FontSize.s40: FontSize.s25,
                  color: currentTabIndex == index ? Colors.white : Colors.black38,
                ),
                const SizedBox(width: 5),
                Text(
                  number.toString(),
                  style: getMediumStyle(
                    color:
                        currentTabIndex == index ? Colors.white : Colors.black38,
                    fontSize: FontSize.s16,
                  ),
                ),
              ],
            ),
    ),
  );
}
