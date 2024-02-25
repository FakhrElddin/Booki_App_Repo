import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:graduation_project/constants.dart';

ThemeData lightTheme(context){
  return ThemeData(
    useMaterial3: false,
    primarySwatch: kPrimaryColor,
    scaffoldBackgroundColor: Colors.white,
    appBarTheme: const AppBarTheme(
      titleSpacing: 16,
      systemOverlayStyle: SystemUiOverlayStyle(
        statusBarColor: Colors.white,
        statusBarIconBrightness: Brightness.dark,
      ),
      backgroundColor: Colors.white,
      elevation: 0,
      titleTextStyle: TextStyle(
        color: Colors.black,
        fontSize: 20,
        fontWeight: FontWeight.bold,
      ),
      iconTheme: IconThemeData(
        color: kPrimaryColor,
      ),
// actionsIconTheme: IconThemeData(
//   color: Colors.black,
// ),
    ),
    bottomNavigationBarTheme: const BottomNavigationBarThemeData(
      selectedLabelStyle: TextStyle(
        fontWeight: FontWeight.bold,
      ),
      unselectedLabelStyle: TextStyle(
        fontWeight: FontWeight.bold,
      ),
      type: BottomNavigationBarType.fixed,
      selectedItemColor: kPrimaryColor,
      elevation: 10,
      backgroundColor: Colors.white,
      selectedIconTheme: IconThemeData(
        size: 30,
      ),

    ),
    inputDecorationTheme: const InputDecorationTheme(
      focusedBorder: OutlineInputBorder(
        borderSide: BorderSide(
          color: kPrimaryColor,
        ),
      ),
    ),
    progressIndicatorTheme: const ProgressIndicatorThemeData(
      color: kPrimaryColor,
    ),
    textTheme: const TextTheme(
      bodyMedium: TextStyle(
        fontSize: 24,
        color: Colors.black,
        //fontWeight: FontWeight.bold,
      ),
    ),
  );
}