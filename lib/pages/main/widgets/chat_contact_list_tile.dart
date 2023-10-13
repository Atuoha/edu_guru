import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../common/theme/styles_manager.dart';
import '../../../constants/color.dart';
import '../../../constants/constants.dart';


class ChatContactListTile extends StatelessWidget {
  const ChatContactListTile({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: Container(
        height: 60.h,
        width: 50.w,
        decoration: BoxDecoration(
          color: AppColors.primaryFourElementText.withOpacity(0.3),
          shape: BoxShape.circle,
        ),
        child: Padding(
          padding: const EdgeInsets.all(10.0),
          child: ClipRRect(
            borderRadius: BorderRadius.circular(50),
            child: Image.network(AppConstants.defaultImg),
          ),
        ),
      ),
      title: const Text('Lorem Ipsum'),
      subtitle: Text(
        'Lorem Ipsum datum dalae vua det...',
        style: getRegularStyle(
          color: AppColors.primaryThreeElementText,
        ),
      ),
      trailing: const Icon(
        Icons.chevron_right,
        color: AppColors.primaryFourElementText,
      ),
    );
  }
}
