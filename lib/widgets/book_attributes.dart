
import 'package:flutter/material.dart';

import '../constants.dart';

class BookAttribute extends StatelessWidget {
  const BookAttribute(
      {super.key, required this.attribute, required this.description});
  final String attribute;
  final String description;
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.max,
      children: [
        const Icon(
          Icons.circle,
          size: 7,
        ),
        const SizedBox(
          width: 10,
        ),
        Text(
          attribute,
          style: const TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.w500,
          ),
        ),
        const Text(
          " :",
          style: TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.w500,
          ),
        ),
        const SizedBox(
          width: 3,
        ),
        Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(4),
            border: Border.all(
                color: kPrimaryColor
            ),
          ),
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 12,vertical: 2),
            child: Text(
              description,
              style: Theme.of(context).textTheme.bodyLarge!.copyWith(
                color: kPrimaryColor,
                fontSize: 16,
                fontWeight: FontWeight.w500,
              ),
            ),
          ),
        ),
        const SizedBox(
          height: 40,
        ),
      ],
    );
  }
}
