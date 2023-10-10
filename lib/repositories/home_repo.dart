import 'package:edu_guru/business_logic/course_list/course_list_cubit.dart';
import 'package:edu_guru/common/apis/course_api.dart';
import 'package:edu_guru/global_config/global.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../common/models/course.dart';
import '../common/models/custom_error.dart';
import '../common/models/user.dart';

class HomeRepo {
  final BuildContext context;

  HomeRepo({required this.context});

  UserItem userItem = Global.storageService.getUserProfile();

  void init() async {
    var result = await CourseAPI.loadCourseList();
    if (result.code == 200) {
      // final List<CourseItem> courseList = [];
      //
      // for (var item in result.data!) {
      //   CourseItem courseItem = CourseItem(
      //     id: item.id,
      //     title: item.title,
      //     description: item.description,
      //     price: item.price,
      //     thumbnail: item.thumbnail,
      //     video: item.video,
      //     lesson_num: item.lesson_num,
      //     video_length: item.video_length,
      //     follow: item.follow,
      //     score: item.score,
      //   );
      //   courseList.add(courseItem);
      // }
      populateCourseList(courseList: result.data!);
    } else {
      emitError(
        error: CustomError(
          errorMsg: 'An error occurred! ${result.msg}',
          code: result.code.toString(),
          plugin: '',
        ),
      );

      print('An error occurred! ${result.msg}');
    }
  }

  // populate course list
  void populateCourseList({required List<CourseItem> courseList}) {
    context.read<CourseListCubit>().populateCourseList(
          courseList: courseList,
        );
  }

  // emit error
  void emitError({required CustomError error}) {
    context.read<CourseListCubit>().emitError(error: error);
  }
}
