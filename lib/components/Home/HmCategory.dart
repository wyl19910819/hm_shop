import 'package:flutter/material.dart';

class HmCategory extends StatefulWidget {
  HmCategory({Key? key}) : super(key: key);

  @override
  _HmCategoryState createState() => _HmCategoryState();
}

List<Widget> _getCategoryList(){
  return List.generate(8, (index){
    return Text("我是第$index个");
  });
}

class _HmCategoryState extends State<HmCategory> {
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 100,
      child: ListView.builder(
        itemBuilder: (BuildContext context, int index) {
          return Column(children: _getCategoryList());
        },
        itemCount: 8,
        scrollDirection: Axis.horizontal,
      ),
    );
  }
}
