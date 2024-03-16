import 'package:flutter/material.dart';

class BookOwnerProfile extends StatelessWidget {
  const BookOwnerProfile({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
        body:Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text("Book Owner Screen"),
            ],
          ),
        )
    );
  }
}
