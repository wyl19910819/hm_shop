import 'package:flutter/material.dart';

class Mineview extends StatefulWidget {
  Mineview({Key? key}) : super(key: key);

  @override
  _MineviewState createState() => _MineviewState();
}

class _MineviewState extends State<Mineview> {
  @override
  Widget build(BuildContext context) {
    return Center(
       child: Text("我的"),
    );
  }
}