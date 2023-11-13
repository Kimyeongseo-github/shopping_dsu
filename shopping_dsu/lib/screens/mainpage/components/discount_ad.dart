import 'package:flutter/material.dart';
import 'package:shopping_dsu/size_config.dart';

class Discount_ad extends StatelessWidget {
  const Discount_ad({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: getProportionateScreenWidth(20)),
      width: double.infinity,
      height: 80,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20),
        image: const DecorationImage(
            image: AssetImage('assets/images/eh.png'), fit: BoxFit.cover),
        // 추가하니까 Input channel destroyed: 'ClientS' 에러뜸
        // 원인 파악 필요함
      ),
    );
  }
}
