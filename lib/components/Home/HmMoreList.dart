import 'package:flutter/material.dart';
import 'package:hm_shop/viewmodels/home.dart';

class HmMorelist extends StatefulWidget {
  List<GoodsItem> list;
  HmMorelist({Key? key, required this.list}) : super(key: key);

  @override
  _HmMorelistState createState() => _HmMorelistState();
}

class _HmMorelistState extends State<HmMorelist> {
  Widget _getChildren(int index) {
    // list[index]
    return Container(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(8),
            child: AspectRatio(
              aspectRatio: 1,
              child: Image.network(
                fit: BoxFit.cover,
                widget.list[index].picture,
                errorBuilder: (context, error, stackTrace) {
                  return Image.asset("lib/assets/image_bg.png");
                },
              ),
            ),
          ),
          SizedBox(height: 6),
          Text(
            "${widget.list[index].name}",
            maxLines: 2,
            overflow: TextOverflow.ellipsis,
            style: TextStyle(fontSize: 16, fontWeight: FontWeight.w700),
          ),
          SizedBox(height: 6),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Container(
                margin: EdgeInsets.symmetric(horizontal: 5),
                child: Text(
                  "¥${widget.list[index].price}",
                  maxLines: 1,
                  style: TextStyle(fontSize: 15, fontWeight: FontWeight.w900),
                ),
              ),
              Container(
                margin: EdgeInsets.symmetric(horizontal: 5),
                child: Text(
                  "${widget.list[index].orderNum}付款",
                  maxLines: 1,
                  style: TextStyle(fontSize: 13,fontWeight: FontWeight.w500),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return SliverGrid.builder(
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        mainAxisSpacing: 10,
        crossAxisSpacing: 10,
        childAspectRatio: 0.75,
      ),
      itemCount: 10,
      itemBuilder: (BuildContext context, int index) {
        return Padding(
          padding: EdgeInsets.symmetric(horizontal: 10),
          child: _getChildren(index),
        );
      },
    );
  }
}
