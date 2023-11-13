import 'package:flutter/material.dart';

import '../../../constants.dart';
import '../../../size_config.dart';

class SplashContent extends StatelessWidget {
  const SplashContent({
    super.key,
    required this.text,
    required this.image,
  });
  final String? text, image;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        const Spacer(flex: 4),
        Text(
          "못난이 채소,\n어디까지 알고 계신가요?",
          textAlign: TextAlign.center,
          style: TextStyle(
            fontSize: getProportionateScreenWidth(28),
            color: kPrimaryColor,
            fontWeight: FontWeight.w500,
          ),
        ),
        const Spacer(),
        Text(
          text!,
          textAlign: TextAlign.center,
          style: const TextStyle(
            fontFamily: "pretendard",
            fontWeight: FontWeight.w600, // 페이지마다 다른 글꼴 설정
          ),
        ),
        const Spacer(flex: 2),
        Image.asset(image!,
            height: getProportionateScreenWidth(200),
            width: getProportionateScreenWidth(235)),
      ],
    );
  }
}
