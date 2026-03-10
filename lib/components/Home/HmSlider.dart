import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:hm_shop/viewmodels/home.dart';

class HmSlider extends StatefulWidget {
  List<BannerItem> bannarList;
  HmSlider({Key? key, required this.bannarList}) : super(key: key);

  @override
  _HmSliderState createState() => _HmSliderState();
}

class _HmSliderState extends State<HmSlider> {
  List<Widget> _getPageChildren(){
    double screenWidth = MediaQuery.of(context).size.width;
    return List.generate(widget.bannarList.length, (int index){
      return Image.network(widget.bannarList[index].imageUrl,fit: BoxFit.cover,width: screenWidth);
    });
  }

  Widget _getSlider(){
    return CarouselSlider(items: _getPageChildren(),
    options: CarouselOptions(height:300,
    viewportFraction: 1,
    autoPlay: true,
    autoPlayInterval: Duration(seconds: 1)));
  }

  List<Widget> _getStackChildren(){
    return [
      // TextField(decoration: BoxDecoration(color: Colors.blueGrey)),
      _getSlider(),
    ];
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: _getStackChildren(),
    );
  }
}
