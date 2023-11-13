import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shopping_dsu/constants.dart';
import 'package:http/http.dart' as http;
import 'package:fluttertoast/fluttertoast.dart';
import '../api/api.dart';
import '../models/user.dart';

class SignupPage extends StatefulWidget {
  const SignupPage({super.key});

  @override
  State<SignupPage> createState() => _SignupPageState();
}

class _SignupPageState extends State<SignupPage> {
  var formKey = GlobalKey<FormState>();
  var regIDController = TextEditingController();
  var emailController = TextEditingController();
  var passwordController = TextEditingController();
  var nameController = TextEditingController();
  var phoneController = TextEditingController();

  checkUserEmail() async {
    // 중복되는 이메일 확인하는 구문
    try {
      var response = await http.post(Uri.parse(API.validateEmail),
          body: {'EMALE': emailController.text.trim()});

      if (response.statusCode == 200) {
        // 200이면 성공적인 통신
        var responseBody = jsonDecode(response.body);

        if (responseBody['existEmail'] == true) {
          Fluttertoast.showToast(msg: "이미 존재하는 이메일입니다.");
        } else {
          saveInfo(); // 동일한 이메일이 없을 때 회원가입 정보 저장
        }
      }
    } catch (e) {
      // 예외상황
      print(e.toString());
      Fluttertoast.showToast(msg: e.toString());
    }
  }

  saveInfo() async {
    // 중복 없을 시 저장되는 사용자 정보
    User userModel = User(
        1,
        regIDController.text.trim(),
        emailController.text.trim(),
        passwordController.text.trim(),
        nameController.text.trim(),
        phoneController.text.trim());

    try {
      var res = await http.post(Uri.parse(API.signup),
          body: userModel.toJson() // user 클래스에 정보 전달 및 포맷 변경
          );

      if (res.statusCode == 200) {
        // 잘 접속됐는지 확인
        var resSignup = jsonDecode(res.body);
        if (resSignup['success'] == true) {
          Fluttertoast.showToast(msg: '회원가입이 완료되었습니다.');
          setState(() {
            regIDController.clear();
            emailController.clear();
            passwordController.clear();
            nameController.clear();
            phoneController.clear(); // 회원가입 완료f되면 텍스트 필드 정보 삭제
          });
        } else {
          Fluttertoast.showToast(msg: '회원가입 중 오류가 발생하였습니다. 다시 시도해주세요.');
        }
      }
    } catch (e) {
      // 예외상황
      print(e.toString());
      Fluttertoast.showToast(msg: e.toString());
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
                  'assets/images/wandu.png',
                  width: 100,
                  height: 100,
                ),
                const SizedBox(
                  height: 30,
                ),
                const Text(
                  '회원가입',
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
                  //암호화 및 인증을 위한 form / textformfield 위젯
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
                              controller: regIDController,
                              validator: (val) =>
                                  val == "" ? "사용자 ID를 입력해주세요." : null,
                              // 값을 입력해주세용 입력 안하면 안됨
                              decoration: const InputDecoration(
                                  border: InputBorder.none,
                                  hintText: 'User ID'),
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
                            borderRadius: BorderRadius.circular(12),
                          ),
                          child: Padding(
                            padding: const EdgeInsets.only(left: 20.0),
                            child: TextFormField(
                              controller: emailController,
                              validator: (val) =>
                                  val == "" ? "이메일을 입력해주세요." : null,
                              decoration: const InputDecoration(
                                  border: InputBorder.none, hintText: 'Email'),
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
                        controller: nameController,
                        validator: (val) => val == "" ? "성함을 입력해주세요." : null,
                        decoration: const InputDecoration(
                            border: InputBorder.none, hintText: 'Name'),
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
                        controller: phoneController,
                        validator: (val) => val == "" ? "전화번호를 입력해주세요." : null,
                        decoration: const InputDecoration(
                            border: InputBorder.none, hintText: 'Phone number'),
                      ),
                    ),
                  ),
                ),
                const SizedBox(
                  height: 10,
                ),
                GestureDetector(
                  onTap: () {
                    if (formKey.currentState!.validate()) {
                      checkUserEmail();
                    } // php 사용 시 코드
                  }, // 다른 페이지로 이동 원할때 여기 사용
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
                            '가입하기',
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
                    const Text('이미 계정이 있으신가요? ',
                        style: TextStyle(
                            fontFamily: "pretendard",
                            color: Color.fromARGB(255, 182, 182, 182),
                            fontWeight: FontWeight.w300)),
                    GestureDetector(
                      onTap: () => Get.back(),
                      child: const Text(
                        '로그인하세요!',
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
