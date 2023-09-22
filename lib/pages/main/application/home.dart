import 'package:edu_guru/business_logic/carousel_slider/carousel_slider_cubit.dart';
import 'package:edu_guru/business_logic/category/category_cubit.dart';
import 'package:edu_guru/pages/main/components/course_category_section.dart';
import 'package:edu_guru/pages/main/components/search_section.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../common/models/carousel_sliders.dart';
import '../../../constants/color.dart';
import '../../../gen/assets.gen.dart';
import '../components/drawer.dart';
import '../widgets/carousel_slider.dart';
import '../widgets/drawer_opener.dart';
import '../widgets/kdot_indicator.dart';
import '../widgets/see_all_courses.dart';
import '../widgets/single_course_categories.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  TextEditingController searchController = TextEditingController();

  void setFilter() {
    // Todo set filter
  }

  void seeAllCourses() {
    // Todo see all courses
  }

  void carouselContinueFnc() {
    // Todo carousel continue fnc
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
        body: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.symmetric(
                  horizontal: 18.0,
                  vertical: 10,
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Hello John!',
                      style: TextStyle(
                        fontSize: 23.sp,
                        color: AppColors.primaryThreeElementText,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const SizedBox(height: 5),
                    Text(
                      'Welcome to Eduguru',
                      style: TextStyle(
                        color: Colors.black,
                        fontWeight: FontWeight.bold,
                        fontSize: 25.sp,
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
              BlocBuilder<CarouselSliderCubit, CarouselSliderState>(
                builder: (context, state) => Column(
                  children: [
                    KCarouselSlider(
                      carouselSliders: state.carouselSliders,
                      setCurrentCarouselIndex: context
                          .read<CarouselSliderCubit>()
                          .setCurrentCarouselIndex,
                      carouselContinueFnc: carouselContinueFnc,
                    ),
                    const SizedBox(height: 10),
                    KDotsIndicator(
                      currentCarouselIndex: state.currentCarouselIndex,
                      carouselSliders: state.carouselSliders,
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 20),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 18.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SeeAllCourses(seeAllCourses: seeAllCourses),
                    const SizedBox(height: 20),
                    CourseCategorySection(size: size),
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
