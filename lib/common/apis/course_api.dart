import 'package:edu_guru/common/models/course.dart';
import 'package:edu_guru/common/utils/http_util.dart';

class CourseAPI {
  static Future loadCourseList() async {
    var header = HttpUtil().getAuthorizationHeader();
    var response = await HttpUtil().get('api/courseList', headers: header);

    print(response.toString());
    // return CourseListResponseEntity.fromJson(response);
  }
}
