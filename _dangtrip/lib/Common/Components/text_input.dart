import 'package:_dangtrip/Common/const/colors.dart';
import 'package:flutter/material.dart';

class CustomTextInput extends StatelessWidget {
  final String? hintText;
  final String? errorText;
  final bool obscureText;
  final bool autofocus;
  final ValueChanged<String>? onChanged;

  const CustomTextInput({
    this.hintText,
    this.errorText,
    this.obscureText = false,
    this.autofocus = false,
    required this.onChanged,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    const focusBorder = OutlineInputBorder(
      borderSide: BorderSide(
        color: TEXT_INPUT_BORDER_COLOR,
        width: 0,
      ),
    );

    return TextFormField(
      cursorColor: PRIMARY_COLOR,
      obscureText: obscureText,
      autofocus: autofocus,
      onChanged: onChanged,
      decoration: InputDecoration(
        contentPadding: const EdgeInsets.all(20),
        hintText: hintText,
        errorText: errorText,
        hintStyle: const TextStyle(
          color: TEXT_DIMMED,
          fontSize: 14,
        ),
        fillColor: TEXT_INPUT_COLOR,
        filled: true,
        border: InputBorder.none,
        focusedBorder: focusBorder,
      ),
    );
  }
}
