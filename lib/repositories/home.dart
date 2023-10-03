import 'package:edu_guru/global_config/global.dart';
import 'package:flutter/cupertino.dart';

import '../common/models/user.dart';

class HomeRepo{
  final BuildContext context;
  HomeRepo({required this.context});
  UserItem userItem = Global.storageService.getUserProfile();

  void init(){
    print("init home repo");
    print("User Item name: ${userItem.name}");
  }

}