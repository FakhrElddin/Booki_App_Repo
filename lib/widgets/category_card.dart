import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

class CategoryCard extends StatelessWidget {
  const CategoryCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: Alignment.center,
      children: [
        ClipRRect(
          borderRadius: BorderRadius.circular(10),
          child: CachedNetworkImage(
            width: 180,
            height: 120,
            fit: BoxFit.cover,
            imageUrl: "https://t4.ftcdn.net/jpg/00/49/71/35/360_F_49713581_8kDklyvFqPNaAP4CUlS5gpCcXKgZGQwE.jpg",
            progressIndicatorBuilder: (context, url, downloadProgress) =>
                Center(child: CircularProgressIndicator(value: downloadProgress.progress)),
            errorWidget: (context, url, error) => const Center(child: Icon(Icons.error)),
          ),
        ),
        const Text(
          'Historical',
          style: TextStyle(
            color: Colors.white,
          ),
        ),
      ],
    );
  }
}
