import 'package:flutter/material.dart';
import 'package:readmore/readmore.dart';

import '../../../common/theme/font_manager.dart';
import '../../../common/theme/styles_manager.dart';
import '../../../constants/color.dart';


class CourseDescription extends StatelessWidget {
  const CourseDescription({
    super.key,
    required this.description,
  });

  final String description;

  @override
  Widget build(BuildContext context) {
    return ReadMoreText(
      description,
      trimLines: 3,
      colorClickableText: Colors.pink,
      trimMode: TrimMode.Line,
      trimCollapsedText: 'Show more',
      trimExpandedText: 'Show less',
      style: getRegularStyle(
        color: AppColors.primaryThreeElementText,
      ),
      moreStyle: getMediumStyle(
        color: AppColors.primaryThreeElementText,
        fontSize: FontSize.s14,
      ),
      lessStyle: getMediumStyle(
        color: AppColors.primaryThreeElementText,
        fontSize: FontSize.s14,
      ),
    );
  }
}
