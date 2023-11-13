import 'package:flutter/material.dart';
import 'package:shopping_dsu/size_config.dart';

class SectionTitle extends StatelessWidget {
  const SectionTitle({
    super.key,
    required this.text,
  });
  final String text;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding:
          EdgeInsets.symmetric(horizontal: getProportionateScreenWidth(20)),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            text,
            style: TextStyle(
              fontSize: getProportionateScreenWidth(15),
              fontFamily: "pretendard",
              fontWeight: FontWeight.w500,
              color: const Color.fromARGB(255, 143, 143, 143),
            ),
          ),
        ],
      ),
    );
  }
}
