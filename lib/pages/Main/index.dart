import 'package:flutter/material.dart';
import 'package:hm_shop/pages/Cart/index.dart';
import 'package:hm_shop/pages/Category/index.dart';
import 'package:hm_shop/pages/Home/index.dart';
import 'package:hm_shop/pages/Mine/index.dart';

class MainPage extends StatefulWidget {
  MainPage({Key? key}) : super(key: key);

  @override
  _MainPageState createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  int _currentIndex = 0;

  final List<Map<String, String>> _list = [
    {
      "icon": "lib/assets/home_image.png",
      "active_icon": "lib/assets/home_image_select.png",
      "text": "首页",
    },
    {
      "icon": "lib/assets/coupon_image.png",
      "active_icon": "lib/assets/coupon_image_select.png",
      "text": "分类",
    },
    {
      "icon": "lib/assets/msg_image.png",
      "active_icon": "lib/assets/msg_image_select.png",
      "text": "购物车",
    },
    {
      "icon": "lib/assets/mine_image.png",
      "active_icon": "lib/assets/mine_image_select.png",
      "text": "我的",
    },
  ];

  List<BottomNavigationBarItem> _getBottomBarWidget() {
    return List.generate(_list.length, (index) {
      return BottomNavigationBarItem(
        icon: Image.asset(_list[index]["icon"]!, height: 30, width: 30),
        activeIcon: Image.asset(
          _list[index]["active_icon"]!,
          height: 30,
          width: 30,
        ),
        label: _list[index]["text"],
      );
    });
  }

  List<Widget> _getChildren() {
    return [HomeView(), Categoryview(), CartView(), Mineview()];
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: IndexedStack(index: _currentIndex, children: _getChildren()),
      ),
      bottomNavigationBar: BottomNavigationBar(
        onTap: (int index) {
          _currentIndex = index;
          setState(() {});
        },
        currentIndex: _currentIndex,
        items: _getBottomBarWidget(),
        selectedItemColor: Colors.blue,
        unselectedItemColor: Colors.grey,
        showUnselectedLabels: true,
      ),
      // body: SafeArea(child: BottomNavigationBar(items: _getBottomBarWidget())),
    );
  }
}
