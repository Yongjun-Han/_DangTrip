import 'package:_dangtrip/Common/const/colors.dart';
import 'package:_dangtrip/Common/const/data.dart';
import 'package:_dangtrip/Common/secure/secure_storage.dart';
import 'package:_dangtrip/layout/default_layout.dart';
import 'package:_dangtrip/screens/home.dart';
import 'package:_dangtrip/screens/login.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class SplashScreen extends ConsumerStatefulWidget {
  const SplashScreen({super.key});

  @override
  ConsumerState<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends ConsumerState<SplashScreen> {
  @override
  void initState() {
    super.initState();
    // deleteToken();
    checkToken();
  }

  void deleteToken() async {
    final storage = ref.read(secureStorageProvider);
    await storage.deleteAll();
  }

  void checkToken() async {
    final storage = ref.read(secureStorageProvider);

    final refreshToken = await storage.read(key: REFRESH_TOKEN_KEY);
    final accessToken = await storage.read(key: ACCESS_TOKEN_KEY);

    final dio = Dio();

    try {
      final res = await dio.post(
        'http://$ip/auth/token',
        options: Options(
          headers: {
            'authorization': 'Bearer $refreshToken',
          },
        ),
      );
      await storage.write(
          key: ACCESS_TOKEN_KEY, value: res.data['accessToken']);
      //문제가 없다면 홈 화면으로
      Navigator.of(context).pushAndRemoveUntil(
        MaterialPageRoute(
          builder: (_) => const HomeScreen(),
        ),
        (route) => false,
      );
      //문제가 있다면 로그인 화면으로
    } catch (e) {
      Navigator.of(context).pushAndRemoveUntil(
        MaterialPageRoute(
          builder: (_) => const Login(),
        ),
        (route) => false,
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return DefaultLayout(
        bgColor: PRIMARY_COLOR,
        child: SizedBox(
          width: MediaQuery.of(context).size.width,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Image.asset(
                'lib/assets/logo/splash.png',
                width: MediaQuery.of(context).size.width / 3,
              ),
              const SizedBox(
                height: 16,
              ),
              const CircularProgressIndicator(
                strokeWidth: 2,
                color: Colors.white,
              )
            ],
          ),
        ));
  }
}
