import 'package:flutter/material.dart';
import 'package:hm_shop/pages/login/index.dart';
import 'package:hm_shop/pages/main/index.dart';

Widget getRootWidget() {
  return MaterialApp(initialRoute: "/home", routes: getRootRoutes());
}

Map<String, Widget Function(BuildContext)> getRootRoutes() {
  return {
    "/login": (context) => LoginPage(), 
    "/home": (context) => MainPage()
    };
}
