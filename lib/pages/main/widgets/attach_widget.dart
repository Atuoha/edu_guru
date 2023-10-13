import 'package:edu_guru/common/theme/styles_manager.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../constants/color.dart';

class AttachWidget extends StatelessWidget {
  const AttachWidget({
    super.key,
    required this.function,
    required this.icon,
    required this.title,
  });

  final Function function;
  final IconData icon;
  final String title;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => function(),
      child: Column(
        children: [
          Container(
            height: 50.h,
            width: 50.h,
            padding: const EdgeInsets.all(8),
            decoration: const BoxDecoration(
              shape: BoxShape.circle,
              color: Colors.white,
            ),
            child: Icon(
              icon,
              color: AppColors.primaryColor,
            ),
          ),
          const SizedBox(height: 10),
          Text(
            title,
            style: getRegularStyle(
              color: Colors.white,
            ),
          )
        ],
      ),
    );
  }
}
