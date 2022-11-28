import 'package:flutter/material.dart';

class CustomTextFieldPerfil extends StatelessWidget {
  final TextInputType? keyboardType;
  final String? hintText;
  final Widget? prefixIcon;
  final TextEditingController? controller;

  const CustomTextFieldPerfil(
      {this.keyboardType, this.hintText, this.prefixIcon, this.controller});

  static const Color primaryColor = const Color.fromARGB(255, 0, 23, 63);
  static const Color secondColor = const Color(0xFFFF6C44);

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      style: const TextStyle(
        color: primaryColor,
        fontWeight: FontWeight.w500,
        fontSize: 16,
      ),
      controller: controller,
      keyboardType: TextInputType.text,
      decoration: InputDecoration(
        enabledBorder: OutlineInputBorder(
          borderSide: BorderSide(
            width: 2,
            color: Colors.grey.shade300,
          ),
          borderRadius: BorderRadius.circular(20.0),
        ),
        focusedBorder: OutlineInputBorder(
          borderSide: const BorderSide(
            width: 2,
            color: secondColor,
          ),
          borderRadius: BorderRadius.circular(20.0),
        ),
        filled: true,
        fillColor: Colors.white,

        hintText: hintText,
        //  Text('Mi Nombre es: ${PreferencesAccountCreate.nombre}'),
        hintStyle: const TextStyle(color: Colors.grey),
        prefixIcon: prefixIcon,
        contentPadding: const EdgeInsets.all(20.0),
      ),
    );
    /*TextFormField(
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
    );*/
  }
}
