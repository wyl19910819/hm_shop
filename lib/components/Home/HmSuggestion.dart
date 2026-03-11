import 'package:flutter/material.dart';
import 'package:hm_shop/viewmodels/home.dart';

class HmSuggestion extends StatefulWidget {
  final Result goodsList;
  HmSuggestion({Key? key, required this.goodsList}) : super(key: key);

  @override
  _HmSuggestionState createState() => _HmSuggestionState();
}

class _HmSuggestionState extends State<HmSuggestion> {
  List<GoodsItem> _getDisplayItem() {
    if(widget.goodsList.subTypes.isEmpty) return [];
    return widget.goodsList.subTypes.first.goodsItems.items.take(3).toList();
  }

  Widget _getSpecialTop() {
    return Row(
      children: [
        Text(
          "特惠推荐",
          style: TextStyle(
            color: Colors.orange,
            fontWeight: FontWeight.w900,
            fontSize: 20,
          ),
        ),
        SizedBox(width: 10),
        Text(
          "精选省攻略",
          style: TextStyle(color: Colors.orangeAccent, fontSize: 18),
        ),
      ],
    );
  }

  Widget _getSpecialLeft() {
    return Image.asset("lib/assets/goods1.jpg", width: 100, height: 140);
  }

  List<Widget> _getSpecialRight() {
    List list = _getDisplayItem();
    print("list:$list\n");
    return List.generate(list.length, (int index) {
      return Container(
        child: Column(
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(10),
              child: Image.network(
              list[index].picture,
              width: 100,
              height: 140,
              fit: BoxFit.cover,
            ),
            ),
            SizedBox(height: 15,),
            Container(
              padding: EdgeInsets.symmetric(horizontal: 10),
              decoration: BoxDecoration(borderRadius: BorderRadius.circular(10),color: Colors.deepOrangeAccent),
              child: Text("¥${list[index].price}",style: TextStyle(color: Colors.white),),
            )
          ],
        ),
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 10),
      child: Container(
        padding: EdgeInsets.all(10),
        height: 250,
        alignment: Alignment.center,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(12),
          image: DecorationImage(
            image: AssetImage("lib/assets/image_bg.png"),
            fit: BoxFit.cover,
          ),
        ),
        child: Column(
          children: [
            _getSpecialTop(),
            SizedBox(height: 20),
            Row(
              children: [
                _getSpecialLeft(),
                Expanded(child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: _getSpecialRight(),
                ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
