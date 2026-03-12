import 'package:get/get_state_manager/get_state_manager.dart';
import 'package:get/state_manager.dart';
import 'package:hm_shop/viewmodels/login.dart';

class Usercontroller extends GetxController{

  var userInfo = UserInfo.fromJson({}).obs;

  updateUserInfo(UserInfo userInfo){
    this.userInfo.value = userInfo;
  }
  
}