import 'package:flutter/material.dart';

class ShowDialogUtils {
  static bool _isShow = false;

  static void showMsgDialog(
    BuildContext context, {
     required String message,
    required VoidCallback ok,
    required VoidCallback cancel,
  }) {
    if (_isShow) return;
    _isShow = true;

    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text("提示"),
          content: Text(message),
          actions: [
            TextButton(
              onPressed: () {
                _isShow = false;
                ok.call();
              },
              child: Text("确定"),
            ),

            TextButton(
              onPressed: () {
                _isShow = false;
                cancel.call();
              },
              child: Text("取消"),
            ),
          ],
        );
      },
    );
  }
}
