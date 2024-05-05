import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import '../constants.dart';
import '../views/book_owner_view.dart';
import '../views/confirm_exchange.dart';
import 'book_details.dart';
import 'image_carousel.dart';
class BookViewItem extends StatelessWidget {
  const BookViewItem({super.key});

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
                Carousel(),
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
                    child: const Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Spacer(
                          flex: 1,
                        ),
                        CircleAvatar(
                          radius: 30,
                          backgroundImage: AssetImage(
                            'assets/images/profile.jpg',
                          ),
                        ),
                        Spacer(
                          flex: 6,
                        ),
                        Text(
                          'Book owner name',
                          style: TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                        Spacer(
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
                          return  Carousel();
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
