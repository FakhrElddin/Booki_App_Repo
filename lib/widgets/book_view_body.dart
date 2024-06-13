import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:graduation_project/views/confirm_order.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';
import '../constants.dart';
import '../views/book_owner_view.dart';
import '../views/confirm_exchange.dart';
import 'book_details.dart';


class BookViewBody extends StatefulWidget {
  const BookViewBody({super.key});

  @override
  State<BookViewBody> createState() => _BookViewBodyState();
}

class _BookViewBodyState extends State<BookViewBody> {

  PageController bookImagesController = PageController();
  String imageName = 'Cover';
  final List<String> bookImage = const [
    'https://m.media-amazon.com/images/I/71xoHySBAEL.__AC_SX300_SY300_QL70_ML2_.jpg',
    'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTWhh8NZkGr5dMPDBFke865glqUt_iqGME6zg&usqp=CAU',
    'https://americanbookco.com/wp-content/uploads/2021/02/stacked-books.jpeg',
  ];

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Expanded(
          child: SingleChildScrollView(
            physics: const BouncingScrollPhysics(),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                const SizedBox(
                  height: 24,
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 16.0),
                  child: SizedBox(
                    height: 300,
                    child: PageView.builder(
                      physics: const BouncingScrollPhysics(),
                      controller: bookImagesController,
                      onPageChanged: (index) {
                        if(index == 0){
                         setState(() {
                           imageName = 'Cover';
                         });
                        }
                        else if(index == 1){
                          setState(() {
                            imageName = 'Printing';
                          });
                        }
                        else{
                          setState(() {
                            imageName = 'Stub';
                          });
                        }
                      },
                      itemBuilder: (context, index) => Center(
                        child: Stack(
                          alignment: Alignment.topLeft,
                          children: [
                            Image.network(
                              bookImage[index],
                              //width: 200,
                              height: 300,
                              fit: BoxFit.fill,
                            ),
                            Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Container(
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(20),
                                  color: Colors.white,
                                ),
                                child: Padding(
                                  padding: const EdgeInsets.symmetric(
                                    vertical: 4.0,
                                    horizontal: 8.0,
                                  ),
                                  child: Text(
                                    imageName,
                                    style: const TextStyle(
                                      fontSize: 16,
                                      color: kPrimaryColor,
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                      itemCount: bookImage.length,
                    ),
                  ),
                ),
                const SizedBox(
                  height: 24,
                ),
                SmoothPageIndicator(
                  controller: bookImagesController,
                  count: bookImage.length,
                  effect: const ExpandingDotsEffect(
                    activeDotColor: kPrimaryColor,
                    dotWidth: 10,
                    dotHeight: 10,
                  ),
                ),
                const SizedBox(
                  height: 24,
                ),
                const Text(
                  'Book name',
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(
                  height: 15,
                ),
                const BookDetails(
                    editiondetails: '1999',
                    categorydetails: 'Religious',
                    timeUseddetails: '2 years',
                    pricedetails: '200 L.E',
                    statusdetails: 'Good'),
                const SizedBox(
                  height: 20,
                ),
                const Divider(
                  height: 10,
                  thickness: 2.35,
                  color: Colors.grey,
                  indent: 50,
                  endIndent: 50,
                ),
                const SizedBox(
                  height: 10,
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20),
                  child: GestureDetector(
                    onTap: () {
                      Navigator.push(context,
                          MaterialPageRoute(builder: (context) {
                            return const BookOwnerProfile();
                          }));
                    },
                    child:  Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        const Spacer(
                          flex: 1,
                        ),
                        ClipRRect(
                          borderRadius: BorderRadius.circular(50),
                          child: CachedNetworkImage(
                            width: 50,
                            height: 50,
                            fit: BoxFit.cover,
                            imageUrl: "https://t3.ftcdn.net/jpg/06/92/34/64/240_F_692346400_UzYGmrJm6qhyPPXyZeUGuyEhkwr1iSFN.jpg",
                            progressIndicatorBuilder: (context, url, downloadProgress) =>
                                Center(child: CircularProgressIndicator(value: downloadProgress.progress)),
                            errorWidget: (context, url, error) => const Center(child: Icon(Icons.error)),
                          ),
                        ),
                        const Spacer(
                          flex: 10,
                        ),
                        const Text(
                          'Book owner name',
                          style: TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                        const Spacer(
                          flex: 50,
                        ),
                      ],
                    ),
                  ),
                ),
                const SizedBox(
                  height: 24,
                ),
              ],
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(
            left: 16,
            right: 16,
            bottom: 20,
          ),
          child: Row(
            children: [
              Expanded(
                flex: 2,
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    textStyle: const TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.w500,
                    ),
                    backgroundColor: kPrimaryColor,
                    fixedSize: const Size(220, 60),
                  ),
                  onPressed: () {
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) {
                          return  const ConfirmOrder();
                        }));
                  },
                  child: const Text(
                    'Order',
                  ),
                ),
              ),
              const SizedBox(
                width: 12,
              ),
              Expanded(
                flex: 1,
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    textStyle: const TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.w500,
                    ),
                    backgroundColor: const Color(0xffE2E7F0),
                    fixedSize: const Size(140, 60),
                    foregroundColor: Colors.black,
                  ),
                  onPressed: () {
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) {
                          return const ConfirmExchange();
                        }));
                  },
                  child: const Text(
                    'Exchange',
                  ),
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
