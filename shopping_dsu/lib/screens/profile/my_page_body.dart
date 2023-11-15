import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shopping_dsu/constants.dart';
import 'package:shopping_dsu/screens/login.dart';
import 'package:url_launcher/url_launcher.dart';
import '../../size_config.dart';
import '../mainpage/components/section_title.dart';

class MypageBody extends StatefulWidget {
  const MypageBody({super.key});

  @override
  State<MypageBody> createState() => _Mypagebodystate();
}

// 여건되면 정리
class _Mypagebodystate extends State<MypageBody> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        // 상단 앱바
        title: const Text("사용자 정보"),
        centerTitle: true,
        backgroundColor: Colors.transparent,
        elevation: 0,
        titleTextStyle: const TextStyle(
            fontFamily: 'pretendard',
            fontWeight: FontWeight.w700,
            color: kSecondaryColor,
            fontSize: 20),
        iconTheme: const IconThemeData(
          color: kSecondaryColor,
        ),
      ),
      body: Center(
        // 사용시 주의사항
        child: Column(
          children: [
            SizedBox(height: getProportionateScreenWidth(60)),
            const SectionTitle(text: "사용 시 주의사항"),
            SizedBox(height: getProportionateScreenWidth(20)),
            SizedBox(
              width: SizeConfig.screenWidth * 0.9,
              height: 165,
              child: const Padding(
                padding: EdgeInsets.all(4.0),
                child: Text(
                  '1. 구매를 바라시는 경우 홈페이지에서 본인의 배송지를 입력해주시길 바랍니다.\n2.무농약·유기농 농법만으로는 수확량 보전 및 품질 유지가 어려운 과일 등의 품목은 일반 관행 농산물을 구출하는 경우도 있습니다.\n3. 해당 어플은 못난이 채소 판매 웹사이트를 보조하기 위한 목적으로 제작되었습니다.',
                  style: TextStyle(
                      fontFamily: "pretendard", color: kTextColor, height: 1.5),
                ),
              ),
            ),
            SizedBox(height: getProportionateScreenWidth(60)), // 간격 띄우기
            const SectionTitle(text: "전화번호"),
            SizedBox(height: getProportionateScreenWidth(25)),
            Container(
              // 전화번호
              width: SizeConfig.screenWidth * 0.9,
              height: 50,
              decoration: BoxDecoration(
                color:
                    const Color.fromARGB(255, 182, 182, 182).withOpacity(0.1),
                borderRadius: BorderRadius.circular(15),
              ),
              child: TextField(
                onChanged: (value) {},
                decoration: InputDecoration(
                  enabledBorder: InputBorder.none,
                  focusedBorder: InputBorder.none, // 외곽선 제거
                  hintText: "전화번호",
                  contentPadding: EdgeInsets.symmetric(
                      horizontal: getProportionateScreenWidth(20),
                      vertical: getProportionateScreenWidth(16)),
                ),
              ),
            ),
            SizedBox(height: getProportionateScreenWidth(30)),
            // 사이트 바로가기
            TextButton(
              onPressed: () => 
                  launchUrl(Uri.parse('ttp://vegetable.dothome.co.kr/index.php')),
              child: // 간격 띄우기
                  const Text(
                "우리 사이트 바로가기",
                style: TextStyle(
                    fontSize: 20,
                    fontFamily: "pretendard",
                    fontWeight: FontWeight.w600,
                    color: kPrimaryColor),
                textAlign: TextAlign.center,
              ),
            ),
            // 띄우기
            SizedBox(height: getProportionateScreenWidth(15)),
            const Text(
              "서비스 이용정책",
              style: TextStyle(
                  fontSize: 13,
                  fontFamily: "pretendard",
                  fontWeight: FontWeight.w500,
                  color: Color.fromARGB(255, 187, 187, 187)),
              textAlign: TextAlign.center,
            ),
            SizedBox(height: getProportionateScreenWidth(5)),
            TextButton(
              // 로그아웃 (버튼)
              onPressed: () {
                showDialog(
                    context: context,
                    builder: ((context) => AlertDialog(
                          title: const Text(""),
                          content: const Text("로그아웃 하시겠습니까?"),
                          actions: [
                            TextButton(
                              onPressed: () => Get.back(),
                              child: const Text('아니오'),
                            ),
                            TextButton(
                              onPressed: () => Get.offAll(const LoginPage()),
                              child: const Text('예'),
                            ),
                          ],
                        )));
              },
              // 로그아웃 (텍스트)
              child: const Text(
                "로그아웃하기", // 로그아웃 구현하면서 버튼 만들기
                style: TextStyle(
                    fontSize: 13,
                    fontFamily: "pretendard",
                    fontWeight: FontWeight.w500,
                    color: Color.fromARGB(255, 187, 187, 187)),
                textAlign: TextAlign.center,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
