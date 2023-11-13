import 'package:flutter/material.dart';
import 'package:shopping_dsu/routs.dart';
import 'package:shopping_dsu/screens/splash/splash_screen.dart';
import 'package:get/get.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        scaffoldBackgroundColor: Colors.white,
        fontFamily: "hanna",
        textTheme: const TextTheme(
            bodyLarge: TextStyle(color: Color.fromARGB(255, 182, 182, 182)),
            bodyMedium: TextStyle(color: Color.fromARGB(255, 182, 182, 182)),
            bodySmall: TextStyle(
                color: Color.fromARGB(255, 182, 182, 182)) // 일단 설정해두는 컬러
            ),
        // colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        // useMaterial3: true,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: const SplashScreen(),
      initialRoute: SplashScreen.routeName,
      routes: routes,
    );
  }
}
