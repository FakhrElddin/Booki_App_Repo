import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:graduation_project/constants.dart';
import 'package:graduation_project/cubits/app_cubit/app_cubit.dart';

class CategoryButton extends StatelessWidget {
  const CategoryButton({super.key, required this.text, required this.backgroundColor, required this.textColor, this.onPressed});

  final String text;
  final Color backgroundColor;
  final Color textColor;
  final Function()? onPressed;
  //final int index;

  @override
  Widget build(BuildContext context) {
    return OutlinedButton(
      onPressed: onPressed,
      style: OutlinedButton.styleFrom(
        backgroundColor: backgroundColor,
        side: const BorderSide(
          color: kPrimaryColor,
        ),
      ),
      child: Text(
        text,
        style: TextStyle(
          color: textColor,
        ),
      ),
    );
  }
}
