import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:shopping_dsu/size_config.dart';
import 'package:url_launcher/url_launcher.dart';

class Know_Detail extends StatefulWidget {
  const Know_Detail({
    super.key,
  });

  @override
  State<Know_Detail> createState() => _KnowDetail();
}

class _KnowDetail extends State<Know_Detail> {
  int _current = 0;
  final CarouselController _controller = CarouselController();
  // carousel(패키지)로 사진이 부드럽게 넘어가도록 하는 기능
  List imageList = ['assets/images/banner.png', 'assets/images/eh.png'];

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
        child: Container(
      margin: EdgeInsets.symmetric(horizontal: getProportionateScreenWidth(20)),
      width: double.infinity,
      height: 150,
      clipBehavior: Clip.hardEdge,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20),
      ),
      child: Stack(
        // 스택 사용하면 각각의 위젯을 겹칠 수 있음
        children: [sliderWidget(), sliderIndicator()],
      ),
    ));
  }

  Widget sliderWidget() {
    return CarouselSlider(
      carouselController: _controller,
      items: imageList.map(
        (imgLink) {
          return Builder(
            builder: (context) {
              return InkWell(
                  onTap: () {
                    // 해당 뉴스로 링크 이동 launchUrl(패키지)
                    launchUrl(Uri.parse(
                        'http://www.ikpnews.net/news/articleView.html?idxno=46387'));
                  },
                  child: SizedBox(
                    width: MediaQuery.of(context).size.width,
                    child: Image(
                      fit: BoxFit.fill,
                      image: AssetImage(imgLink),
                    ),
                  ));
            },
          );
        },
      ).toList(),
      options: CarouselOptions(
        height: 300,
        viewportFraction: 1.0, // 여백 없이 채워진 이미지
        autoPlay: true, // 자동재생
        autoPlayInterval: const Duration(seconds: 4),
        onPageChanged: (index, reason) {
          setState(() {
            // 페이지 변할때 담당할 기능
            _current = index;
          });
        },
      ),
    );
  }

  Widget sliderIndicator() {
    // 슬라이더 버튼
    return Align(
      alignment: Alignment.bottomCenter,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: imageList.asMap().entries.map((entry) {
          return GestureDetector(
            onTap: () => _controller.animateToPage(entry.key),
            // 이미지 리스트를 key로 변경해서 각 이미지의 순서를 넣어줌
            child: Container(
              width: 12,
              height: 12,
              margin:
                  const EdgeInsets.symmetric(vertical: 8.0, horizontal: 4.0),
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color:
                    Colors.white.withOpacity(_current == entry.key ? 0.9 : 0.4),
                // 현재 보여지고 있는 버튼 색깔의 오퍼시티와 아닌 것
              ),
            ),
          );
        }).toList(),
      ),
    );
  }
}
