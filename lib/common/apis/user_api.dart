import '../models/user.dart';
import '../utils/http_util.dart';

class UserAPI {
  static Future<UserLoginResponseEntity> login({LoginRequestEntity? params}) async {
    var response = await HttpUtil().post(
      'api/register',
      queryParameter: params?.toJson(),
    );

    return UserLoginResponseEntity.fromJson(response);
  }
}
