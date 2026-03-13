import 'package:flutter/material.dart';

class LoadingDialog {
  static void showLoadingDialog(BuildContext context, {String msg = "加载中..."}) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return Dialog(
          backgroundColor: Colors.transparent,
          child: Center(
            child: Container(
              padding: EdgeInsets.all(20),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(10),
              ),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  CircularProgressIndicator(),
                  SizedBox(height: 10),
                  Text(msg),
                ],
              ),
            ),
          ),
        );
      },
    );
  }

  static void hideLoadingDialog(BuildContext context) {
    Navigator.pop(context);
  }
}
