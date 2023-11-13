import 'package:flutter/widgets.dart';
import 'package:shopping_dsu/screens/login.dart';
import 'package:shopping_dsu/screens/mainpage/components/main_introduce/introduce_veg.dart';
import 'package:shopping_dsu/screens/mainpage/main_screen.dart';
import 'package:shopping_dsu/screens/splash/splash_screen.dart';
import 'screens/mainpage/components/all_vege_list_show.dart';
import 'screens/mainpage/components/search_field_body.dart';
import 'screens/profile/my_page.dart';

// 루트는 전부 여길 통함
final Map<String, WidgetBuilder> routes = {
  SplashScreen.routeName: (context) => const SplashScreen(),
  LoginPage.routeName: (context) => const LoginPage(),
  MainScreen.routeName: (context) => const MainScreen(),
  Mypage.routeName: (context) => const Mypage(),
  Listshow.routeName: (context) => const Listshow(),
  Introduceveg.routeName: (context) => const Introduceveg(),
  SearchFieldBody.routeName: (context) => const SearchFieldBody()
};
