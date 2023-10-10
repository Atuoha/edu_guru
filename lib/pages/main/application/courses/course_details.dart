import 'dart:io';

import 'package:edu_guru/business_logic/course_tab_header/course_tab_header_cubit.dart';
import 'package:edu_guru/common/models/course.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../../common/models/course_tab_header.dart';
import '../../../../common/theme/font_manager.dart';
import '../../../../common/theme/styles_manager.dart';
import '../../../../constants/color.dart';
import '../../widgets/course_details_image.dart';
import '../../widgets/course_include_list_tile.dart';
import '../../widgets/course_tab_header.dart';
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
              const SizedBox(height: 20),
              SizedBox(
                height: 35.h,
                width: double.infinity,
                child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  itemCount: context
                      .read<CourseTabHeaderCubit>()
                      .state
                      .tabHeaders
                      .length,
                  itemBuilder: (context, index) {
                    var item = courseTabHeaders[index];
                    return GestureDetector(
                      onTap: () => context
                          .read<CourseTabHeaderCubit>()
                          .setNewTabHeaderIndex(index: index),
                      child: courseTabHeader(
                        index: index,
                        title: item.title!,
                        icon: item.icon,
                        number: index == 1
                            ? '${widget.course.follow}'
                            : '${widget.course.score}',
                        context: context,
                      ),
                    );
                  },
                ),
              ),
              headerTitle(title: 'Course Description'),
              Text(
                widget.course.description!,
                style: getRegularStyle(
                  color: AppColors.primaryThreeElementText,
                ),
              ),
              const SizedBox(height: 30),
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
                icon:Platform.isAndroid? Icons.file_open_rounded:  CupertinoIcons.doc_chart_fill,
                data: 'Total ${widget.course.lesson_num} Hours Lesson',
              ),
              CourseIncludesListTile(
                icon:Platform.isAndroid? Icons.cloud_download: CupertinoIcons.cloud_download_fill,
                data: '${widget.course.video_length} Download Resource',
              ),
              headerTitle(title: 'Lesson List'),


            ],
          ),
        ),
      ),
    );
  }
}
