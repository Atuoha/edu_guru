import 'dart:io';
import 'package:edu_guru/business_logic/course_tab_header/course_tab_header_cubit.dart';
import 'package:edu_guru/common/models/course.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:readmore/readmore.dart';
import '../../../../business_logic/course_list/course_list_cubit.dart';
import '../../../../common/theme/font_manager.dart';
import '../../../../common/theme/styles_manager.dart';
import '../../../../constants/color.dart';
import '../../widgets/course_details_image.dart';
import '../../widgets/course_include_list_tile.dart';
import '../../widgets/course_tab_header_section.dart';
import '../../widgets/single_course_list_tile.dart';
import '../../widgets/title_text.dart';

class CourseDetails extends StatefulWidget {
  const CourseDetails({super.key, required this.course});

  final CourseItem course;

  @override
  State<CourseDetails> createState() => _CourseDetailsState();
}

class _CourseDetailsState extends State<CourseDetails> {
  void buyCourse() {
    // Todo buy course
  }

  void goToAuthorsPage() {
    // Todo goToAuthorsPage
    print('goToAuthorsPage');
  }

  @override
  Widget build(BuildContext context) {
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
              CourseDetailsImage(widget: widget),
              const SizedBox(height: 15),
              CourseTabHeaders(
                widget: widget,
                goToAuthorsPage: goToAuthorsPage,
              ),
              headerTitle(title: 'Course Description'),

              ReadMoreText(
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
                lessStyle:getMediumStyle(
                  color: AppColors.primaryThreeElementText,
                  fontSize: FontSize.s14,
                ),
              ),
              const SizedBox(height: 10),
              ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: AppColors.secondaryOpacity,
                  fixedSize: Size(MediaQuery.sizeOf(context).width, 45.h),
                ),
                onPressed: () => buyCourse(),
                child: const Text('Buy Course'),
              ),
              headerTitle(title: 'The Course Includes'),
              CourseIncludesListTile(
                icon: CupertinoIcons.videocam_fill,
                data: '${widget.course.video_length} Hours Video',
              ),
              CourseIncludesListTile(
                icon: Platform.isAndroid
                    ? Icons.file_open_rounded
                    : CupertinoIcons.doc_chart_fill,
                data: 'Total ${widget.course.lesson_num} Hours Lesson',
              ),
              CourseIncludesListTile(
                icon: Platform.isAndroid
                    ? Icons.cloud_download
                    : CupertinoIcons.cloud_download_fill,
                data: '${widget.course.video_length} Download Resource',
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
