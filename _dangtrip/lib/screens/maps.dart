import 'package:_dangtrip/layout/default_layout.dart';
import 'package:flutter/material.dart';
import 'package:webview_flutter/webview_flutter.dart';

class Maps extends StatelessWidget {
  WebViewController controller = WebViewController()
    ..setJavaScriptMode(JavaScriptMode.unrestricted)
    ..loadRequest(Uri.parse("http://192.168.132.1:7272/map"));

  Maps({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return DefaultLayout(
      title: '주변',
      child: WebViewWidget(
        controller: controller,
      ),
    );
  }
}
