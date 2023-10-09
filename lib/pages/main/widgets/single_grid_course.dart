import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../common/theme/font_manager.dart';
import '../../../common/theme/styles_manager.dart';
import '../../../constants/color.dart';
import '../../../gen/assets.gen.dart';

class SingleGridCourse extends StatelessWidget {
  const SingleGridCourse({
    super.key,
    required this.courseTitle,
    required this.numberOfCourses,
    required this.imgUrl,
    required this.size,
  });

  final String courseTitle;
  final String numberOfCourses;
  final String imgUrl;
  final Size size;

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
          decoration: BoxDecoration(
            image: DecorationImage(
              image: NetworkImage(
                imgUrl,
              ),
              fit: BoxFit.cover,
            ),
            borderRadius: BorderRadius.circular(10),
          ),
        ),
        Positioned(
          bottom: 3,
          left: 3,
          right: 3,
          child: Container(
            height: size.height / 15,
            padding: const EdgeInsets.only(left: 5),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              gradient: LinearGradient(
                begin: Alignment.center,
                end: Alignment.topCenter,
                stops: const [0, 1],
                colors: [
                  Colors.white,
                  Colors.white.withOpacity(.03),
                ],
              ),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const SizedBox(height: 20),
                FittedBox(
                  child: Text(
                    courseTitle,
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                    style: getHeadingStyle(
                      color: AppColors.primarySecondaryElementText,
                      fontSize: FontSize.s14.sp,
                    ),
                  ),
                ),
                const SizedBox(height: 7),
                Text(
                  '$numberOfCourses Lessons',
                  style: getBoldStyle(
                    color: AppColors.primarySecondaryElementText,
                  ),
                ),
              ],
            ),
          ),
        )
      ],
    );
  }
}
