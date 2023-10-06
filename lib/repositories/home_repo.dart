import 'package:edu_guru/common/apis/course_api.dart';
import 'package:edu_guru/global_config/global.dart';
import 'package:flutter/cupertino.dart';

import '../common/models/user.dart';

class HomeRepo{
  final BuildContext context;
  HomeRepo({required this.context});
  UserItem userItem = Global.storageService.getUserProfile();

  void init()async{
    var result  = await CourseAPI.loadCourseList();
    // if(result.code == 200){
    //   print("The result is ${result.msg}");
    // }else{
    //   print('An error occurred!');
    // }


  }

}