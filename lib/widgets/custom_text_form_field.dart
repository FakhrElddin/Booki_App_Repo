import 'package:flutter/material.dart';
import 'package:graduation_project/constants.dart';

class CustomTextFormField extends StatelessWidget {
  const CustomTextFormField({super.key, this.hintText, this.suffixIcon, this.labelText, this.textInputType, this.isPassword = false, this.onFieldSubmitted, this.validator, this.textInputAction, this.onChanged, this.controller, this.readOnly = false, this.filledColor, this.fillColor, this.hintFontSize, this.prefixIcon});

  final String? hintText;
  final Widget? suffixIcon;
  final Widget? prefixIcon;
  final String? labelText;
  final TextInputType? textInputType;
  final bool isPassword;
  final void Function(String?)? onFieldSubmitted;
  final void Function(String)? onChanged;
  final String? Function(String?)? validator;
  final TextInputAction? textInputAction;
  final TextEditingController? controller;
  final bool? readOnly;
  final bool? filledColor;
  final Color? fillColor;
  final double? hintFontSize;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      readOnly: readOnly!,
      textInputAction: textInputAction,
      controller: controller,
      onChanged: onChanged,
      onFieldSubmitted: onFieldSubmitted,
      validator: validator,
      obscureText: isPassword,
      keyboardType: textInputType,
      decoration: InputDecoration(
        labelText: labelText,
        hintText: hintText,
        suffixIcon: suffixIcon,
        prefixIcon: prefixIcon,
        fillColor: fillColor,
        filled: filledColor,
        labelStyle: const TextStyle(
          color: Colors.black,
        ),
        hintStyle: TextStyle(
          fontSize: hintFontSize,
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
          borderSide: const BorderSide(
            color: kPrimaryColor,
          ),
        ),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
        ),
      ),
    );
  }
}
