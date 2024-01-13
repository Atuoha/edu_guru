import 'package:edu_guru/common/models/base.dart';
import 'package:edu_guru/common/models/course.dart';
import 'package:edu_guru/common/utils/http_util.dart';

class CourseAPI {
  // load course list
  static Future<CourseListResponseEntity> loadCourseList() async {
    var header = HttpUtil().getAuthorizationHeader();
    var response = await HttpUtil().get('api/courseList', headers: header);

    print(response.toString());
    return CourseListResponseEntity.fromJson(response);
  }

  // load course details
  static Future<CourseDetailResponseEntity> loadCourseDetails({required CourseRequestEntity param}) async {
    var header = HttpUtil().getAuthorizationHeader();
    var response =
        await HttpUtil().get('api/courseDetails', headers: header,queryParameter: param.toJson());

    print(response.toString());
    return CourseDetailResponseEntity.fromJson(response);
  }

  // load course details
  static Future<BaseResponseEntity> checkOutCourse({required CourseRequestEntity param}) async {
    var header = HttpUtil().getAuthorizationHeader();
    var response =
    await HttpUtil().post('api/checkOut', headers: header,queryParameter: param.toJson());

    print(response.toString());
    return BaseResponseEntity.fromJson(response);
  }
}
