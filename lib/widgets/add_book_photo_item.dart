import 'dart:io';

import 'package:flutter/material.dart';

class AddBookPhotoItem extends StatelessWidget {
  const AddBookPhotoItem({super.key, required this.photoName, this.onTap, this.imagePath});

  final String photoName;
  final void Function()? onTap;
  final File? imagePath;
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
              const Icon(
                Icons.add,
                size: 32,
              ),
              if(imagePath != null)
              ClipRRect(
                borderRadius: BorderRadius.circular(10),
                child: Image.file(
                  imagePath!,
                  fit: BoxFit.cover,
                  height: 200,
                ),
              ),
            ],
          ),
          const SizedBox(
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
