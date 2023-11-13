import 'package:flutter/material.dart';
import '../size_config.dart';

class RoundedWidget extends StatelessWidget {
  const RoundedWidget({
    super.key,
    required this.iconData,
    required this.press,
  });

  final IconData iconData;
  final GestureTapCallback press;
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: getProportionateScreenWidth(40),
      width: getProportionateScreenWidth(40),
      child: TextButton(
        onPressed: press,
        style: TextButton.styleFrom(
          padding: const EdgeInsets.all(0.0),
          backgroundColor: Colors.white,
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(50)),
        ),
        child: Icon(
          iconData,
          color: const Color.fromRGBO(171, 204, 51, 1),
        ),
      ),
    );
  }
}
