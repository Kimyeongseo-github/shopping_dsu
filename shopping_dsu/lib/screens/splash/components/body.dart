import 'package:flutter/material.dart';
import 'package:shopping_dsu/constants.dart';
import 'package:shopping_dsu/screens/login.dart';
import 'package:shopping_dsu/screens/splash/components/splash_content.dart';
import 'package:shopping_dsu/size_config.dart';
import 'package:shopping_dsu/components/default_button.dart';
import 'package:get/get.dart';

class Body extends StatefulWidget {
  const Body({super.key});

  @override
  _BodyState createState() => _BodyState();
}

class _BodyState extends State<Body> {
  int currentPage = 0;
  List<Map<String, String>> splashData = [
    {
      "text":
          "매년 전 세계 채소 소비량의 3분의 1이 폐기되고 있어요.\n이유는 다름 아닌 채소의 모양 때문이라고 해요.\n맛도 품질도 일반과 다를 바 없는\n채소의 이야기가 궁금하지 않으신가요?",
      "image": "assets/images/pimang.png"
    },
    {
      "text":
          "못난이 채소의 적극적 구제를 통한 보편화가 필요해요.\n구제를 하지 않더라도, 주변 친구와 가족에게 채소의 존재를\n알려줄 수만 있다면 충분해요.\n지금도 못난이 채소에게는 따뜻한 손길이 필요해요!",
      "image": "assets/images/abocado.png"
    },
    {
      "text":
          "우리는 못난이 채소 구제 웹페이지에서 판매를 돕고 있어요.\n이 어플에서 채소를 둘러볼 수 있지만, 실질적인 구제는\n웹을 통하게 되어요.",
      "image": "assets/images/baechu.png"
    },
  ];
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: SizedBox(
        width: double.infinity,
        child: Column(
          children: <Widget>[
            Expanded(
              flex: 3,
              child: PageView.builder(
                onPageChanged: (value) {
                  setState(() {
                    currentPage = value;
                  });
                },
                itemCount: splashData.length,
                itemBuilder: (context, index) => SplashContent(
                  image: splashData[index]["image"]!,
                  text: splashData[index]['text']!,
                ),
              ),
            ),
            Expanded(
              flex: 2,
              child: Padding(
                padding: EdgeInsets.symmetric(
                    horizontal: getProportionateScreenWidth(20)),
                child: Column(
                  children: <Widget>[
                    const Spacer(),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: List.generate(
                        splashData.length,
                        (index) => buildDot(index: index),
                      ),
                    ),
                    const Spacer(flex: 3),
                    DefaultButton(
                      text: "이해했어요",
                      press: () {
                        Get.offAll(() => const LoginPage());
                        // Navigator.pushNamed(context, LoginPage.routeName);
                      },
                    ),
                    const Spacer(),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  AnimatedContainer buildDot({index}) {
    return AnimatedContainer(
        duration: kAnimationDuration,
        margin: const EdgeInsets.only(right: 5),
        height: 6,
        width: currentPage == index ? 20 : 6,
        decoration: BoxDecoration(
          color: currentPage == index
              ? kPrimaryColor
              : const Color.fromARGB(255, 182, 182, 182),
          borderRadius: BorderRadius.circular(3),
        ));
  }
}
