import 'package:flutter/material.dart';

import '../../../common/theme/font_manager.dart';
import '../../../common/theme/styles_manager.dart';
import '../../../constants/color.dart';

class CourseIncludesListTile extends StatelessWidget {
  const CourseIncludesListTile({
    super.key,
    required this.icon,
    required this.data,
  });

  final IconData icon;
  final String data;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      contentPadding: EdgeInsets.zero,
      leading: Container(
        height: 40,
        width: 40,
        decoration: BoxDecoration(
          color: AppColors.secondaryOpacity,
          borderRadius: BorderRadius.circular(10),
        ),
        child: Center(
          child: Icon(
            icon,
            color: Colors.white,
          ),
        ),
      ),
      title: Text(
        data,
        style: getMediumStyle(
          color: AppColors.primarySecondaryElementText,
          fontSize: FontSize.s16,
        ),
      ),
    );
  }
}
