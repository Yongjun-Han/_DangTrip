import 'package:_dangtrip/Common/const/colors.dart';
import 'package:_dangtrip/Common/const/data.dart';
import 'package:_dangtrip/layout/default_layout.dart';
import 'package:_dangtrip/screens/login.dart';
import 'package:flutter/material.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
  }

  void checkToken() async {
    final refreshToken = await storage.read(key: REFRESH_TOKEN_KEY);
    final accessToken = await storage.read(key: ACCESS_TOKEN_KEY);

    if (refreshToken == null || accessToken == null) {
      if (!mounted) return;
      Navigator.of(context).pushAndRemoveUntil(
        MaterialPageRoute(builder: (_) => const Login()),
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
