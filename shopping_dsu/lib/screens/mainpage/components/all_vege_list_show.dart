import 'package:flutter/material.dart';
import 'package:shopping_dsu/screens/mainpage/components/vege_list_body.dart';
import 'package:shopping_dsu/screens/menu_bottom.dart';

class Listshow extends StatelessWidget {
  const Listshow({super.key});
  static String routeName = "/listshow";

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: ItemListPage(),
      bottomNavigationBar: MenuBottom(),
    );
  }
}

// 상품 리스트를 보여주기 위해 설정한 루트