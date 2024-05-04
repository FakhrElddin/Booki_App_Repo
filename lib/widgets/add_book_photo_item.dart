import 'package:flutter/material.dart';

class AddBookPhotoItem extends StatelessWidget {
  const AddBookPhotoItem({super.key, required this.photoName, this.onTap});

  final String photoName;
  final void Function()? onTap;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Column(
        children: [
          Stack(
            alignment: AlignmentDirectional.center,
            children: [
              Container(
                height: 200,
                decoration: BoxDecoration(
                  color: Colors.grey[300],
                  borderRadius: BorderRadius.circular(10),
                ),
              ),
              Icon(
                Icons.add,
                size: 32,
              ),
            ],
          ),
          SizedBox(
            height: 8,
          ),
          Text(
            photoName,
          ),
        ],
      ),
    );
  }
}
