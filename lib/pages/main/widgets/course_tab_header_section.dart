import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../business_logic/course_tab_header/course_tab_header_cubit.dart';
import '../../../common/models/course_tab_header.dart';
import '../application/courses/course_details.dart';
import 'course_tab_header.dart';

class CourseTabHeaders extends StatelessWidget {
  const CourseTabHeaders({
    super.key,
    required this.widget,
    required this.goToAuthorsPage,
  });

  final CourseDetails widget;
  final Function goToAuthorsPage;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 35.h,
      width: double.infinity,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: context.read<CourseTabHeaderCubit>().state.tabHeaders.length,
        itemBuilder: (context, index) {
          var item = courseTabHeaders[index];
          return GestureDetector(
            onTap: () => context
                .read<CourseTabHeaderCubit>()
                .setNewTabHeaderIndex(index: index),
            onDoubleTap: () => index == 0 ? goToAuthorsPage() : (),
            child: courseTabHeader(
              index: index,
              title: item.title!,
              icon: item.icon,
              number: index == 1
                  ? '${widget.course.follow}'
                  : '${widget.course.score}',
              context: context,
            ),
          );
        },
      ),
    );
  }
}
