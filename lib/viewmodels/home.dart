class BannerItem {
  String id;
  String imageUrl;

  BannerItem({required this.id, required this.imageUrl});

  factory BannerItem.fromJson(Map<String, dynamic> json) {
    return BannerItem(
      id: json["id"] as String,
      imageUrl: json["imgUrl"] as String,
    );
  }
}

class CategoryItem {
  String id;
  String name;
  String picture;
  List<CategoryItem>? children;
  CategoryItem({
    required this.id,
    required this.name,
    required this.picture,
    this.children,
  });

  factory CategoryItem.fromJson(Map<String, dynamic> json) {
    return CategoryItem(
      id: json["id"] ?? "",
      name: json["name"] ?? "",
      picture: json["picture"] ?? "",
      children: json["children"] == null
          ? null
          : (json["children"] as List).map((item) {
              return CategoryItem.fromJson(item as Map<String, dynamic>);
            }).toList(),
    );
  }
}

class GoodsItem {
  String id;
  String name;
  String? desc;
  String price;
  String picture;
  int orderNum;

  GoodsItem({
    required this.id,
    required this.name,
    this.desc,
    required this.price,
    required this.picture,
    required this.orderNum,
  });

  factory GoodsItem.fromJson(Map<String, dynamic> json) {
    return GoodsItem(
      id: json["id"].toString(),
      name: json["name"] as String,
      desc: json["desc"] as String?,
      price: json["price"] as String,
      picture: json["picture"] as String,
      orderNum: json["orderNum"] as int,
    );
  }
}

class GoodsItems {
  int counts;
  int pageSize;
  int pages;
  int page;
  List<GoodsItem> items;

  GoodsItems({
    required this.counts,
    required this.pageSize,
    required this.pages,
    required this.page,
    required this.items,
  });

  factory GoodsItems.fromJson(Map<String, dynamic> json) {
    return GoodsItems(
      counts: json["counts"] as int,
      pageSize: json["pageSize"] as int,
      pages: json["pages"] as int,
      page: json["page"] as int,
      items: (json["items"] as List).map((item) {
        return GoodsItem.fromJson(item as Map<String, dynamic>);
      }).toList(),
    );
  }
}

class SubType {
  String id;
  String title;
  GoodsItems goodsItems;

  SubType({required this.id, required this.title, required this.goodsItems});

  factory SubType.fromJson(Map<String, dynamic> json) {
    return SubType(
      id: json["id"].toString(),
      title: json["title"] as String,
      goodsItems: GoodsItems.fromJson(
        json["goodsItems"] as Map<String, dynamic>,
      ),
    );
  }
}

class Result {
  String id;
  String title;
  List<SubType> subTypes;

  Result({required this.id, required this.title, required this.subTypes});

  factory Result.fromJson(Map<String, dynamic> json) {
    return Result(
      id: json["id"].toString(),
      title: json["title"] as String,
      subTypes: (json["subTypes"] as List).map((item) {
        return SubType.fromJson(item as Map<String, dynamic>);
      }).toList(),
    );
  }
}




