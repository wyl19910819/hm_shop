import 'package:flutter/material.dart';
import 'package:flutter/src/rendering/sliver.dart';
import 'package:flutter/src/rendering/sliver_grid.dart';
import 'package:hm_shop/api/home.dart';
import 'package:hm_shop/components/Home/HmCategory.dart';
import 'package:hm_shop/components/Home/HmHot.dart';
import 'package:hm_shop/components/Home/HmMoreList.dart';
import 'package:hm_shop/components/Home/HmSlider.dart';
import 'package:hm_shop/components/Home/HmSuggestion.dart';
import 'package:hm_shop/constants/index.dart';
import 'package:hm_shop/utils/DioRequest.dart';
import 'package:hm_shop/utils/ToastUitls.dart';
import 'package:hm_shop/viewmodels/home.dart';

class HomeView extends StatefulWidget {
  HomeView({Key? key}) : super(key: key);

  @override
  _HomeViewState createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  ScrollController _scrollController = ScrollController();
  List<BannerItem> _bannarList = [];
  List<CategoryItem> _categoryList = [];
  // 特惠推荐
  Result _goodsList = Result(id: '', title: '', subTypes: []);
  Result _hotList = Result(id: '', title: '', subTypes: []);
  Result _oneStopList = Result(id: '', title: '', subTypes: []);
  List<GoodDetailItem> _gooodsDetailList = [];

  @override
  void initState() {
    super.initState();
    _registerEvent();
    Future.microtask(() {
      _top = 100;
      _key.currentState?.show();
    });
  }

  Future<void> _getBannerList() async {
    _bannarList = await getBannerListApI();
  }

  // 获取分类列表
  Future<void> _getCategoryList() async {
    _categoryList = await getCategoryListApI();
  }

  Future<void> _getProductList() async {
    _goodsList = await getGoodsListApI();
  }

  Future<void> _getHotList() async {
    _hotList = await getHotListApI();
  }

  Future<void> _getOneStopList() async {
    _oneStopList = await getOneStopList();
  }

  Future<void> _getMoreProductList() async {
    _gooodsDetailList = await getMoreProductList({"limit": 10});
  }

  Future<void> _refresh() async {
    setState(() {});
    await _getBannerList();
    await _getCategoryList();
    await _getProductList();
    await _getHotList();
    // await _getOneStopList();
    // await _getMoreProductList();
    _top = 0;
    setState(() {});
    ToastUtils.show(context, "刷新成功");
  }

  GlobalKey<RefreshIndicatorState> _key = GlobalKey<RefreshIndicatorState>();

  //  List<BannerItem> _bannarList = [
  //   BannerItem(
  //     id: "1",
  //     imageUrl:
  //         "http://yjy-teach-oss.oss-cn-beijing.aliyuncs.com/meituan/1.jpg",
  //   ),
  //   BannerItem(
  //     id: "2",
  //     imageUrl:
  //         "http://yjy-teach-oss.oss-cn-beijing.aliyuncs.com/meituan/3.jpg",
  //   ),
  //   BannerItem(
  //     id: "3",
  //     imageUrl:
  //         "http://yjy-teach-oss.oss-cn-beijing.aliyuncs.com/meituan/1.jpg",
  //   ),
  // ];
  //  (hotList:_hotList,oneStopList:_oneStopList)

  Widget _getRecommendChild() {
    return Flex(
      direction: Axis.horizontal,
      children: [
        Expanded(
          child: HmHot(list: _hotList, type: HmHot.hot),
        ),
        Expanded(
          child: HmHot(list: _hotList, type: HmHot.one_stop),
        ),
      ],
    );
  }

  List<Widget> _getScrollViewChildren() {
    return [
      SliverToBoxAdapter(child: HmSlider(bannarList: _bannarList)),
      SliverToBoxAdapter(child: SizedBox(height: 10)),
      SliverToBoxAdapter(child: HmCategory(categoryList: _categoryList)),
      SliverToBoxAdapter(child: SizedBox(height: 10)),
      SliverToBoxAdapter(child: HmSuggestion(goodsList: _goodsList)),
      SliverToBoxAdapter(child: SizedBox(height: 10)),
      SliverToBoxAdapter(child: _getRecommendChild()),
      SliverToBoxAdapter(child: SizedBox(height: 10)),
      HmMorelist(list: _getGoodsList()),
    ];
  }

  List<GoodsItem> _getGoodsList() {
    if (_goodsList.subTypes.isEmpty) {
      return [];
    }
    return _goodsList.subTypes.first.goodsItems.items;
  }

  void _registerEvent() {
    _scrollController.addListener(() {
      if (_scrollController.position.pixels ==
          _scrollController.position.maxScrollExtent - 50) {
        // 上拉加载更多
        print("滚动了");
      }
    });
  }

  double _top = 0;

  @override
  Widget build(BuildContext context) {
    return RefreshIndicator(
      key: _key,
      onRefresh: _refresh,
      child: AnimatedContainer(
        padding: EdgeInsets.only(top: _top),
        duration: Duration(milliseconds: 300),
        child: CustomScrollView(
          slivers: _getScrollViewChildren(),
          controller: _scrollController,
        ),
      ),
    );
  }
}
