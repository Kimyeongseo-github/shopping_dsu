import 'package:flutter/material.dart';
import 'package:shopping_dsu/screens/profile/my_page_body.dart';
import '../menu_bottom.dart';

class Mypage extends StatelessWidget {
  const Mypage({super.key});
  static String routeName = "/mypage";

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: MypageBody(),
      bottomNavigationBar: MenuBottom(),
    );
  }
}

// 마이페이지로 이동하는 루트 역할