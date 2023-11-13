import 'package:flutter/material.dart';
import 'package:shopping_dsu/models/Product.dart';
import '../constants.dart';
import '../size_config.dart';

class Productshow extends StatelessWidget {
  const Productshow({
    super.key,
    this.width = 140,
    this.aspectRetion = 1.02,
    required this.product,
    // required this.press,
  });

  final double width, aspectRetion;
  final Product product; // 상품
  // final GestureTapCallback press;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(left: getProportionateScreenWidth(20)),
      child: GestureDetector(
        // onTap: press,
        child: SizedBox(
          width: getProportionateScreenWidth(width),
          child: Column(
            children: [
              AspectRatio(
                aspectRatio: aspectRetion,
                child: Container(
                  padding: EdgeInsets.all(getProportionateScreenWidth(20)),
                  decoration: BoxDecoration(
                    color: kSecondaryColor.withOpacity(0.1),
                    borderRadius: BorderRadius.circular(15),
                    image: DecorationImage(
                        image: AssetImage(product.images[0]),
                        fit: BoxFit.cover // 이미지 꽉 채워지도록
                        ),
                  ),
                ),
              ),
              const SizedBox(height: 5),
              Text(
                product.title,
                style: const TextStyle(
                  fontFamily: "suite",
                  fontWeight: FontWeight.w400,
                  fontSize: 14,
                ),
                maxLines: 2,
              ),
              Text(
                "${numberFormat.format(product.price)}원",
                style: TextStyle(
                  fontFamily: "suite",
                  fontWeight: FontWeight.w600,
                  fontSize: getProportionateScreenWidth(14),
                  color: kPrimaryColor,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
