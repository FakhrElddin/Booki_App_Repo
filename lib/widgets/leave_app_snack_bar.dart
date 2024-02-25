import 'package:flutter/material.dart';

SnackBar closeAppSnackBar() => SnackBar(
  content: const Center(
    child: Text('Tap back again to leave app',),
  ),
  behavior: SnackBarBehavior.floating,
  margin: const EdgeInsets.symmetric(horizontal: 60,vertical: 10,),
  dismissDirection: DismissDirection.horizontal,
  backgroundColor: Colors.grey[750],
);
