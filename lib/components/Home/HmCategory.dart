import 'package:flutter/material.dart';
import 'package:hm_shop/viewmodels/home.dart';

class HmCategory extends StatefulWidget {
  final List<CategoryItem> categoryList;
  HmCategory({Key? key, required this.categoryList}) : super(key: key);

  @override
  _HmCategoryState createState() => _HmCategoryState();
}

List<Widget> _getCategoryList() {
  return List.generate(8, (index) {
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
          final category = widget.categoryList[index];
          return Container(
            width: 80,
            height: 100,
            alignment: Alignment.center,
            margin: EdgeInsets.symmetric(horizontal: 10),
            decoration: BoxDecoration(
              color: Color.fromARGB(255, 231, 232, 234),
              borderRadius: BorderRadius.circular(10),
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Image.network(category.picture, width: 40, height: 40,),
                Text(category.name, style: TextStyle(color: Colors.black)),
              ],
            ),
          );
        },
        itemCount: widget.categoryList.length,
        scrollDirection: Axis.horizontal,
      ),
    );
  }
}
