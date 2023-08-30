import 'package:edu_guru/constants/color.dart';
import 'package:edu_guru/pages/main/authentication/sign_in.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  PageController pageController = PageController();
  var currentPage = 0;

  List<Widget> pages = [
    _page(
      imgUrl: 'assets/images/sp1.png',
      title: 'Page One',
      description: 'Lorem ipsum dolor sit amet consecrate adipisicing elite.',
    ),
    _page(
      imgUrl: 'assets/images/sp2.png',
      title: 'Page Two',
      description: 'Lorem ipsum dolor sit amet consecrate adipisicing elite. ',
    ),
    _page(
      imgUrl: 'assets/images/sp3.png',
      title: 'Page Three',
      description: 'Lorem ipsum dolor sit amet consecrate adipisicing elite. ',
    ),
  ];

// next slide
  void next() {
    pageController.animateToPage(
      currentPage + 1,
      duration: const Duration(milliseconds: 100),
      curve: Curves.easeIn,
    );
  }

// launch app
  void launch() {
    Navigator.of(context).pushNamedAndRemoveUntil('login', (route) => false);
  }

// skip slides
  void skip() {
    pageController.animateToPage(
      pages.length - 1,
      duration: const Duration(seconds: 1),
      curve: Curves.easeIn,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        actions: [
          currentPage != pages.length - 1
              ? TextButton(
                  onPressed: () => skip(),
                  child: const Text(
                    'Skip',
                    style: TextStyle(
                      color: Colors.grey,
                    ),
                  ),
                )
              : const SizedBox.shrink()
        ],
      ),
      body: Padding(
        padding: EdgeInsets.only(
          top: MediaQuery.paddingOf(context).top,
          left: 18,
          right: 18,
        ),
        child: PageView(
          onPageChanged: (value) {
            setState(() {
              currentPage = value;
            });
          },
          controller: pageController,
          children: pages,
        ),
      ),
      bottomSheet: Padding(
        padding: const EdgeInsets.all(10.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            SmoothPageIndicator(
              controller: pageController,
              count: pages.length,
              effect: CustomizableEffect(
                activeDotDecoration: DotDecoration(
                  width: 25,
                  height: 3,
                  color: AppColors.primaryColor,
                  borderRadius: BorderRadius.circular(20),
                ),
                dotDecoration: DotDecoration(
                  width: 25,
                  height: 3,
                  color: Colors.grey,
                  borderRadius: BorderRadius.circular(20),
                ),
              ),
            ),
            ElevatedButton(
              style: ElevatedButton.styleFrom(backgroundColor: AppColors.primaryColor),
              onPressed: () =>
                  currentPage != pages.length - 1 ? next() : launch(),
              child: Text(
                currentPage != pages.length - 1 ? 'Next' : 'Launch',
              ),
            )
          ],
        ),
      ),
    );
  }
}

// page
Widget _page({
  required String imgUrl,
  required String title,
  required String description,
}) =>
    Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        Image.asset(imgUrl),
        Text(
          title,
          textAlign: TextAlign.center,
          style: TextStyle(
            fontSize: 24.sp,
            color: Colors.black,
            fontWeight: FontWeight.w600,
          ),
        ),
        const SizedBox(height: 20),
        Text(
          description,
          textAlign: TextAlign.center,
          style: TextStyle(fontSize: 14.sp),
        ),
        const SizedBox(height: 20),
      ],
    );
