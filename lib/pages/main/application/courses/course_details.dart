import 'dart:async';
import 'dart:io';
import 'package:edu_guru/common/models/course.dart';
import 'package:edu_guru/common/models/course_includes.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:readmore/readmore.dart';
import 'package:shimmer/shimmer.dart';
import '../../../../business_logic/course_list/course_list_cubit.dart';
import '../../../../common/theme/font_manager.dart';
import '../../../../common/theme/styles_manager.dart';
import '../../../../constants/color.dart';
import '../../widgets/course_details_image.dart';
import '../../widgets/course_include_list_tile.dart';
import '../../widgets/course_tab_header_section.dart';
import '../../widgets/shimmer_component.dart';
import '../../widgets/single_course_list_tile.dart';
import '../../widgets/title_text.dart';

class CourseDetails extends StatefulWidget {
  const CourseDetails({super.key, required this.course});

  final CourseItem course;

  @override
  State<CourseDetails> createState() => _CourseDetailsState();
}

class _CourseDetailsState extends State<CourseDetails> {
  bool isLoading = true;

  void buyCourse() {
    // Todo buy course
  }

  void goToAuthorsPage() {
    // Todo goToAuthorsPage
    print('goToAuthorsPage');
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    // just testing
    Timer(
      const Duration(seconds: 3),
      () {
        setState(() {
          isLoading = false;
        });
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    // course includes
    final List<CourseIncludes> courseIncludes = [
      CourseIncludes(
        icon: CupertinoIcons.videocam_fill,
        data: '${widget.course.video_length} Hours Video',
      ),
      CourseIncludes(
        icon: Platform.isAndroid
            ? Icons.file_open_rounded
            : CupertinoIcons.doc_chart_fill,
        data: 'Total ${widget.course.lesson_num} Hours Lesson',
      ),
      CourseIncludes(
        icon: Platform.isAndroid
            ? Icons.cloud_download
            : CupertinoIcons.cloud_download_fill,
        data: '${widget.course.video_length} Download Resource',
      ),
    ];

    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        leading: Builder(
          builder: (BuildContext context) => GestureDetector(
            onTap: () => Navigator.of(context).pop(),
            child: const Icon(Icons.chevron_left),
          ),
        ),
        title: Text(
          '${widget.course.title}',
          style: getRegularStyle(
            color: Colors.black,
          ),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 18.0),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              ShimmerComponent(
                isLoading: isLoading,
                child: CourseDetailsImage(widget: widget),
              ),
              const SizedBox(height: 15),
              ShimmerComponent(
                isLoading: isLoading,
                child: CourseTabHeaders(
                  widget: widget,
                  goToAuthorsPage: goToAuthorsPage,
                ),
              ),
              ShimmerComponent(
                isLoading: isLoading,
                child: headerTitle(title: 'Course Description'),
              ),
              ShimmerComponent(
                isLoading: isLoading,
                child: ReadMoreText(
                  widget.course.description!,
                  trimLines: 3,
                  colorClickableText: Colors.pink,
                  trimMode: TrimMode.Line,
                  trimCollapsedText: 'Show more',
                  trimExpandedText: 'Show less',
                  style: getRegularStyle(
                    color: AppColors.primaryThreeElementText,
                  ),
                  moreStyle: getMediumStyle(
                    color: AppColors.primaryThreeElementText,
                    fontSize: FontSize.s14,
                  ),
                  lessStyle: getMediumStyle(
                    color: AppColors.primaryThreeElementText,
                    fontSize: FontSize.s14,
                  ),
                ),
              ),
              const SizedBox(height: 10),
              ShimmerComponent(
                isLoading: isLoading,
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: AppColors.secondaryOpacity,
                    fixedSize: Size(MediaQuery.sizeOf(context).width, 45.h),
                  ),
                  onPressed: () => buyCourse(),
                  child: const Text('Buy Course'),
                ),
              ),
              ShimmerComponent(
                isLoading: isLoading,
                child: headerTitle(title: 'The Course Includes'),
              ),
              SizedBox(
                height: 160.h,
                child: ListView.builder(
                  itemCount: courseIncludes.length,
                  itemBuilder: (context, index) {
                    var include = courseIncludes[index];
                    return ShimmerComponent(
                      isLoading: isLoading,
                      child: CourseIncludesListTile(
                        icon: include.icon,
                        data: include.data,
                      ),
                    );
                  },
                ),
              ),
              headerTitle(title: 'Lesson List'),
              SizedBox(
                height: MediaQuery.sizeOf(context).height / 2,
                child: ListView.builder(
                  padding: EdgeInsets.zero,
                  itemCount:
                      context.read<CourseListCubit>().state.courseList.length,
                  itemBuilder: (context, index) {
                    var course =
                        context.read<CourseListCubit>().state.courseList[index];

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
                        isChevronIncluded: true,
                      ),
                    );
                  },
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
