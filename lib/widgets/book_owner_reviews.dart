import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:graduation_project/widgets/star_display_item.dart';

class BookOwnerReviews extends StatelessWidget {
   const BookOwnerReviews({super.key, required this.userImage, required this.rate});
   final String userImage;
   final double rate;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 35),
      child: Row(
        children: [
          const Spacer(
            flex: 1,
          ),
          ClipRRect(
            child: CachedNetworkImage(
              imageUrl: userImage,
              imageBuilder: (context, imageProvider) => Container(
                width: 45.0,
                height: 45.0,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  image: DecorationImage(
                      image: imageProvider, fit: BoxFit.cover),
                ),
              ),
              progressIndicatorBuilder: (context, url, downloadProgress) =>
                  Center(child: CircularProgressIndicator(value: downloadProgress.progress)),
              errorWidget: (context, url, error) => const Center(child: Icon(Icons.error)),
            ),
          ),
          const Spacer(
            flex: 1,
          ),
          Container(
            height: 60,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(5),
                color: Color(0xffEDF0F7)
            ),
            child:
             Padding(
              padding: EdgeInsets.all(8.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text('It was a pleasure to deal with you',
                    style: TextStyle(
                      fontSize: 15,
                    ),
                    maxLines: 1,
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 10),
                    child: StarDisplay(value: rate,size: 15),
                  )
                ],
              ),
            ),
          ),
          const Spacer(
            flex: 8,
          ),
        ],
      ),
    );
  }
}
