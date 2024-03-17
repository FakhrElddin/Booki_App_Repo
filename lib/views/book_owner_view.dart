import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class BookOwnerProfile extends StatelessWidget {
  const BookOwnerProfile({super.key});

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
        appBar: AppBar(
          centerTitle: true,
          title: const Text(
            'Profile',
            style: TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.bold,
            ),
          ),
          leading: IconButton(
            onPressed: () {
              Navigator.pop(context);
            },
            icon: const Icon(
              Icons.arrow_back_ios_new_sharp,
              color: Colors.black,
            ),
          ),
          actions: [
            IconButton(
              onPressed: () {},
              padding: const EdgeInsetsDirectional.only(end: 8),
              icon: const Icon(
                Icons.favorite_border_outlined,
                size: 28,
                color: Colors.black,
              ),
            ),
          ],
        ),
        body:Center(
          child: Column(
            children: [
              SizedBox(
                height: 25,
              ),
              ClipRRect(
                child: CachedNetworkImage(
                  fit: BoxFit.fill,
                  imageUrl: "https://hips.hearstapps.com/hmg-prod/images/lionel-messi-celebrates-after-their-sides-third-goal-by-news-photo-1686170172.jpg?crop=0.66653xw:1xh;center,top&resize=1200:*",
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
                      Center(child: CircularProgressIndicator(value: downloadProgress.progress)),
                  errorWidget: (context, url, error) => const Center(child: Icon(Icons.error)),
                ),
              ),
              SizedBox(
                height: 40,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Spacer(
                    flex: 1,
                  ),
                  Text("Cairo",
                    style: TextStyle(
                      fontSize: 18,
                    ),
                  ),
                  Spacer(
                    flex: 3,
                  ),
                  Text("Book Owner Name",
                  style: TextStyle(
                    fontWeight: FontWeight.w500,
                  ),
                  ),
                  Spacer(
                    flex: 7,
                  ),
                ],
              ),
            ],
          ),
        )
    );
  }
}
