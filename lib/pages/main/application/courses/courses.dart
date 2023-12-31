import 'dart:io';

import 'package:edu_guru/common/routes/app_routes.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../../business_logic/carousel_slider/carousel_slider_cubit.dart';
import '../../../../business_logic/course_list/course_list_cubit.dart';
import '../../../../constants/color.dart';
import '../../components/drawer.dart';
import '../../components/search_section.dart';
import '../../widgets/course_banner.dart';
import '../../widgets/single_course_list_tile.dart';
import '../../widgets/drawer_opener.dart';
import '../../widgets/row_text.dart';
import 'course_details.dart';

class CoursesScreen extends StatefulWidget {
  const CoursesScreen({super.key});

  @override
  State<CoursesScreen> createState() => _CoursesScreenState();
}

class _CoursesScreenState extends State<CoursesScreen> {
  TextEditingController searchController = TextEditingController();

  void setFilter() {
    // Todo Filter
  }

  void seeAllCourses() {
    // Todo see all courses
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          automaticallyImplyLeading: false,
          leadingWidth: 40.w,
          leading: drawerOpener(context: context),
          title: const Text('All Courses'),
          actions: [
            Padding(
              padding: const EdgeInsets.only(right: 18),
              child: Icon(
                Platform.isAndroid
                    ? Icons.shopping_cart_outlined
                    : CupertinoIcons.shopping_cart,
                color: AppColors.secondaryColor,
              ),
            ),
          ],
        ),
        drawer: const DrawerComponent(),
        body: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.symmetric(
              horizontal: 18.0,
            ),
            child: Column(
              children: [
                CourseBanner(
                  carouselSliderItem: context
                      .read<CarouselSliderCubit>()
                      .state
                      .carouselSliders[3],
                ),
                const SizedBox(height: 15),
                SearchSection(
                  size: size,
                  searchController: searchController,
                  setFilter: setFilter,
                ),
                const SizedBox(height: 15),
                RowText(
                  title: 'All courses',
                  actionText: 'See all',
                  actionHandler: seeAllCourses,
                ),
                SizedBox(
                  height: 400.h,
                  child: ListView.builder(
                    padding: EdgeInsets.zero,
                    itemCount:
                        context.read<CourseListCubit>().state.courseList.length,
                    itemBuilder: (context, index) {
                      var course = context
                          .read<CourseListCubit>()
                          .state
                          .courseList[index];
                      return GestureDetector(
                        onTap: () => Navigator.of(context).push(
                          MaterialPageRoute(
                            builder: (context) => CourseDetails(
                              course: course,
                            ),
                          ),

                        ),

                        // onTap: () => Navigator.of(context).pushNamed(
                        //   AppRoutes.courseDetails,
                        //   arguments: {'id': course.id},
                        // ),
                        child: CourseListTile(course: course),
                      );
                    },
                  ),
                ),
                const SizedBox(height: 20),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
