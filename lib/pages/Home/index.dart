import 'package:flutter/material.dart';
import 'package:hm_shop/api/home.dart';
import 'package:hm_shop/components/Home/HmCategory.dart';
import 'package:hm_shop/components/Home/HmHot.dart';
import 'package:hm_shop/components/Home/HmSlider.dart';
import 'package:hm_shop/components/Home/HmSuggestion.dart';
import 'package:hm_shop/constants/index.dart';
import 'package:hm_shop/utils/DioRequest.dart';
import 'package:hm_shop/viewmodels/home.dart';

class HomeView extends StatefulWidget {
  HomeView({Key? key}) : super(key: key);

  @override
  _HomeViewState createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  List<BannerItem> _bannarList = [];
  List<CategoryItem> _categoryList = [];
  // 特惠推荐
  Result _goodsList = Result(id: '', title: '', subTypes: []);
  Result _hotList = Result(id: '', title: '', subTypes: []);
  Result _oneStopList = Result(id: '', title: '', subTypes: []);

  @override
  void initState() {
    super.initState();
    _getBannerList();
    _getCategoryList();
    _getProductList();
    _getHotList();
    _getOneStopList();
    setState(() {});
  }

  void _getBannerList() async {
    _bannarList = await getBannerListApI();
  }

  // 获取分类列表
  void _getCategoryList() async {
    _categoryList = await getCategoryListApI();
  }

  void _getProductList() async {
    _goodsList = await getGoodsListApI();
  }

  void _getHotList() async {
    _hotList = await getHotListApI();
  }

  void _getOneStopList() async {
    _oneStopList = await getOneStopList();
  }

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
  List<Widget> _getScrollViewChildren() {
    return [
      SliverToBoxAdapter(child: HmSlider(bannarList: _bannarList)),
      SliverToBoxAdapter(child: SizedBox(height: 10)),
      SliverToBoxAdapter(child: HmCategory(categoryList: _categoryList)),
      SliverToBoxAdapter(child: SizedBox(height: 10)),
      SliverToBoxAdapter(child: HmSuggestion(goodsList: _goodsList)),
      SliverToBoxAdapter(child: SizedBox(height: 10)),
      SliverToBoxAdapter(
        child: Flex(
          direction: Axis.horizontal,
          children: [
            Expanded(child: HmHot(list: _hotList, type: HmHot.hot)),
            Expanded(child: HmHot(list: _hotList, type: HmHot.one_stop)),
          ],
        ),
      ),
    ];
  }

  @override
  Widget build(BuildContext context) {
    return CustomScrollView(slivers: _getScrollViewChildren());
  }
}
