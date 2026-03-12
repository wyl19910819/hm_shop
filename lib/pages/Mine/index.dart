import 'package:flutter/material.dart';
import 'package:hm_shop/api/home.dart';
import 'package:hm_shop/components/Mine/HmMineMoreList.dart';
import 'package:hm_shop/viewmodels/home.dart';

class Mineview extends StatefulWidget {
  Mineview({Key? key}) : super(key: key);

  @override
  _MineviewState createState() => _MineviewState();
}

class _MineviewState extends State<Mineview> {
  Result _goodsList = Result(id: '', title: '', subTypes: []);

  Widget _getHeader() {
    return GestureDetector(
      onTap: () {
        Navigator.pushNamed(context, "/login");
      },
      child: Container(
        margin: EdgeInsets.only(top: 50),
        child: Row(
          children: [
            Image.asset("lib/assets/icon_head.png", width: 40, height: 40),
            SizedBox(width: 20),
            Text(
              "立即登录",
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.w800),
            ),
          ],
        ),
      ),
    );
  }

  final List<Map<String, String>> _list = [
    {
      "icon": "lib/assets/home_image.png",
      "active_icon": "lib/assets/home_image_select.png",
      "text": "我的订单",
    },
    {
      "icon": "lib/assets/coupon_image.png",
      "active_icon": "lib/assets/coupon_image_select.png",
      "text": "待付款",
    },
    {
      "icon": "lib/assets/msg_image.png",
      "active_icon": "lib/assets/msg_image_select.png",
      "text": "待发货",
    },
    {
      "icon": "lib/assets/mine_image.png",
      "active_icon": "lib/assets/mine_image_select.png",
      "text": "待收货",
    },
    {
      "icon": "lib/assets/coupon_image.png",
      "active_icon": "lib/assets/coupon_image_select.png",
      "text": "待评价",
    },
  ];

  Widget _getMenu() {
    return Container(
      height: 120,
      padding: EdgeInsets.all(10),
      width: double.infinity,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        color: Colors.white,
      ),
      child: Column(
        mainAxisSize: MainAxisSize.max,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            "我的订单",
            style: TextStyle(
              color: Colors.black,
              fontWeight: FontWeight.bold,
              fontSize: 16,
            ),
          ),
          SizedBox(height: 10),
          Flex(
            direction: Axis.horizontal,
            children: List.generate(_list.length, (index) {
              return Expanded(
                child: Column(
                  children: [
                    Image.asset(
                      _list[index]["icon"]!,
                      height: 30,
                      width: 30,
                      fit: BoxFit.cover,
                    ),
                    SizedBox(height: 10),
                    Text(_list[index]["text"]!),
                  ],
                ),
              );
            }),
          ),
        ],
      ),
    );
  }

  Future<void> _getProductList() async {
    _goodsList = await getGoodsListApI();
  }

  @override
  void initState() {
    super.initState();
    _getProductList();
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Color.fromARGB(240, 240, 240, 240),
      padding: EdgeInsets.all(30),
      child: CustomScrollView(
        slivers: [
          SliverToBoxAdapter(child:_getHeader()),
          SliverToBoxAdapter(child:SizedBox(height: 20)),
          SliverToBoxAdapter(child: _getMenu()),
          SliverToBoxAdapter(child:SizedBox(height: 20)),
          HmMineMorelist(list: _getGoodsList()),
        ],
      ),
    );
  }

  List<GoodsItem> _getGoodsList() {
    if (_goodsList.subTypes.isEmpty) {
      return [];
    }
    return _goodsList.subTypes.first.goodsItems.items;
  }
}
