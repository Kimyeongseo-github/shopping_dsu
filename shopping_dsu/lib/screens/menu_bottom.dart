import 'package:flutter/material.dart';

class MenuBottom extends StatefulWidget {
  const MenuBottom({super.key});

  @override
  State<MenuBottom> createState() => _MenuBottomstate();
}

class _MenuBottomstate extends State<MenuBottom> {
  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: const BorderRadius.only(
        topLeft: Radius.circular(25.0),
        topRight: Radius.circular(25.0),
      ),
      child: BottomNavigationBar(
        items: const [
          // 하단바 버튼
          BottomNavigationBarItem(icon: Icon(Icons.menu), label: '메뉴'),
          BottomNavigationBarItem(icon: Icon(Icons.propane), label: '채소'),
          BottomNavigationBarItem(
              icon: Icon(Icons.supervisor_account), label: '내 정보'),
        ],
        onTap: (int index) {
          switch (index) {
            case 0:
              Navigator.pushNamed(context, '/home');
              break;
            case 1:
              Navigator.pushNamed(context, '/listshow');
              break;
            case 2:
              Navigator.pushNamed(context, '/mypage');
              break;
            default:
          }
        },
        selectedItemColor: const Color.fromRGBO(171, 204, 51, 1),
        unselectedItemColor: const Color.fromRGBO(171, 204, 51, 1),
        backgroundColor: Colors.white,
        type: BottomNavigationBarType.fixed,
      ),
    );
  }
}
