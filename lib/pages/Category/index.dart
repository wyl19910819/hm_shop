import 'package:flutter/material.dart';

class Categoryview extends StatefulWidget {
  Categoryview({Key? key}) : super(key: key);

  @override
  _CategoryviewState createState() => _CategoryviewState();
}

class _CategoryviewState extends State<Categoryview> {
  @override
  Widget build(BuildContext context) {
    return Center(
       child: Text("分类"),
    );
  }
}