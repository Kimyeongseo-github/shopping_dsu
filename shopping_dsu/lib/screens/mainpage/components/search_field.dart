import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shopping_dsu/size_config.dart';
import 'search_field_body.dart';

class SearchField extends StatelessWidget {
  const SearchField({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
        width: SizeConfig.screenWidth * 0.8,
        height: 50, // 상자 크기
        decoration: BoxDecoration(
          color: const Color.fromARGB(255, 182, 182, 182).withOpacity(0.1),
          borderRadius: BorderRadius.circular(15),
        ),
        child: TextField(
          readOnly: true, // 검색 배너를 누르면 검색창 페이지로 이동하도록 만듬
          onTap: () => Get.to(() => const SearchFieldBody()),
          decoration: InputDecoration(
            enabledBorder: InputBorder.none,
            focusedBorder: InputBorder.none, // 외곽선 제거
            hintText: "어떤 채소를 찾으시나요?",
            prefixIcon: const Icon(Icons.search),
            contentPadding: EdgeInsets.symmetric(
                horizontal: getProportionateScreenWidth(20),
                vertical: getProportionateScreenWidth(16)),
          ),
        ));
  }
}
