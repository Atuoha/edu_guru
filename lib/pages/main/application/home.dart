import 'package:carousel_slider/carousel_slider.dart';
import 'package:dots_indicator/dots_indicator.dart';
import 'package:edu_guru/common/theme/styles_manager.dart';
import 'package:edu_guru/pages/main/components/search_section.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../common/models/carousel_sliders.dart';
import '../../../common/theme/font_manager.dart';
import '../../../constants/color.dart';
import '../../../gen/assets.gen.dart';
import '../components/drawer.dart';
import '../widgets/carousel_slider.dart';
import '../widgets/drawer_opener.dart';
import '../widgets/kdot_indicator.dart';
import '../widgets/see_all_courses.dart';
import '../widgets/single_course_tag.dart';

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
  TextEditingController searchController = TextEditingController();

  final List<String> courseTags = ['All', 'Popular', 'Newest'];
  int currentCourseTagIndex = 0;

  void setCourseTag(int courseTagIndex) {
    setState(() {
      currentCourseTagIndex = courseTagIndex;
    });
  }

  void setCurrentCarouselIndex(int carouselIndex) {
    setState(() {
      currentCarouselIndex = carouselIndex;
    });
  }

  void setFilter() {
    // Todo set filter
  }

  void seeAllCourses() {
    // Todo see all courses
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.sizeOf(context);

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
                      fontSize: 23,
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
            const SizedBox(height: 10),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 18.0),
              child: SearchSection(
                size: size,
                searchController: searchController,
                setFilter: setFilter,
              ),
            ),
            const SizedBox(height: 10),
            KCarouselSlider(
              carouselSliders: carouselSliders,
              setCurrentCarouselIndex: setCurrentCarouselIndex,
            ),
            const SizedBox(height: 10),
            KDotsIndicator(
              currentCarouselIndex: currentCarouselIndex,
              carouselSliders: carouselSliders,
            ),
            const SizedBox(height: 20),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 18.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SeeAllCourses(seeAllCourses: seeAllCourses),
                  const SizedBox(height: 20),
                  SizedBox(
                    height: size.height / 23,
                    child: ListView.builder(
                      itemCount: courseTags.length,
                      scrollDirection: Axis.horizontal,
                      itemBuilder: (context, index) => GestureDetector(
                        onTap: () => setCourseTag(index),
                        child: SingleCourseTag(
                          courseTag: courseTags[index],
                          currentCourseTag: currentCourseTagIndex,
                          courseTagIndex: index,
                        ),
                      ),
                    ),
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
