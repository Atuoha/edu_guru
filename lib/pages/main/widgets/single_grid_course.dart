import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../common/theme/font_manager.dart';
import '../../../common/theme/styles_manager.dart';
import '../../../gen/assets.gen.dart';

class SingleGridCourse extends StatelessWidget {
  const SingleGridCourse({
    super.key,
    required this.courseTitle,
    required this.numberOfCourses,
    required this.imgUrl,
  });

  final String courseTitle;
  final String numberOfCourses;
  final String imgUrl;

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
          decoration: BoxDecoration(
            image: DecorationImage(
              image: AssetImage(
                imgUrl,
              ),
            ),
            borderRadius: BorderRadius.circular(10),
          ),
        ),
        Positioned(
          bottom: 20,
          left: 20,
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
                    color: Colors.white,
                    fontSize: FontSize.s14.sp,
                  ),
                ),
              ),
              const SizedBox(height: 7),
              Text(
                numberOfCourses,
                style: getBoldStyle(
                  color: Colors.white,
                ),
              ),
            ],
          ),
        )
      ],
    );
  }
}
