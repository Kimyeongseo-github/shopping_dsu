import 'package:flutter/material.dart';
import 'package:shopping_dsu/constants.dart';
import 'package:shopping_dsu/models/Product.dart';
import 'package:url_launcher/url_launcher.dart';

class ItemDetailsPage extends StatefulWidget {
  String productName;
  String productImageUrl;
  String description;
  double price;

  ItemDetailsPage(
      {super.key,
      required this.productName,
      required this.productImageUrl,
      required this.description,
      required this.price});

  @override
  State<ItemDetailsPage> createState() => _ItemDetailsPageState();
}

class _ItemDetailsPageState extends State<ItemDetailsPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: const Text(""),
        centerTitle: true,
        backgroundColor: Colors.transparent,
        elevation: 0,
        iconTheme: const IconThemeData(
          color: Color.fromARGB(255, 143, 143, 143),
        ),
      ),
      body: SingleChildScrollView(
        // 페이지 크기에 맞춰서 제작, 각 상품이 크기 밖으로 나가지 않도록 싱글스크롤
        child: Column(
          children: [
            Container(
                // 이미지
                alignment: Alignment.center,
                padding: const EdgeInsets.all(15),
                child: Image.asset(widget.productImageUrl,
                    width: MediaQuery.of(context).size.width * 0.8,
                    fit: BoxFit.cover)),
            Container(
              // 상품 이름
              padding: const EdgeInsets.symmetric(vertical: 13),
              child: Text(widget.productName,
                  textScaleFactor: 1.8,
                  style: const TextStyle(
                      fontFamily: 'pretendard', fontWeight: FontWeight.w700)),
            ),
            Container(
              // 가격 (numberformat-패키지 사용)
              padding: const EdgeInsets.symmetric(vertical: 5),
              child: Text(
                "${numberFormat.format(widget.price)}원",
                textScaleFactor: 1.3,
                style: const TextStyle(
                    fontFamily: 'pretendard',
                    fontWeight: FontWeight.normal,
                    color: kPrimaryColor),
              ),
            ),
            Container(
              // 설명
              margin: const EdgeInsets.only(left: 30, right: 30),
              padding: const EdgeInsets.symmetric(vertical: 15),
              child: Text(widget.description,
                  textScaleFactor: 1.3,
                  style: const TextStyle(
                      fontFamily: 'pretendard', fontWeight: FontWeight.normal)),
            ),
          ],
        ),
      ),
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.all(20),
        child: TextButton(
          onPressed: () => launchUrl(Uri.parse( // 본인의 ip 주소를 입력
              'http://ipv4 주소/CS/categories.php?m_category=1')), // 웹사이트 링크 연결
          style: TextButton.styleFrom(
              foregroundColor: Colors.white,
              backgroundColor: kPrimaryColor,
              shape: const StadiumBorder(),
              textStyle: const TextStyle(
                  fontFamily: 'suite', fontWeight: FontWeight.w500)),
          child: const Text("웹사이트 바로구매 링크"),
        ),
      ),
    );
  }
}
