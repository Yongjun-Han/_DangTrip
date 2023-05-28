import 'dart:async';

import 'package:_dangtrip/layout/default_layout.dart';
import 'package:flutter/material.dart';
import 'package:naver_map_plugin/naver_map_plugin.dart';

class NaverMapTest extends StatefulWidget {
  const NaverMapTest({super.key});

  @override
  _NaverMapTestState createState() => _NaverMapTestState();
}

class _NaverMapTestState extends State<NaverMapTest> {
  Completer<NaverMapController> _controller = Completer();
  final MapType _mapType = MapType.Basic;

  @override
  Widget build(BuildContext context) {
    return DefaultLayout(
      title: "나의 주변",
      child: NaverMap(
        onMapCreated: onMapCreated,
        mapType: _mapType,
      ),
    );
  }

  void onMapCreated(NaverMapController controller) {
    if (_controller.isCompleted) _controller = Completer();
    _controller.complete(controller);
  }
}



// class Maps extends StatelessWidget {
//   WebViewController controller = WebViewController()
//     ..setJavaScriptMode(JavaScriptMode.unrestricted)
//     ..loadRequest(Uri.parse("https://google.com"));
//   // ..loadRequest(Uri.parse("http://192.168.132.1:7272"));

//   Maps({Key? key}) : super(key: key);

//   @override
//   Widget build(BuildContext context) {
//     double ratio = MediaQuery.of(context).devicePixelRatio;
//     return DefaultLayout(
//       title: '주변',
//       child: WebViewWidget(
//         controller: controller,
//       ),
//     );
//   }
// }
