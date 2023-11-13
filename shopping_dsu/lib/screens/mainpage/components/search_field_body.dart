import 'package:easy_search_bar/easy_search_bar.dart';
import 'package:flutter/material.dart';
import 'package:shopping_dsu/constants.dart';
import 'package:shopping_dsu/screens/details/detail_veg_itemcheck.dart';

class SearchFieldBody extends StatefulWidget {
  const SearchFieldBody({super.key});
  static String routeName = "/search";
  @override
  State<SearchFieldBody> createState() => _SearchFieldBodyState();
}

class _SearchFieldBodyState extends State<SearchFieldBody> {
  String searchValue = '';
  final List<String> _suggestions = [
    // 일단 리스트로 이름을 만들어두고 페이지로 연결해야될듯 ㅠ
    '강원도 못난이 감자',
    '강원도 못난이 옥수수',
    '논산 못난이 딸기',
    '지리산 천연 벌꿀',
    '제주 못난이 당근',
    '전남 못난이 파프리카',
  ];

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        extendBodyBehindAppBar: true,
        appBar: EasySearchBar(
            backgroundColor: Colors.transparent,
            elevation: 0,
            title: const Text('검색 화면'),
            titleTextStyle: const TextStyle(
                fontFamily: 'pretendard',
                fontWeight: FontWeight.w700,
                color: Color.fromARGB(255, 143, 143, 143),
                fontSize: 20),
            iconTheme: const IconThemeData(color: kPrimaryColor),
            onSearch: (value) => setState(() => searchValue = value),
            suggestions: _suggestions),
        body: Center(
          // child: Listshow(),
          child: switchproduct(searchValue),
        ),
      ),
    );
    // body: Center(child: Text('Value: $searchValue'))));
  }

  Widget switchproduct(String searchValue) {
    String imageAsset;
    String productName;
    String description;
    double price; //vegcheck에 있는 변수 가져오기

    // list 내용을 선택할때마다 각각의 사진 출력, 누르면 페이지 이동
    switch (searchValue) {
      case '강원도 못난이 감자':
        imageAsset = "assets/images/potato_1.jpg";
        productName = "강원도 못난이 감자";
        description = '강원도에서 나고 자란 못난이 감자';
        price = 5000;
        break;
      case '강원도 못난이 옥수수':
        imageAsset = "assets/images/corn_1.jpg";
        productName = "강원도 못난이 옥수수";
        description = '강원도에서 나고 자란 못난이 옥수수';
        price = 7000;
        break;
      case '논산 못난이 딸기':
        imageAsset = "assets/images/strawberry_1.jpg";
        productName = "논산 못난이 딸기";
        description = '논산에서 나고 자란 못난이 딸기';
        price = 8000;
        break;
      case '지리산 천연 벌꿀':
        imageAsset = "assets/images/honey_1.jpg";
        productName = "지리산 천연 벌꿀";
        description = '지리산 청정 구역에서 꿀벌들이 모은 천연 꿀';
        price = 10000;
        break;
      case '제주 못난이 당근':
        imageAsset = "assets/images/carrot1.jpg";
        productName = "제주 못난이 당근";
        description = '제주도에서 나고 자란 못난이 당근';
        price = 5000;
        break;
      case '전남 못난이 파프리카':
        imageAsset = "assets/images/papu.jpg";
        productName = "전남 못난이 파프리카";
        description = '농부들이 한 땀 한 땀 키운 못난이 파프리카';
        price = 8000;
        break;
      default:
        return const Text('검색 결과가 없습니다.');
    }
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        Image.asset(imageAsset),
        const SizedBox(height: 10),
        ElevatedButton(
          // 상세 정보로 이동하는 버튼
          style: ElevatedButton.styleFrom(
            backgroundColor: kPrimaryColor,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(30),
            ),
          ),
          onPressed: () {
            Navigator.of(context).push(MaterialPageRoute(
              builder: (context) => ItemDetailsPage(
                productName: productName,
                productImageUrl: imageAsset,
                description: description,
                price: price,
              ),
            ));
          },
          child: const Text('상세 정보 보기'),
        ),
      ],
    );
  }
}
