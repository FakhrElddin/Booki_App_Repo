import 'package:flutter/material.dart';

class MyBooksView extends StatelessWidget {
  const MyBooksView({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text('My Books Screen'),
        ],
      ),
    );
  }
}
