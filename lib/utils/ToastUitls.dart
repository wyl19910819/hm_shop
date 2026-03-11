import 'package:flutter/material.dart';

class ToastUtils {
  static void show(BuildContext context, String? msg) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        width: 120,
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
