import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hm_shop/api/user.dart';
import 'package:hm_shop/stores/TokenManager.dart';
import 'package:hm_shop/stores/UserController.dart';
import 'package:hm_shop/utils/ToastUitls.dart';
import 'package:hm_shop/viewmodels/login.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  bool? _isChecked = false;
  GlobalKey<FormState> _globalKey = GlobalKey();
  TextEditingController _phoneController = TextEditingController();
  TextEditingController _passwordController = TextEditingController();
  UserInfo _userInfo = UserInfo(
    id: '',
    account: '',
    mobile: '',
    token: '',
    avatar: '',
    nickname: '',
    gender: '',
    birthday: '',
    cityCode: '',
    provinceCode: '',
    profession: '',
  );
  Usercontroller _usercontroller = Get.find();

  Future<void> _login() async {
    try {
      _userInfo = await loginAPI({
        "account": _phoneController.text,
        "password": _passwordController.text,
      });
      ToastUtils.show(context, "登录成功:${_userInfo.nickname}");
      _usercontroller.updateUserInfo(_userInfo);
      tokenManager.setToken(_userInfo.token);
      Navigator.pop(context);
    } catch (e) {
      ToastUtils.show(context, "登录失败：${(e as DioException).message}");
    }
  }

  @override
  Widget build(BuildContext context) {
    // 核心修复：用 Scaffold 包裹，提供 Material 环境
    double screenWidth = MediaQuery.of(context).size.width;
    return Scaffold(
      appBar: AppBar(title: const Text("登录")),
      body: Form(
        key: _globalKey,
        child: Container(
          padding: const EdgeInsets.all(20),
          child: Column(
            children: [
              Container(
                alignment: Alignment.centerLeft,
                padding: EdgeInsets.all(10),
                child: Text(
                  "账号密码登录",
                  style: TextStyle(
                    color: Colors.black,
                    fontWeight: FontWeight.bold,
                    fontSize: 16,
                  ),
                ),
              ),
              TextFormField(
                controller: _phoneController,
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return "手机号不能为空";
                  }
                  if (!RegExp(r"^1[3-9]\d{9}$").hasMatch(value)) {
                    return "手机号码格式不正确";
                  }
                  return null;
                },
                decoration: InputDecoration(
                  fillColor: Colors.white,
                  filled: true,
                  hintText: "请输入账号",
                  border: OutlineInputBorder(
                    borderSide: BorderSide.none,
                    borderRadius: BorderRadius.circular(10),
                  ),
                ),
              ),
              const SizedBox(height: 16),
              TextFormField(
                controller: _passwordController,
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return "密码不能为空";
                  }
                  if (!RegExp(r"^[A-Za-z0-9_]{6,16}$").hasMatch(value)) {
                    return "密码格式不正确";
                  }
                  return null;
                },
                obscureText: true,
                decoration: InputDecoration(
                  fillColor: Colors.white,
                  filled: true,
                  hintText: "请输入密码",
                  border: OutlineInputBorder(
                    borderSide: BorderSide.none,
                    borderRadius: BorderRadius.circular(10),
                  ),
                ),
              ),
              const SizedBox(height: 10),
              Container(
                child: Row(
                  children: [
                    Checkbox(
                      side: BorderSide(color: Colors.grey, width: 2.0),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadiusGeometry.circular(10),
                      ),
                      activeColor: Colors.black,
                      checkColor: Colors.white,
                      value: _isChecked,
                      onChanged: (bool? flag) {
                        print("onChanged:$flag");
                        _isChecked = flag;
                        setState(() {});
                      },
                    ),
                    Text.rich(
                      TextSpan(
                        text: "查看协议",
                        children: [
                          TextSpan(
                            text: "账号隐私",
                            style: TextStyle(color: Colors.blue),
                          ),
                          TextSpan(
                            text: "和",
                            style: TextStyle(color: Colors.black),
                          ),
                          TextSpan(
                            text: "隐私协议",
                            style: TextStyle(color: Colors.blue),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),

              const SizedBox(height: 24),

              SizedBox(
                height: 50,
                width: screenWidth,
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.indigo,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadiusGeometry.circular(10),
                    ),
                  ),
                  onPressed: () {
                    if (_globalKey.currentState!.validate()) {
                      if (_isChecked == true) {
                        _login();
                      } else {
                        ToastUtils.show(context, "请同意隐私协议");
                      }
                    }
                  },
                  child: const Text(
                    "登录",
                    style: TextStyle(color: Colors.white),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
