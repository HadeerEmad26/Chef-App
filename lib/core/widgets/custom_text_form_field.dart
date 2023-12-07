import 'package:flutter/material.dart';

import '../utils/app_color.dart';

class CustomTextFormField extends StatelessWidget {
  const CustomTextFormField({
    super.key,
    required this.controller,
    this.hint,
    this.label,
    this.validator,
    this.isPassword = false,
    this.icon,
    this.suffixIconOnPressed,
  });
  final TextEditingController controller;
  final String? hint;
  final String? label;
  final String? Function(String?)? validator;
  final bool isPassword;
  final IconData? icon;
  final VoidCallback? suffixIconOnPressed;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      validator: validator,
      obscureText: isPassword,
      controller: TextEditingController(),
      cursorColor: AppColors.primary,
      decoration: InputDecoration(
          hintText: hint,
          labelText: label,
          suffixIcon: IconButton(
            onPressed: suffixIconOnPressed,
            icon: Icon(icon,color: AppColors.primary,),
          )),
    );
  }
}
