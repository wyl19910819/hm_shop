import 'package:hm_shop/constants/index.dart';
import 'package:hm_shop/utils/DioRequest.dart';
import 'package:hm_shop/viewmodels/home.dart';

Future<List<BannerItem>> getBannerListApI() async{
   return ((await dioRequest.get(HttpConstants.BANNER_LIST)) as List).map((item){
    return BannerItem.fromJson(item as Map<String,dynamic> );
  }).toList();
}

// 获取分类列表
Future<List<CategoryItem>> getCategoryListApI() async{
  return ((await dioRequest.get(HttpConstants.CATEGORY_LIST)) as List).map((item){
    return CategoryItem.fromJson(item as Map<String,dynamic>);
  }).toList();
}

// 获取商品列表
Future<Result> getGoodsListApI() async{
  return Result.fromJson(await dioRequest.get(HttpConstants.PRODUCT_LIST));
}

// 获取热榜推荐列表
Future<Result> getHotListApI() async{
  return Result.fromJson(await dioRequest.get(HttpConstants.IN_VOGUE_LIST));
}

// 获取一站推荐列表
Future<Result> getOneStopList() async{
  return Result.fromJson(await dioRequest.get(HttpConstants.ONE_STEP_LIST));
}




