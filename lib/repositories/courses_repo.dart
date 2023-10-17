import 'package:edu_guru/common/apis/course_api.dart';
import 'package:edu_guru/common/models/course.dart';
import 'package:edu_guru/pages/main/widgets/flutter_toast.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import '../business_logic/course_list/course_list_cubit.dart';
import '../constants/enums/status.dart';

class CoursesRepo {
  final BuildContext context;

  CoursesRepo({required this.context});

  // init method
  Future<void> init({required int? id}) async {
    // var args  = ModalRoute.of(context)!.settings.arguments as Map<String, dynamic>;
    // var course_id = args['id'];

    print('The ID is $id');
    await asyncLoadAllData(id: id);
  }

  // async load all data
  Future<void> asyncLoadAllData({required int? id}) async {
    CourseRequestEntity courseRequestEntity = CourseRequestEntity();
    courseRequestEntity.id = id;

    var result = await CourseAPI.loadCourseDetails(param: courseRequestEntity);

    if (result.code == 200) {
      setCourseItem(courseItem: result.data!);
      print('Title: ${result.data?.title}');
      print('Price: ${result.data?.price}');
      print('Thumbnail: ${result.data?.thumbnail}');
    } else {
      toastInfo(msg: 'An error occurred!', status: Status.error);
      print('An error occurred! Code:${result.code}');
    }
  }

  // populate course list
  void setCourseItem({
    required CourseItem courseItem,
  }) {
    context.read<CourseListCubit>().setCourseItem(
          courseItem: courseItem,
        );
  }

  void checkOutCourse({required int? id}) async {
    EasyLoading.show();
    CourseRequestEntity courseRequestEntity = CourseRequestEntity();
    courseRequestEntity.id = id;

    var result = await CourseAPI.checkOutCourse(param: courseRequestEntity);
    if (result.code == 200) {
      print(result.data);
    } else {
      toastInfo(
        msg: 'An error occurred! Code: ${result.code}',
        status: Status.error,
      );

      print('An error occurred! Code: ${result.code}');
    }
  }
}
