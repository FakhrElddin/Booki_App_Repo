import 'package:flutter/material.dart';

class MyBooksView extends StatelessWidget {
  const MyBooksView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: SizedBox(
        width: 70,
        height: 70,
        child: FloatingActionButton(
          onPressed: (){},
          child: const Icon(
            Icons.add,
            size: 32,
          ),
        ),
      ),
      body: Column(),
    );
  }
}
