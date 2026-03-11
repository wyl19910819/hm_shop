import 'package:flutter/material.dart';
import 'package:hm_shop/viewmodels/home.dart';

class HmHot extends StatefulWidget {
  static String hot = "HOT";
  static String one_stop = "ONE_STOP";

  Result list;
  String type;

  HmHot({Key? key, required this.list, required this.type}) : super(key: key);

  @override
  _HmHotState createState() => _HmHotState();
}

class _HmHotState extends State<HmHot> {
  List<GoodsItem> get _items {
    if (widget.list.subTypes.isEmpty) {
      return [];
    }
    return widget.list.subTypes.first.goodsItems.items.take(2).toList();
  }

  Widget _getHotWidgetTitle() {
    return Container(
      child: Row(
        children: [
          Text(
            widget.type == HmHot.hot ? "爆款推荐" : "一站买全",
            style: TextStyle(
              color: Color.fromARGB(255, 86, 24, 20),
              fontSize: 18,
              fontWeight: FontWeight.w700,
            ),
          ),
          SizedBox(width: 10),
          Text(
            widget.type == HmHot.hot ? "最受欢迎" : "精心优选",
            style: TextStyle(color: Color.fromARGB(255, 124, 63, 58)),
          ),
        ],
      ),
    );
  }

  Widget _getContent() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: List.generate(_items.length, (index) {
        return Column(
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(10),
              child: Image.network(
                _items[index].picture,
                width: 80,
                height: 100,
                fit: BoxFit.cover,
                errorBuilder: (context, error, stackTrace) {
                  return Image.asset(
                    "lib/assets/image_bg.png",
                    width: 80,
                    height: 100,
                  );
                },
              ),
            ),
            SizedBox(height: 15),
            Container(
              padding: EdgeInsets.symmetric(horizontal: 10),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                color: Colors.deepOrangeAccent,
              ),
              child: Text(
                "¥${_items[index].price}",
                style: TextStyle(color: Colors.white),
              ),
            ),
          ],
        );
      }),
    );
  }

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    return Container(
      decoration: BoxDecoration(
        color: (widget.type == HmHot.hot)
            ? Color.fromARGB(255, 249, 247, 219)
            : Color.fromARGB(255, 211, 228, 240),
        borderRadius: BorderRadius.circular(10),
      ),
      margin: EdgeInsets.all(10),
      padding: EdgeInsets.all(10),
      width: screenWidth,
      child: Column(
        children: [_getHotWidgetTitle(), SizedBox(height: 10), _getContent()],
      ),
    );
  }
}
