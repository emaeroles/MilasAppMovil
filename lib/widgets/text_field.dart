import 'package:flutter/material.dart';
import 'package:milas_app_movil/core/styles.dart';

class AppTextField extends StatelessWidget {
  final String label;
  final TextEditingController controller;
  final TextInputType keyboardType;
  final String? Function(String?)? validator;
  final bool obscureText;

  const AppTextField({
    super.key,
    required this.label,
    required this.controller,
    this.keyboardType = TextInputType.text,
    this.validator,
    this.obscureText = false,
  });

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller,
      keyboardType: keyboardType,
      validator: validator,
      obscureText: obscureText,
      style: Styles.textStyle.copyWith(fontSize: 16),
      cursorColor: Color(0xFFe3e3e3),
      decoration: InputDecoration(
        labelText: label,
        labelStyle: Styles.textStyle.copyWith(fontSize: 20),
        filled: true,
        fillColor: Color(0xFF3b3b3b),
        contentPadding: EdgeInsets.symmetric(horizontal: 16, vertical: 12),
        enabledBorder: OutlineInputBorder(
          borderSide: BorderSide(color: Color(0xFF858585)),
        ),
        focusedBorder: OutlineInputBorder(
          borderSide: BorderSide(color: Color(0xFFFFFFFF), width: 1.0),
        ),
      ),
    );
  }
}

// en StatefulWidget, es buan practica hacer esto
//@override
//void dispose() {
//  nameController.dispose();
//  super.dispose();
//}
