import 'package:flutter/material.dart';
import 'package:shopping_dsu/screens/mainpage/components/search_field.dart';
import 'package:shopping_dsu/size_config.dart';

class Mainheader extends StatelessWidget {
  const Mainheader({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      // 검색창
      padding:
          EdgeInsets.symmetric(horizontal: getProportionateScreenWidth(20)),
      child: const Row(
        children: [
          SearchField(), // 검색창 따로 뺀거
        ],
      ),
    );
  }
}
