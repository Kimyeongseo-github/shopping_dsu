import 'package:flutter/material.dart';
import 'package:shopping_dsu/size_config.dart';
import 'categories.dart';
import 'discount_ad.dart';
import 'knowdetail.dart';
import 'main_header.dart';
import 'recommend_product.dart';
import 'section_title.dart';

class Body extends StatelessWidget {
  const Body({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(height: getProportionateScreenWidth(20)), // 윗칸 공백 생성
            const Mainheader(), // 검색창
            SizedBox(height: getProportionateScreenWidth(20)),
            const Discount_ad(), // 할인창
            SizedBox(height: getProportionateScreenWidth(15)),
            const SectionTitle(text: "각 채소 분류 및 소개"), // 분류별 제목
            SizedBox(height: getProportionateScreenWidth(15)),
            const vegecategory(), // 채소별 분류
            SizedBox(height: getProportionateScreenWidth(15)),
            const SectionTitle(text: "못난이 채소에 대해 더 자세히 알고싶어요!"),
            SizedBox(height: getProportionateScreenWidth(15)),
            const Know_Detail(), // 자세히 알고싶어요
            SizedBox(height: getProportionateScreenWidth(15)),
            const Recommendproduct(), // 추천
            SizedBox(height: getProportionateScreenWidth(15)),
          ],
        ),
      ),
    );
  }
}
