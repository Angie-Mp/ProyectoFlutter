import 'package:flutter/material.dart';

class CustomTextFieldWidget extends StatelessWidget {
  final TextInputType? keyboardType;
  final String? hintText;
  final Widget? prefixIcon;
  final TextEditingController? controller;

  const CustomTextFieldWidget(
      {this.keyboardType, this.hintText, this.prefixIcon, this.controller});

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      style: const TextStyle(color: Color(0xFFFF6C44)),
      controller: controller,
      keyboardType: keyboardType,
      decoration: InputDecoration(
        enabledBorder: OutlineInputBorder(
          borderSide: const BorderSide(width: 2, color: Color(0xFFFF6C44)),
          borderRadius: BorderRadius.circular(10),
        ),
        focusedBorder: OutlineInputBorder(
          borderSide: const BorderSide(width: 2, color: Color(0xFFFF6C44)),
          borderRadius: BorderRadius.circular(10),
        ),
        filled: true,
        fillColor: Colors.white,
        hintText: hintText,
        hintStyle: const TextStyle(color: Colors.grey),
        prefixIcon: prefixIcon,
        contentPadding: const EdgeInsets.all(18),
      ),
    );
  }
}
