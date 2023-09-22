import 'package:dots_indicator/dots_indicator.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../common/models/carousel_sliders.dart';
import '../../../constants/color.dart';


class KDotsIndicator extends StatelessWidget {
  const KDotsIndicator({
    super.key,
    required this.currentCarouselIndex,
    required this.carouselSliders,
  });

  final int currentCarouselIndex;
  final List<CarouselSliderItem> carouselSliders;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: DotsIndicator(
        position: currentCarouselIndex,
        dotsCount: carouselSliders.length,
        decorator: DotsDecorator(
          color: AppColors.primaryFourElementText,
          activeColor: AppColors.primaryColor,
          size:  Size.square(4.0.h),
          activeSize:  Size(18.0.h, 5.0.h),
          activeShape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(3.0),
          ),
          spacing: const EdgeInsets.only(right: 4),
        ),
      ),
    );
  }
}
