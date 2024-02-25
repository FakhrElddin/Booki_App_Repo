import 'package:flutter/material.dart';

void  showSnackBar(
    BuildContext context, String message,
    {
      EdgeInsetsGeometry? margin,
      DismissDirection dismissDirection = DismissDirection.down,
      Color? backgroundColor,
      SnackBarBehavior? behavior,
    }) {
  ScaffoldMessenger.of(context).showSnackBar(
    SnackBar(
        content: Text(
          message,
        ),
      margin: margin,
      dismissDirection: dismissDirection,
      backgroundColor: backgroundColor,
      behavior: behavior,
        ),
  );
}