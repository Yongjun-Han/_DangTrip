import 'package:flutter/material.dart';

class CustomButton extends StatelessWidget {
  final String buttonTitle;
  final Color buttonBgColor;
  final Color? buttonTextColor;

  const CustomButton({
    required this.buttonTitle,
    required this.buttonBgColor,
    this.buttonTextColor = Colors.white,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          color: buttonBgColor, borderRadius: BorderRadius.circular(15)),
      child: Padding(
        padding: const EdgeInsets.symmetric(
          vertical: 22,
        ),
        child: Text(
          buttonTitle,
          style: TextStyle(
              fontSize: 14,
              fontWeight: FontWeight.w700,
              color: buttonTextColor),
          textAlign: TextAlign.center,
        ),
      ),
    );
  }
}
