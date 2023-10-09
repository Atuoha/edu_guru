import 'package:flutter/material.dart';

import '../../../common/theme/font_manager.dart';
import '../../../common/theme/styles_manager.dart';
import '../../../constants/color.dart';

class RowText extends StatelessWidget {
  const RowText(
      {super.key, required this.actionHandler, required this.title, required this.actionText,});

  final Function actionHandler;
  final String title;
  final String actionText;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          title,
          style: getMediumStyle(
            color: Colors.black,
            fontSize: FontSize.s16,
          ),
        ),
        GestureDetector(
          onTap: () => actionHandler(),
          child: Text(
            actionText,
            style: getRegularStyle(
              color: AppColors.primaryThreeElementText,
            ),
          ),
        )
      ],
    );
  }
}
