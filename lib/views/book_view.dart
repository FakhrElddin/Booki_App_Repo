import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:graduation_project/constants.dart';
import 'package:graduation_project/views/confirm_exchange.dart';
import 'package:graduation_project/views/confirm_order.dart';
import 'package:graduation_project/widgets/book_details.dart';
import 'book_owner_view.dart';

class BookView extends StatelessWidget {
  const BookView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text(
          'Book page',
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
      body: Column(
        children: [
          Expanded(
            child: SingleChildScrollView(
              physics: const BouncingScrollPhysics(),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Center(
                    child:
                    Stack(
                      children: [
                        ClipRRect(
                          child: CachedNetworkImage(
                            width: 350,
                            height: 360,
                            fit: BoxFit.fill,
                            imageUrl: "https://m.media-amazon.com/images/I/518m+S44fdL.jpg",
                            progressIndicatorBuilder: (context, url, downloadProgress) =>
                                Center(child: CircularProgressIndicator(value: downloadProgress.progress)),
                            errorWidget: (context, url, error) => const Center(child: Icon(Icons.error)),
                          ),
                        ),
                      ],

                    ),
                  ),
                  const Text(
                    'Book name',
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(
                    height: 30,
                  ),
                  const BookDetails(editiondetails: '1999', categorydetails: 'Religious', timeUseddetails: '2 years', pricedetails: '200 L.E', statusdetails: 'Good'),
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
                        return const ConfirmOrder();
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
      ),
    );
  }
}
