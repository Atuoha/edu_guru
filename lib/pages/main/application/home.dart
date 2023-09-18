import 'package:carousel_slider/carousel_slider.dart';
import 'package:dots_indicator/dots_indicator.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../common/models/carousel_sliders.dart';
import '../../../constants/color.dart';
import '../../../gen/assets.gen.dart';
import '../components/drawer.dart';
import '../widgets/drawer_opener.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  List<CarouselSliderItem> carouselSliders = [
    CarouselSliderItem(id: 1, imgUrl: Assets.icons.image1),
    CarouselSliderItem(id: 2, imgUrl: Assets.icons.image2),
    CarouselSliderItem(id: 3, imgUrl: Assets.icons.image3),
    CarouselSliderItem(id: 4, imgUrl: Assets.icons.image4),
  ];

  int currentCarouselIndex = 0;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          leadingWidth: 30.w,
          leading: drawerOpener(context: context),
          actions: [
            Padding(
              padding: const EdgeInsets.only(right: 18),
              child: Image.asset(
                Assets.icons.b02.path,
                width: 30.w,
              ),
            ),
          ],
        ),
        drawer: buildDrawer(),
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Padding(
              padding: EdgeInsets.symmetric(
                horizontal: 18.0,
                vertical: 10,
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Hello,',
                    style: TextStyle(
                      fontSize: 20,
                      color: AppColors.primaryThreeElementText,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  SizedBox(height: 5),
                  Text(
                    'Welcome to Eduguru',
                    style: TextStyle(
                      color: Colors.black,
                      fontWeight: FontWeight.bold,
                      fontSize: 25,
                    ),
                  ),
                ],
              ),
            ),
            CarouselSlider.builder(
              itemCount: carouselSliders.length,
              itemBuilder: (context, index, i) =>
                  singleCarouselItem(index: index),
              options: CarouselOptions(
                onPageChanged: (int index, CarouselPageChangedReason a) =>
                    setState(() {
                  currentCarouselIndex = index;
                }),
                viewportFraction: 0.8,
                height: 200,
                autoPlay: true,
                enlargeCenterPage: true,
              ),
            ),
            const SizedBox(height: 10),
            Center(
              child: DotsIndicator(
                position: currentCarouselIndex,
                dotsCount: carouselSliders.length,
                decorator: const DotsDecorator(
                  color: AppColors.primaryFourElementText,
                  activeColor: AppColors.primaryColor,
                ),
              ),
            )
          ],
        ),
      ),
    );
  }

  // single carousel item
  Container singleCarouselItem({required int index}) {
    return Container(
      decoration: BoxDecoration(
        image: DecorationImage(
          image: AssetImage(
            carouselSliders[index].imgUrl.path,
          ),
        ),
      ),
    );
  }
}
