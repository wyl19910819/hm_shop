import 'package:hm_shop/constants/index.dart';
import 'package:hm_shop/utils/DioRequest.dart';
import 'package:hm_shop/viewmodels/login.dart';

Future<UserInfo> loginAPI(Map<String, dynamic> params) async {
  return UserInfo.fromJson(await dioRequest.post(HttpConstants.LOGIN,params:params));
}
