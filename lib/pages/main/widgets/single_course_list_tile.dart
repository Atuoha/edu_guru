import 'package:flutter/material.dart';

import '../../../common/models/course.dart';
import '../../../common/theme/styles_manager.dart';
import '../../../constants/color.dart';
import '../../../constants/constants.dart';

class CourseListTile extends StatelessWidget {
  const CourseListTile({
    super.key,
    required this.course,
    this.isChevronIncluded = false,
  });

  final CourseItem course;
  final bool? isChevronIncluded;

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 1,
      child: ListTile(
        contentPadding: const EdgeInsets.symmetric(
          horizontal: 10,
          // vertical: 5,
        ),
        leading: Container(
          height: 90,
          width: 80,
          decoration: BoxDecoration(
            image: DecorationImage(
              image: NetworkImage(
                '${AppConstants.uploadURL}/${course.thumbnail!}',
              ),
              fit: BoxFit.cover,
            ),
            borderRadius: BorderRadius.circular(10),
          ),
        ),
        title: Text(
          course.title!,
          maxLines: 1,
          overflow: TextOverflow.ellipsis,
        ),
        subtitle: Text(
          '${course.lesson_num} Lesson',
          style: getRegularStyle(
            color: AppColors.primaryThreeElementText,
          ),
        ),
        trailing: isChevronIncluded!
            ? const Icon(
                Icons.chevron_right,
                color: AppColors.primaryFourElementText,
              )
            : Text(
                '\$${course.price}.00',
                style: getMediumStyle(
                  color: Colors.black,
                ),
              ),
      ),
    );
  }
}