// {
//   "code": 1,
//   "msg": "操作成功",
//   "result": {
//     "id": 897682543,
//     "title": "特惠推荐",
//     "subTypes": [
//       {
//         "id": 912000341,
//         "title": "抢先尝鲜",
//         "goodsItems": {
//           "counts": 459,
//           "pageSize": 10,
//           "pages": 46,
//           "page": 1,
//           "items": [
//             {
//               "id": 1379052170040578049,
//               "name": "极光限定 珠光蓝珐琅锅",
//               "desc": null,
//               "price": 199.00,
//               "picture": "http://yjy-xiaotuxian-dev.oss-cn-beijing.aliyuncs.com/picture/2021-04-05/7f483771-6831-4a7a-abdb-2625acb755f3.png",
//               "orderNum": 929
//             },
//             {
//               "id": 1750713979400880130,
//               "name": "FACE TRICK 三重隔绝有害光线IRUV1000高性能太阳镜 男女通用款 透明色镜框",
//               "desc": "简约轻便，时尚护目",
//               "price": 349.00,
//               "picture": "https://yjy-teach-oss.oss-cn-beijing.aliyuncs.com/meikou/247519/p6.png",
//               "orderNum": 22
//             },
//             {
//               "id": 1750713978985644032,
//               "name": "Fleep 带胸垫8分袖棉质收腰内衣 肤色",
//               "desc": "细腻柔软触感顺滑",
//               "price": 467.00,
//               "picture": "https://yjy-teach-oss.oss-cn-beijing.aliyuncs.com/meikou/216779/p1.png",
//               "orderNum": 9
//             },
//             {
//               "id": 1750713979195359236,
//               "name": "SILVER LAKE CLUB 银湖俱乐部 皮革2WAY竖版男士单肩斜挎包 黑色",
//               "desc": "一包两用，时尚简约",
//               "price": 2092.00,
//               "picture": "https://yjy-teach-oss.oss-cn-beijing.aliyuncs.com/meikou/249992/p1.png",
//               "orderNum": 10
//             },
//             {
//               "id": 1750713979514126340,
//               "name": "十方未来 十方未来强化系列内衣 I TYPE 米色",
//               "desc": "舒适透气轻便自由",
//               "price": 411.00,
//               "picture": "https://yjy-teach-oss.oss-cn-beijing.aliyuncs.com/meikou/94076/p5.png",
//               "orderNum": 21
//             },
//             {
//               "id": 1750713979421851657,
//               "name": "KANGOL 刺绣logo条纹短袖 黑色 M",
//               "desc": "清爽夏日感条纹T恤",
//               "price": 298.00,
//               "picture": "https://yjy-teach-oss.oss-cn-beijing.aliyuncs.com/meikou/249861/p5.png",
//               "orderNum": 11
//             },
//             {
//               "id": 1750713979316994055,
//               "name": "CA4LA MARONE BT1140 MIX M 货号:SNK02120",
//               "desc": "意式老字号的时尚猎帽",
//               "price": 1113.00,
//               "picture": "https://yjy-teach-oss.oss-cn-beijing.aliyuncs.com/meikou/254349/p1.png",
//               "orderNum": 37
//             },
//             {
//               "id": 1750713979308605444,
//               "name": "OVERRIDE 针织卷猫耳帽白色 57cm～59cm(98)",
//               "desc": "萌趣猫耳，温暖随行",
//               "price": 493.00,
//               "picture": "https://yjy-teach-oss.oss-cn-beijing.aliyuncs.com/meikou/255975/p1.png",
//               "orderNum": 13
//             },
//             {
//               "id": 1750713979950333953,
//               "name": "Balva 自动调光偏光太阳镜 方圆形",
//               "desc": "轻巧便携调光偏光太阳镜",
//               "price": 704.00,
//               "picture": "https://yjy-teach-oss.oss-cn-beijing.aliyuncs.com/meikou/235222/p4.png",
//               "orderNum": 12
//             },
//             {
//               "id": 1750713978989838338,
//               "name": "Fleep 带胸垫一体式棉质短袖内衣 浅粉色",
//               "desc": "柔软舒适简约百搭",
//               "price": 399.00,
//               "picture": "https://yjy-teach-oss.oss-cn-beijing.aliyuncs.com/meikou/216751/p1.png",
//               "orderNum": 13
//             }
//           ]
//         }
//       },
//       {
//         "id": 912000342,
//         "title": "新品预告",
//         "goodsItems": {
//           "counts": 459,
//           "pageSize": 10,
//           "pages": 46,
//           "page": 1,
//           "items": [
//             {
//               "id": 1750713978985644032,
//               "name": "Fleep 带胸垫8分袖棉质收腰内衣 肤色",
//               "desc": "细腻柔软触感顺滑",
//               "price": 467.00,
//               "picture": "https://yjy-teach-oss.oss-cn-beijing.aliyuncs.com/meikou/216779/p1.png",
//               "orderNum": 9
//             },
//             {
//               "id": 1750713978989838338,
//               "name": "Fleep 带胸垫一体式棉质短袖内衣 浅粉色",
//               "desc": "柔软舒适简约百搭",
//               "price": 399.00,
//               "picture": "https://yjy-teach-oss.oss-cn-beijing.aliyuncs.com/meikou/216751/p1.png",
//               "orderNum": 13
//             },
//             {
//               "id": 1379052170040578049,
//               "name": "极光限定 珠光蓝珐琅锅",
//               "desc": null,
//               "price": 199.00,
//               "picture": "http://yjy-xiaotuxian-dev.oss-cn-beijing.aliyuncs.com/picture/2021-04-05/7f483771-6831-4a7a-abdb-2625acb755f3.png",
//               "orderNum": 929
//             },
//             {
//               "id": 1750713979950333953,
//               "name": "Balva 自动调光偏光太阳镜 方圆形",
//               "desc": "轻巧便携调光偏光太阳镜",
//               "price": 704.00,
//               "picture": "https://yjy-teach-oss.oss-cn-beijing.aliyuncs.com/meikou/235222/p4.png",
//               "orderNum": 12
//             },
//             {
//               "id": 1750713979308605444,
//               "name": "OVERRIDE 针织卷猫耳帽白色 57cm～59cm(98)",
//               "desc": "萌趣猫耳，温暖随行",
//               "price": 493.00,
//               "picture": "https://yjy-teach-oss.oss-cn-beijing.aliyuncs.com/meikou/255975/p1.png",
//               "orderNum": 13
//             },
//             {
//               "id": 1750713979195359236,
//               "name": "SILVER LAKE CLUB 银湖俱乐部 皮革2WAY竖版男士单肩斜挎包 黑色",
//               "desc": "一包两用，时尚简约",
//               "price": 2092.00,
//               "picture": "https://yjy-teach-oss.oss-cn-beijing.aliyuncs.com/meikou/249992/p1.png",
//               "orderNum": 10
//             },
//             {
//               "id": 1750713979400880130,
//               "name": "FACE TRICK 三重隔绝有害光线IRUV1000高性能太阳镜 男女通用款 透明色镜框",
//               "desc": "简约轻便，时尚护目",
//               "price": 349.00,
//               "picture": "https://yjy-teach-oss.oss-cn-beijing.aliyuncs.com/meikou/247519/p6.png",
//               "orderNum": 22
//             },
//             {
//               "id": 1750713979421851657,
//               "name": "KANGOL 刺绣logo条纹短袖 黑色 M",
//               "desc": "清爽夏日感条纹T恤",
//               "price": 298.00,
//               "picture": "https://yjy-teach-oss.oss-cn-beijing.aliyuncs.com/meikou/249861/p5.png",
//               "orderNum": 11
//             },
//             {
//               "id": 1750713979514126340,
//               "name": "十方未来 十方未来强化系列内衣 I TYPE 米色",
//               "desc": "舒适透气轻便自由",
//               "price": 411.00,
//               "picture": "https://yjy-teach-oss.oss-cn-beijing.aliyuncs.com/meikou/94076/p5.png",
//               "orderNum": 21
//             },
//             {
//               "id": 1750713979316994055,
//               "name": "CA4LA MARONE BT1140 MIX M 货号:SNK02120",
//               "desc": "意式老字号的时尚猎帽",
//               "price": 1113.00,
//               "picture": "https://yjy-teach-oss.oss-cn-beijing.aliyuncs.com/meikou/254349/p1.png",
//               "orderNum": 37
//             }
//           ]
//         }
//       }
//     ]
//   }
// }