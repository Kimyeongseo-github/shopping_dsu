import 'package:flutter/material.dart';
import '../../../components/product_show_onmain.dart';
import '../../../models/Product.dart';
import '../../../size_config.dart';
import 'section_title.dart';

class Recommendproduct extends StatelessWidget {
  const Recommendproduct({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const SectionTitle(text: "오늘의 추천"),
        SizedBox(height: getProportionateScreenWidth(15)),
        SingleChildScrollView(
          scrollDirection: Axis.horizontal,
          child: Row(
            children: [
              // 오늘의 추천 프론트에 띄워줌
              ...List.generate(demoProducts.length, (index) {
                if (demoProducts[index].isPopular) {
                  return Productshow(
                      product: demoProducts[index] // 인덱스에 따라 오늘의 추천 상품이 출력
                      );
                }
                return const SizedBox.shrink();
              })
            ],
          ),
        ),
      ],
    );
  }
}
