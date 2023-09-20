import 'package:flutter/material.dart';
import '../../../common/theme/styles_manager.dart';
import '../../../constants/color.dart';

class SingleCourseTag extends StatelessWidget {
  const SingleCourseTag({
    super.key,
    required this.courseTag,
    required this.currentCourseTag,
    required this.courseTagIndex,
  });

  final String courseTag;
  final int currentCourseTag;
  final int courseTagIndex;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(5.0),
      child: Container(
        padding: const EdgeInsets.symmetric(
          horizontal: 15,
          vertical: 5,
        ),
        decoration: BoxDecoration(
          color: currentCourseTag == courseTagIndex
              ? AppColors.secondaryColor
              : Colors.transparent,
          borderRadius: BorderRadius.circular(10),
        ),
        child: Center(
          child: Text(
            courseTag,
            style: getBoldStyle(
              color: currentCourseTag == courseTagIndex
                  ? Colors.white
                  : AppColors.primaryThreeElementText,
            ),
          ),
        ),
      ),
    );
  }
}
