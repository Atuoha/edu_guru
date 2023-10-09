import 'package:edu_guru/common/models/carousel_sliders.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../common/theme/font_manager.dart';
import '../../../common/theme/styles_manager.dart';

class CourseBanner extends StatelessWidget {
  const CourseBanner({
    super.key,
    required this.carouselSliderItem,
  });

  final CarouselSliderItem carouselSliderItem;

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
          height:200.h,
          decoration: BoxDecoration(
            image: DecorationImage(
              image: AssetImage(
                carouselSliderItem.imgUrl.path,
              ),
            ),
          ),
        ),
        Positioned(
          top: 35,
          left: 20,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Ongoing',
                style: getBoldStyle(
                  color: Colors.white,
                ),
              ),
              const SizedBox(height: 20),
              FittedBox(
                child: Text(
                  carouselSliderItem.title,
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                  style: getHeadingStyle(
                    color: Colors.white,
                    fontSize: FontSize.s14.sp,
                  ),
                ),
              ),
              const SizedBox(height: 7),
              Text(
                carouselSliderItem.dataSubtitle,
                style: getBoldStyle(
                  color: Colors.white,
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
