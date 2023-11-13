import 'package:flutter/material.dart';
import 'package:shopping_dsu/screens/mainpage/components/body.dart';

import '../menu_bottom.dart';

class MainScreen extends StatelessWidget {
  const MainScreen({super.key});
  static String routeName = "/home";

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Body(),
      bottomNavigationBar: MenuBottom(),
    );
  }
}

// 메인 화면 - MainScreen