import 'package:flutter/material.dart';

class ToastUtils {
  static bool _isShow = false;
  static void show(BuildContext context, String? msg) {
    if (_isShow) return;
    _isShow = true;
    Future.delayed(Duration(seconds: 3), () {
      _isShow = false;
    });
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        width: 180,
        duration: Duration(seconds: 3),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadiusGeometry.circular(40),
        ),
        behavior: SnackBarBehavior.floating,
        content: Text(msg ?? "", textAlign: TextAlign.center),
      ),
    );
  }
}
