import 'package:edu_guru/constants/color.dart';
import 'package:flutter/material.dart';
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
    Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        Image.asset('assets/images/sp1.png'),
        const Text(
          'Page One',
          textAlign: TextAlign.center,
          style: TextStyle(
            fontSize: 24,
            color: Colors.black,
            fontWeight: FontWeight.w600,
          ),
        ),
        const SizedBox(height: 20),
        const Text(
          'Lorem ipsum dolor sit amet consectetur adipisicing elit. Maxime mollitia molestiae quas vel',
        ),
        const SizedBox(height: 20),
      ],
    ),
    Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        Image.asset('assets/images/sp2.png'),
        const Text(
          'Page Two',
          textAlign: TextAlign.center,
          style: TextStyle(
            fontSize: 24,
            color: Colors.black,
            fontWeight: FontWeight.w600,
          ),
        ),
        const SizedBox(height: 20),
        const Text(
          'Lorem ipsum dolor sit amet consectetur adipisicing elit. Maxime mollitia molestiae quas vel',
        ),
      ],
    ),
    Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        Image.asset('assets/images/sp3.png'),
        const Text(
          'Page Three',
          textAlign: TextAlign.center,
          style: TextStyle(
            fontSize: 24,
            color: Colors.black,
            fontWeight: FontWeight.w600,
          ),
        ),
        const SizedBox(height: 20),
        const Text(
          'Lorem ipsum dolor sit amet consectetur adipisicing elit. Maxime mollitia molestiae quas vel',
        ),
      ],
    ),
  ];

  // next slide
  void next() {
    pageController.animateToPage(
      currentPage + 1,
      duration: const Duration(seconds: 1),
      curve: Curves.easeIn,
    );
  }

  // launch app
  void launch() {
    // Todo: implement launch
  }

  // skip slides
  void skip() {
    pageController.animateToPage(
      pages.length -1,
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
         currentPage != pages.length -1? TextButton(
            onPressed: () => skip(),
            child: const Text(
              'Skip',
              style: TextStyle(
                color: Colors.grey,
              ),
            ),
          ): const SizedBox.shrink()
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
                  color: primaryColor,
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
              style: ElevatedButton.styleFrom(backgroundColor: primaryColor),
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
