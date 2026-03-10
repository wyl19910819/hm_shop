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
  final CarouselSliderController _carouselSliderController =
      CarouselSliderController();
  int _currentIndex = 0;

  List<Widget> _getPageChildren() {
    double screenWidth = MediaQuery.of(context).size.width;
    return List.generate(widget.bannarList.length, (int index) {
      return Image.network(
        widget.bannarList[index].imageUrl,
        fit: BoxFit.cover,
        width: screenWidth,
      );
    });
  }

  Widget _getSlider() {
    return CarouselSlider(
      carouselController: _carouselSliderController,
      items: _getPageChildren(),
      options: CarouselOptions(
        height: 300,
        viewportFraction: 1,
        autoPlay: false,
        onPageChanged: (index, reason) {
          _currentIndex = index;
          setState(() {});
        },
        autoPlayInterval: Duration(seconds: 3),
      ),
    );
  }

  Widget _getSearch() {
    return Positioned(
      left: 10,
      right: 10,
      top: 10,
      child: Container(
        alignment: Alignment.centerLeft,
        width: double.infinity,
        height: 50,
        padding: EdgeInsets.symmetric(horizontal: 20),
        margin: EdgeInsets.symmetric(horizontal: 10),
        decoration: BoxDecoration(
          color: Color.fromRGBO(0, 0, 0, 0.4),
          borderRadius: BorderRadius.circular(10),
        ),
        child: Text(
          "搜索...",
          style: TextStyle(fontSize: 18, color: Colors.white),
        ),
      ),
    );
  }

  Widget _getIndicator() {
    return Positioned(
      left: 0,
      right: 0,
      bottom: 5,
      child: SizedBox(
        height: 20,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: List.generate(widget.bannarList.length, (index) {
            return GestureDetector(
              onTap: () {
                _carouselSliderController.jumpToPage(index);
              },
              child: AnimatedContainer(
                duration: Duration(seconds: 1),
                  width: _currentIndex == index ? 30 : 20,
                  height: 6,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(3),
                    color: _currentIndex == index ? Colors.blue : Colors.white,
                  ),
                  margin: EdgeInsets.only(right: 10),
                ),
            );
          }),
        ),
      ),
    );
  }

  List<Widget> _getStackChildren() {
    return [_getSlider(), _getSearch(), _getIndicator()];
  }

  @override
  Widget build(BuildContext context) {
    return Stack(children: _getStackChildren());
  }
}
