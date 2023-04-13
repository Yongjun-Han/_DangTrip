import 'package:_dangtrip/screens/splash.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const _App());
}

class _App extends StatelessWidget {
  const _App();
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        fontFamily: 'Pretendard',
      ),
      themeMode: ThemeMode.system,
      debugShowCheckedModeBanner: false,
      home: const SplashScreen(),
      // home: const OnBoard(),
    );
  }
}

// Future<bool> fetchData() async {
//   bool data = false;

//   // Change to API call
//   await Future.delayed(Duration(seconds: 3), () {
//     data = true;
//   });

//   return data;
// }
