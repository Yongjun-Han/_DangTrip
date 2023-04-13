import 'dart:convert';

import 'package:_dangtrip/Common/Components/custom_button.dart';
import 'package:_dangtrip/Common/Components/text_input.dart';
import 'package:_dangtrip/Common/const/colors.dart';
import 'package:_dangtrip/Common/const/data.dart';
import 'package:_dangtrip/screens/home.dart';

import 'package:dio/dio.dart';
import 'package:flutter/material.dart';

import '../layout/default_layout.dart';

class Login extends StatefulWidget {
  const Login({super.key});

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  //아이디
  String username = '';
  //비밀번호
  String password = '';

  @override
  Widget build(BuildContext context) {
    final dio = Dio();

    //플랫폼별  localhost
    // const emulatorIp = '10.0.2.2:3000';
    const simulatorIp = '127.0.0.1:3000';

    // final ip = Platform.isIOS ? simulatorIp : emulatorIp;

    return DefaultLayout(
      child: SingleChildScrollView(
        keyboardDismissBehavior: ScrollViewKeyboardDismissBehavior.onDrag,
        child: SafeArea(
          top: true,
          bottom: false,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  IconButton(
                    onPressed: () {
                      Navigator.pop(context);
                    },
                    icon: const Icon(
                      Icons.keyboard_arrow_left_rounded,
                      size: 30,
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(right: 20),
                    child: TextButton(
                        onPressed: () async {
                          const refreshToken =
                              "eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ1c2VybmFtZSI6InRlc3RAY29kZWZhY3RvcnkuYWkiLCJzdWIiOiJmNTViMzJkMi00ZDY4LTRjMWUtYTNjYS1kYTlkN2QwZDkyZTUiLCJ0eXBlIjoicmVmcmVzaCIsImlhdCI6MTY4MTI4NjM1MywiZXhwIjoxNjgxMzcyNzUzfQ.DkBQsfZdJs2LLpKa0pJrUdmdAzcI0VNCDFcCCLEXDfQ";
                          final res = await dio.post(
                            'http://$simulatorIp/auth/token',
                            options: Options(headers: {
                              'authorization': 'Bearer $refreshToken',
                            }),
                          );
                          print(res.data);
                        },
                        child: const Text(
                          '회원가입',
                          style: TextStyle(color: PRIMARY_COLOR),
                        )),
                  ),
                ],
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    const SizedBox(
                      height: 20,
                    ),
                    const _Title(),
                    const SizedBox(
                      height: 20,
                    ),
                    const _IdTitle(),
                    const SizedBox(
                      height: 12,
                    ),
                    CustomTextInput(
                      hintText: '이메일을 입력해주세요',
                      // autofocus: true,
                      onChanged: (String value) {
                        // print(value);
                        username = value;
                      },
                      // errorText: '올바르지 않은 이메일 형식입니다',
                    ),
                    const SizedBox(
                      height: 16,
                    ),
                    const _PwTitle(),
                    const SizedBox(
                      height: 12,
                    ),
                    CustomTextInput(
                      onChanged: (value) {
                        password = value;
                      },
                      hintText: '비밀번호를 입력해주세요',
                      obscureText: true,
                      errorText: "영문, 특수문자, 숫자 중 반드시 2개 이상 포함되어야 합니다",
                      // errorText: '올바르지 않은 이메일 형식입니다',
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    GestureDetector(
                      onTap: () async {
                        // 아이디:비밀번호
                        final rawString = '$username:$password';
                        // print(rawString);
                        //일반 String 을 Base 64 로 변환하는법
                        Codec<String, String> stringToBase64 =
                            utf8.fuse(base64);

                        String token = stringToBase64.encode(rawString);
                        final res = await dio.post(
                          'http://$simulatorIp/auth/login',
                          options: Options(headers: {
                            'authorization': 'Basic $token',
                          }),
                        );

                        final refreshToken = res.data['refreshToken'];
                        final accessToken = res.data['accessToken'];

                        await storage.write(
                            key: REFRESH_TOKEN_KEY, value: refreshToken);
                        await storage.write(
                            key: ACCESS_TOKEN_KEY, value: accessToken);
                        if (!mounted) return;
                        Navigator.of(context).push(
                          MaterialPageRoute(
                            builder: (_) => const HomeScreen(),
                          ),
                        );

                        // showModalBottomSheet(
                        //   context: context,
                        //   builder: (BuildContext context) {
                        //     return Container(
                        //       height: 360,
                        //       decoration: const BoxDecoration(
                        //         color: Colors.white,
                        //       ),
                        //       child: Column(
                        //         children: [
                        //           Container(
                        //             height: 32,
                        //             decoration: const BoxDecoration(
                        //               color: Colors.black,
                        //             ),
                        //             child: Row(
                        //               mainAxisAlignment: MainAxisAlignment.end,
                        //               children: const [
                        //                 Icon(
                        //                   Icons
                        //                       .check_box_outline_blank_outlined,
                        //                   color: Colors.white54,
                        //                 ),
                        //                 SizedBox(
                        //                   width: 8,
                        //                 ),
                        //                 Text(
                        //                   '오늘하루 그만보기',
                        //                   style: TextStyle(
                        //                     fontWeight: FontWeight.bold,
                        //                     color: Colors.white54,
                        //                   ),
                        //                 ),
                        //                 SizedBox(
                        //                   width: 20,
                        //                 ),
                        //               ],
                        //             ),
                        //           ),
                        //           Expanded(
                        //             child: Container(
                        //               decoration: const BoxDecoration(
                        //                 color: Colors.white,
                        //               ),
                        //               child: Image.asset(
                        //                 'lib/assets/event/kanu_dog.jpg',
                        //                 fit: BoxFit.fill,
                        //               ),
                        //             ),
                        //           ),
                        //         ],
                        //       ),
                        //     );
                        //   },
                        // );
                      },
                      child: const CustomButton(
                        buttonTitle: '로그인',
                        buttonBgColor: PRIMARY_COLOR,
                      ),
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    const Text(
                      'OR',
                      style: TextStyle(
                        fontSize: 14,
                      ),
                      textAlign: TextAlign.center,
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    const CustomButton(
                      buttonTextColor: Color(0xff493523),
                      buttonTitle: '카카오톡 로그인',
                      buttonBgColor: Color(0xffF6E24B),
                    ),
                    const SizedBox(
                      height: 12,
                    ),
                    const CustomButton(
                      buttonTitle: '네이버 로그인',
                      buttonBgColor: Color(0xff5AC467),
                    ),
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}

class _Title extends StatelessWidget {
  const _Title();

  @override
  Widget build(BuildContext context) {
    return const Text(
      '로그인',
      style: TextStyle(
        fontSize: 32,
        fontWeight: FontWeight.w700,
      ),
    );
  }
}

class _IdTitle extends StatelessWidget {
  const _IdTitle();

  @override
  Widget build(BuildContext context) {
    return const Text(
      '아이디',
      style: TextStyle(
        fontWeight: FontWeight.bold,
        fontSize: 16,
      ),
    );
  }
}

class _PwTitle extends StatelessWidget {
  const _PwTitle();

  @override
  Widget build(BuildContext context) {
    return const Text(
      '비밀번호',
      style: TextStyle(
        fontWeight: FontWeight.bold,
        fontSize: 16,
      ),
    );
  }
}
