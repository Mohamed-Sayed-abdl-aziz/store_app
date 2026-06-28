import 'package:ecommerce/core/utils/app_colors.dart';
import 'package:flutter/material.dart';

class TextFieldWidget extends StatelessWidget {
  const TextFieldWidget({
    super.key,
    this.controller,
    required this.hintText,
    this.onTap,
    this.keyboardType,
  });
  final TextEditingController? controller;
  final String hintText;
  final void Function()? onTap;
  final TextInputType? keyboardType;

  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: controller,
      keyboardType: keyboardType,
      onTap: onTap,
      decoration: InputDecoration(
        filled: true,
        fillColor: Color(0xffEFEFEF),
        hint: Text(
          hintText,
          style: TextStyle(
            color: AppColors.borderDark,
            fontSize: 16,
            fontWeight: .w400,
          ),
        ),
        border: OutlineInputBorder(borderRadius: BorderRadius.circular(6)),
        focusedBorder: OutlineInputBorder(
          borderSide: BorderSide(color: AppColors.black),
          borderRadius: BorderRadius.circular(6),
        ),
      ),
    );
  }
}
