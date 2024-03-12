import 'package:flutter/material.dart';
class BookView extends StatelessWidget {
  const BookView({super.key});

  @override
  Widget build(BuildContext context) {
    return const Column(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        SizedBox(
          height: 15,
        ),
        Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
             Icon(
                  Icons.arrow_back_ios_new_sharp,
                ),
          ],
        ),
      ],
    );
  }
}
