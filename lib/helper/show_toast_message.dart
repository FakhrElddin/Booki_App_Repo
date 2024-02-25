import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

void showToastMessage(context,
    {required String message, required ToastStates state,Widget Function(BuildContext, Widget)? positionedToastBuilder}){
  FToast fToast;
  fToast = FToast();
  fToast.init(context);

  FocusManager.instance.primaryFocus?.unfocus();

  fToast.showToast(
    isDismissable: true,
    gravity: ToastGravity.BOTTOM,
    toastDuration: const Duration(seconds: 5),
    child: Container(
      padding: const EdgeInsets.symmetric(
        vertical: 12.0,
        horizontal: 20.0,
      ),
      decoration: BoxDecoration(
        color: chooseToastColor(state),
        borderRadius: BorderRadius.circular(24.0),
      ),
      child: Text(
        message,
        style: const TextStyle(color: Colors.white, fontSize: 16.0),
      ),
    ),
    positionedToastBuilder: positionedToastBuilder,
    // (context, child){
    //   return Positioned(
    //     child: child,
    //     bottom: 16.0,
    //   );
    // },
  );
}

enum ToastStates {SUCCESS, ERROR, WARNING}

Color chooseToastColor(ToastStates state){
  Color color;
  switch(state){
    case ToastStates.SUCCESS:
      color = Colors.green;
      break;
    case ToastStates.ERROR:
      color = Colors.red;
      break;
    case ToastStates.WARNING:
      color = Colors.amber;
      break;
  }
  return color;
}