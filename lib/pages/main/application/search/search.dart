import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../../business_logic/course_list/course_list_cubit.dart';
import '../../../../constants/color.dart';
import '../../components/drawer.dart';
import '../../components/search_section.dart';
import '../../widgets/drawer_opener.dart';
import '../../widgets/row_text.dart';
import '../../widgets/single_course_list_tile.dart';
import '../courses/course_details.dart';

class SearchScreen extends StatefulWidget {
  const SearchScreen({super.key});

  @override
  State<SearchScreen> createState() => _SearchScreenState();
}

class _SearchScreenState extends State<SearchScreen> {
  TextEditingController searchController = TextEditingController();

  void setFilter() {
    // Todo filter
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
          leadingWidth: 40.w,
          leading: drawerOpener(context: context),
          title: const Text('Search Course'),
          actions: [
            Padding(
              padding: const EdgeInsets.only(right: 18),
              child: Icon(
                Platform.isAndroid
                    ? Icons.notifications_outlined
                    : CupertinoIcons.bell_circle,
                color: AppColors.secondaryColor,
              ),
            ),
          ],
        ),
        drawer: buildDrawer(),
        body: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 18.0),
          child: SingleChildScrollView(
            child: Column(
              children: [
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
                  height: MediaQuery.sizeOf(context).height / 1.3,
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
                        child: CourseListTile(
                          course: course,
                          isSearchPage: true,
                        ),
                      );
                    },
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
