import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:graduation_project/widgets/star_display_item.dart';


class BookOwnerInfo extends StatelessWidget {
  const BookOwnerInfo({super.key});
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          const SizedBox(
            height: 25,
          ),
          ClipRRect(
            child: CachedNetworkImage(
              fit: BoxFit.fill,
              imageUrl:
              "https://hips.hearstapps.com/hmg-prod/images/lionel-messi-celebrates-after-their-sides-third-goal-by-news-photo-1686170172.jpg?crop=0.66653xw:1xh;center,top&resize=1200:*",
              imageBuilder: (context, imageProvider) => Container(
                width: 180.0,
                height: 180.0,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  image: DecorationImage(
                      image: imageProvider, fit: BoxFit.cover),
                ),
              ),
              progressIndicatorBuilder: (context, url, downloadProgress) =>
                  Center(
                      child: CircularProgressIndicator(
                          value: downloadProgress.progress)),
              errorWidget: (context, url, error) =>
              const Center(child: Icon(Icons.error)),
            ),
          ),
          const SizedBox(
            height: 40,
          ),
          const Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Spacer(
                flex: 1,
              ),
              Text(
                "Cairo",
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.w500,
                ),
              ),
              Spacer(
                flex: 4,
              ),
              Text(
                "Book Owner Name",
                style: TextStyle(
                  fontWeight: FontWeight.w500,
                ),
              ),
              Spacer(
                flex: 8,
              ),
            ],
          ),
          const SizedBox(
            height: 20,
          ),
          const StarDisplay(
            value: 4,
            size: 35,
          ),
        ],
      ),
    );
  }
}
