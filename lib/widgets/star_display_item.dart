import 'package:flutter/material.dart';
class StarDisplay extends StatelessWidget {
  final dynamic value;
  final double size;
    StarDisplay({ Key? key,required this.value, required this.size})
      : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: List.generate(5, (index) {
        return Padding(
          padding: const EdgeInsets.symmetric(horizontal: 2.25),
          child: Icon(
            index < value ? Icons.star : Icons.star_border,
            size: size,
          ),
        );
      }),
    );
  }

}