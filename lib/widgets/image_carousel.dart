import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

import '../constants.dart';

class Carousel extends StatefulWidget {
  const Carousel({super.key});

  @override
  State<Carousel> createState() => _CarouselState();
}

class _CarouselState extends State<Carousel> {
  late PageController _pageController;
  int activePage = 1;
  List<String> images = [
    "https://mathjer.com/wp-content/uploads/2021/04/IBN-KHALDOON-SD.jpg",
    "https://mathjer.com/wp-content/uploads/2021/04/IBN-KHALDOON-CR.jpg",
    "https://uhdwallpapers.org/uploads/converted/20/01/14/the-mandalorian-5k-1920x1080_477555-mm-90.jpg"
  ];

  @override
  void initState() {
    super.initState();
    _pageController = PageController(viewportFraction: 0.8);
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(
          height: 320,
          width: 270,

          child: PageView.builder(
              itemCount: images.length,
              pageSnapping: true,
              controller: _pageController,
              onPageChanged: (page) {
                setState(() {
                  activePage = page;
                });
              },
              itemBuilder: (context, pagePosition) {
                return Container(
                  margin: EdgeInsets.all(5),
                  child: Stack(
                    children: [
                      Container(
                        child: CachedNetworkImage(
                          alignment: Alignment.bottomCenter,
                          width: 380,
                          height: 300,
                          fit: BoxFit.cover,
                          imageUrl:
                          images[pagePosition],
                          progressIndicatorBuilder:
                              (context, url, downloadProgress) => Center(
                              child: CircularProgressIndicator(
                                  value: downloadProgress.progress)),
                          errorWidget: (context, url, error) =>
                          const Center(child: Icon(Icons.error)),
                        ),
                      ),
                      Positioned(
                        top:
                        70,
                        left:
                        120,
                        child: Container(
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(18),
                            color: Colors.white,
                          ),
                          width: 55,
                          height: 18,// adjust width as needed
                          child:  const Center(
                            child: Text('Cover',
                              style: TextStyle(
                                fontSize: 12,
                                color: kPrimaryColor,
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                );
              }
              ),
        ),
        Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: indicators(images.length,activePage))
      ],
    );
  }
}
List<Widget> indicators(imagesLength,currentIndex) {
  return List<Widget>.generate(imagesLength, (index) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 20),
      child: Container(
        width: 16,
        height: 10,
        decoration: BoxDecoration(
            color: currentIndex == index ? Color(0xff1E7068) : Colors.black26,
            shape: BoxShape.circle),
      ),
    );
  });
}