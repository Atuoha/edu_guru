import 'package:edu_guru/common/models/course_category.dart';
import 'package:flutter/material.dart';
import '../../../common/theme/styles_manager.dart';
import '../../../constants/color.dart';

class SingleCourseCategory extends StatelessWidget {
  const SingleCourseCategory({
    super.key,
    required this.courseCategory,
    required this.currentCourseCategory,
    required this.courseCategoryIndex,
  });

  final CourseCategory courseCategory;
  final int currentCourseCategory;
  final int courseCategoryIndex;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(0, 5, 5, 5),
      child: Container(
        padding: const EdgeInsets.symmetric(
          horizontal: 15,
          vertical: 5,
        ),
        decoration: BoxDecoration(
          color: currentCourseCategory == courseCategoryIndex
              ? AppColors.secondaryColor
              : Colors.transparent,
          borderRadius: BorderRadius.circular(10),
        ),
        child: Center(
          child: Text(
            courseCategory.title,
            style: getBoldStyle(
              color: currentCourseCategory == courseCategoryIndex
                  ? Colors.white
                  : AppColors.primaryThreeElementText,
            ),
          ),
        ),
      ),
    );
  }
}
