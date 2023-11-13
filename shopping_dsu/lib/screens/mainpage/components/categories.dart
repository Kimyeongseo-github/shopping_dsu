import 'package:flutter/material.dart';

import '../../../size_config.dart';

class vegecategory extends StatelessWidget {
  const vegecategory({super.key});

  @override
  Widget build(BuildContext context) {
    List<Map<String, dynamic>> vegecategory = [
      {"image": "assets/images/carrot.png", "text": "뿌리채소"},
      {"image": "assets/images/potato.png", "text": "줄기채소"},
      {"image": "assets/images/leafygreen.png", "text": "잎채소"},
      {"image": "assets/images/eggplant.png", "text": "열매채소"},
      {"image": "assets/images/broccoli.png", "text": "꽃채소"},
      // 그림으로 꽉 채우기
    ];

    return Padding(
      padding:
          EdgeInsets.symmetric(horizontal: getProportionateScreenWidth(20)),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          ...List.generate(
            vegecategory.length,
            (index) => vegecategory_widget(
              image: vegecategory[index]["image"],
              text: vegecategory[index]["text"],
              press: () {},
            ),
          ),
        ],
      ),
    );
  }
}

class vegecategory_widget extends StatelessWidget {
  const vegecategory_widget({
    super.key,
    required this.image,
    required this.text,
    required this.press,
  });

  final String image, text;
  final GestureTapCallback press;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: press, // 누르면 페이지 이동 가능
      child: SizedBox(
        width: getProportionateScreenWidth(55),
        child: Column(
          children: [
            AspectRatio(
              aspectRatio: 1,
              child: Container(
                decoration: BoxDecoration(
                  color: Colors.transparent, // 박스 배경
                  borderRadius: BorderRadius.circular(15),
                ),
                child: Image.asset(image),
              ),
            ),
            const SizedBox(height: 5),
            Text(
              text,
              textAlign: TextAlign.center,
              style: const TextStyle(
                fontFamily: "pretendard",
                fontWeight: FontWeight.w400,
                fontSize: 12,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
