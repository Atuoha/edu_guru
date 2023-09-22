import 'package:carousel_slider/carousel_slider.dart';
import 'package:edu_guru/pages/main/widgets/single_carousel_item.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../common/models/carousel_sliders.dart';

class KCarouselSlider extends StatelessWidget {
  const KCarouselSlider(
      {super.key,
      required this.carouselSliders,
      required this.setCurrentCarouselIndex,
      required this.carouselContinueFnc});

  final List<CarouselSliderItem> carouselSliders;
  final Function setCurrentCarouselIndex;
  final Function carouselContinueFnc;

  @override
  Widget build(BuildContext context) {
    return CarouselSlider.builder(
      itemCount: carouselSliders.length,
      itemBuilder: (context, index, i) => SingleCarouselSlider(
        carouselSliderItem: carouselSliders[index],
        carouselContinueFnc: carouselContinueFnc,
      ),
      options: CarouselOptions(
        onPageChanged: (int index, CarouselPageChangedReason a) =>
            setCurrentCarouselIndex(index),
        viewportFraction: 0.8,
        height: 200.h,
        autoPlay: true,
        enlargeCenterPage: true,
      ),
    );
  }
}
