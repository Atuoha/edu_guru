import 'package:flutter/material.dart';

class SingleCarouselSlider extends StatelessWidget {
  const SingleCarouselSlider({
    super.key,
    required this.carouselImg,
  });

  final String carouselImg;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        image: DecorationImage(
          image: AssetImage(
            carouselImg,
          ),
        ),
      ),
    );
  }
}
