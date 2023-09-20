import 'package:flutter/material.dart';

import '../../../common/theme/font_manager.dart';
import '../../../common/theme/styles_manager.dart';
import '../../../constants/color.dart';

class SeeAllCourses extends StatelessWidget {
  const SeeAllCourses({super.key, required this.seeAllCourses,});
  final Function seeAllCourses;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          'Select your course',
          style: getMediumStyle(
            color: Colors.black,
            fontSize: FontSize.s16,
          ),
        ),
        GestureDetector(
          onTap: ()=>seeAllCourses(),
          child: Text(
            'See all',
            style: getRegularStyle(
              color: AppColors.primaryThreeElementText,
            ),
          ),
        )
      ],
    );
  }
}
