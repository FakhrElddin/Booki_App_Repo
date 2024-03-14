import 'package:flutter/material.dart';
class BookDetails extends StatelessWidget {
   const BookDetails({super.key, required this.attribute, required this.description});
 final String? attribute;
 final String? description;
  @override
  Widget build(BuildContext context) {
    return  Padding(
      padding: const EdgeInsets.only(left: 25),
      child: Row(
        mainAxisSize: MainAxisSize.max,
        children: [
           const Icon(Icons.circle,
            size: 7,
          ),
          const SizedBox(
            width: 10,
          ),
          Text(attribute!,
            style: const TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.w500,
            ),
          ),
          const Text(" :",
            style: TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.w500,
            ),
          ),
          const SizedBox(
            width: 5,
          ),
          Text(description!,
            style: const TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.w500,
            ),
          ),
          const SizedBox(
            height: 40,
          ),
        ],
      ),
    );
  }
}
