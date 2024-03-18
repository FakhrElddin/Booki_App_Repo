import 'package:flutter/material.dart';
class StarDisplay extends StatelessWidget {
  final double value;
  final double size;
   const StarDisplay({ Key? key, this.value = 0, required this.size})
      : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: List.generate(5, (index) {
        return Icon(
          index < value ? Icons.star : Icons.star_border,
          size: size,
        );
      }),
    );
  }
}