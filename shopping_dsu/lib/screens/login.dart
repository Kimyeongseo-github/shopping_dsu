import 'package:flutter/material.dart';
import 'dart:convert';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:http/http.dart' as http;
import 'package:get/get.dart';
import 'package:shopping_dsu/constants.dart';
import 'package:shopping_dsu/screens/mainpage/main_screen.dart';
import '../api/api.dart';
import 'signup.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});
  static String routeName = "/login";

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  var formKey = GlobalKey<FormState>();
  var emailController = TextEditingController();
  var passwordController = TextEditingController();

  userLogin() async {
    try {
      var res = await http.post(Uri.parse(API.login), body: {
        // 로그인 가능 여부 판단
        'EMALE': emailController.text.trim(),
        'PASSWORD': passwordController.text.trim()
      });

      if (res.statusCode == 200) {
        // 잘 접속됐는지 확인
        // 통신 성공 == 200
        var resLogin = jsonDecode(res.body);
        if (resLogin['success'] == true) {
          Fluttertoast.showToast(msg: '로그인이 완료되었습니다.');

          Get.offAll(const MainScreen());

          setState(() {
            emailController.clear();
            passwordController.clear(); // 로그인 완료되면 텍스트 필드 정보 삭제
          });
        } else {
          Fluttertoast.showToast(msg: '이메일 및 비밀번호가 틀립니다. 다시 시도해주세요.');
        }
      }
    } catch (e) {
      print(e.toString());
      Fluttertoast.showToast(msg: e.toString());

      @override
      Widget build(BuildContext context) {
        // TODO: implement build
        throw UnimplementedError();
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Center(
          child: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Image.asset(
                  'assets/images/wanduhappy.png',
                  width: 100,
                  height: 100,
                ),
                const SizedBox(
                  height: 30,
                ),
                const Text(
                  '반갑습니다!',
                  style: TextStyle(
                    fontFamily: "hanna",
                    fontWeight: FontWeight.w400,
                    fontSize: 32,
                    color: kPrimaryColor,
                  ),
                ),
                const SizedBox(
                  height: 10,
                ),
                const Text(
                  '못난이 채소와 함께해주세요!',
                  style: TextStyle(
                    fontFamily: "pretendard",
                    fontWeight: FontWeight.w400,
                    fontSize: 20,
                    color: Color.fromARGB(255, 182, 182, 182),
                  ),
                ),
                const SizedBox(
                  height: 50,
                ),
                Form(
                  key: formKey,
                  child: Column(
                    children: [
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 25.0),
                        child: Container(
                          decoration: BoxDecoration(
                            color: Colors.grey[200],
                            border: Border.all(color: Colors.white),
                            borderRadius: BorderRadius.circular(12),
                          ),
                          child: Padding(
                            padding: const EdgeInsets.only(left: 20.0),
                            child: TextFormField(
                              controller: emailController,
                              validator: (val) =>
                                  val == "" ? "이메일을 입력해주세요." : null,
                              decoration: const InputDecoration(
                                border: InputBorder.none,
                                hintText: 'Email',
                              ),
                            ),
                          ),
                        ),
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 25.0),
                        child: Container(
                          decoration: BoxDecoration(
                              color: Colors.grey[200],
                              border: Border.all(color: Colors.white),
                              borderRadius: BorderRadius.circular(12)),
                          child: Padding(
                            padding: const EdgeInsets.only(left: 20.0),
                            child: TextFormField(
                              controller: passwordController,
                              validator: (val) =>
                                  val == "" ? "비밀번호를 입력해주세요." : null,
                              obscureText: true,
                              decoration: const InputDecoration(
                                  border: InputBorder.none,
                                  hintText: 'Password'),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                const SizedBox(
                  height: 10,
                ),
                GestureDetector(
                  onTap: () {
                    // Get.offAll(() => const MainScreen());
                    if (formKey.currentState!.validate()) {
                      userLogin();
                    }
                  },
                  // php 적용됐을 시 코드
                  // 다른 페이지로 이동 원할때 여기 사용
                  child: Container(
                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 25.0),
                      child: Container(
                        padding: const EdgeInsets.all(20),
                        decoration: BoxDecoration(
                            color: kPrimaryColor,
                            borderRadius: BorderRadius.circular(12)),
                        child: const Center(
                          child: Text(
                            '로그인',
                            style: TextStyle(
                              fontFamily: "pretendard",
                              fontWeight: FontWeight.w400,
                              color: Colors.white,
                              fontSize: 14,
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
                const SizedBox(
                  height: 25,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Text(
                      '아직 회원이 아니신가요? ',
                      style: TextStyle(
                          fontFamily: "pretendard",
                          color: Color.fromARGB(255, 182, 182, 182),
                          fontWeight: FontWeight.w300),
                    ),
                    GestureDetector(
                      onTap: () => Get.to(() => const SignupPage()),
                      child: const Text(
                        '지금 가입하세요!',
                        style: TextStyle(
                            fontFamily: "pretendard",
                            color: kPrimaryColor,
                            fontWeight: FontWeight.w300),
                      ),
                    )
                  ],
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
