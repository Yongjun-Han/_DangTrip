import 'package:flutter/material.dart';

class DefaultLayout extends StatelessWidget {
  final Widget child;
  final Color? bgColor;

  const DefaultLayout({
    required this.child,
    this.bgColor,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: bgColor ?? Colors.white,
      body: child,
    );
  }
}
