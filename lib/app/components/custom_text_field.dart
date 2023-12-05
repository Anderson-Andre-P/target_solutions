import 'package:flutter/material.dart';

class CustomTextField extends StatelessWidget {
  final TextEditingController controller;
  final String labelText;
  final bool isPassword;
  final Widget prefixIcon;

  const CustomTextField({
    super.key,
    required this.controller,
    required this.labelText,
    this.isPassword = false,
    required this.prefixIcon,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(10),
      ),
      child: TextFormField(
        controller: controller,
        obscureText: isPassword,
        decoration: InputDecoration(
          labelText: labelText,
          border: InputBorder.none,
          contentPadding: const EdgeInsets.all(8),
          prefixIcon: prefixIcon,
          fillColor: Colors.black,
          focusColor: Colors.black,
        ),
      ),
    );
  }
}
