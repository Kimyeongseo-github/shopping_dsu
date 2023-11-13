import 'package:flutter/material.dart';
import '../size_config.dart';

class DefaultButton extends StatelessWidget {
  const DefaultButton({
    super.key,
    required this.text,
    required this.press,
  });
  final String? text;
  final Function? press;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      height: getProportionateScreenHeight(56),
      child: TextButton(
        style: TextButton.styleFrom(
          foregroundColor: Colors.white,
          textStyle:
              const TextStyle(fontFamily: 'suite', fontWeight: FontWeight.w500),
          backgroundColor: const Color.fromRGBO(171, 204, 51, 1),
          shape: const StadiumBorder(),
        ),
        onPressed: press as void Function()?,
        child: Text(text!),
      ),
    );
  }
}
