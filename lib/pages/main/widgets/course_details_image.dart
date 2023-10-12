import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:shimmer/shimmer.dart';
import '../../../constants/constants.dart';
import '../application/courses/course_details.dart';

class CourseDetailsImage extends StatelessWidget {
  const CourseDetailsImage({
    super.key,
    required this.widget,
  });

  final CourseDetails widget;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 200.h,
      decoration: BoxDecoration(
        image: DecorationImage(
          image: NetworkImage(
            '${AppConstants.uploadURL}/${widget.course.thumbnail!}',
          ),
          fit: BoxFit.cover,
        ),
        borderRadius: BorderRadius.circular(20),
      ),
    );
  }
}
