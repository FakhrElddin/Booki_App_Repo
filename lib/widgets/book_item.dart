import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:graduation_project/views/book_view.dart';

class BookItem extends StatelessWidget {
  const BookItem({super.key});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.push(context, MaterialPageRoute(builder: (context) {
          return BookView();
        }));
      },
      child: SizedBox(
        width: 120,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Stack(
              children: [
                ClipRRect(
                  borderRadius: BorderRadius.circular(10),
                  child: CachedNetworkImage(
                    width: 120,
                    height: 180,
                    fit: BoxFit.cover,
                    imageUrl: "https://m.media-amazon.com/images/I/71xoHySBAEL.__AC_SX300_SY300_QL70_ML2_.jpg",
                    progressIndicatorBuilder: (context, url, downloadProgress) =>
                        Center(child: CircularProgressIndicator(value: downloadProgress.progress)),
                    errorWidget: (context, url, error) => const Center(child: Icon(Icons.error)),
                  ),
                ),
                IconButton(
                  onPressed: (){},
                  icon: const Icon(
                    Icons.favorite_border,
                    color: Colors.white,
                  ),
                ),
                const SizedBox(
                  width: 120,
                  child: Align(
                    alignment: Alignment.topRight,
                    child: Padding(
                      padding: EdgeInsets.all(11.0),
                      child: Icon(
                        Icons.recycling,
                        color: Colors.white,
                      ),
                    ),
                  ),
                ),
              ],
            ),
            const SizedBox(
              height: 8,
            ),
            SizedBox(
              width: 120,
              child: Text(
                'The Masterpieces The Masterpieces The Masterpieces',
                style: Theme.of(context).textTheme.bodyLarge!.copyWith(
                    fontWeight: FontWeight.normal
                ),
                maxLines: 2,
                overflow: TextOverflow.ellipsis,
              ),
            ),
            const Spacer(),
            SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Row(
                children: [
                  Text(
                    '100 EGP',
                    style: Theme.of(context).textTheme.bodyLarge,
                  ),
                  const SizedBox(
                    width: 8,
                  ),
                  const CircleAvatar(
                    radius: 10,
                    backgroundImage: NetworkImage(
                        'https://t3.ftcdn.net/jpg/06/92/34/64/240_F_692346400_UzYGmrJm6qhyPPXyZeUGuyEhkwr1iSFN.jpg'
                    ),
                  ),
                  const SizedBox(
                    width: 5,
                  ),
                  Text(
                    'seller name',
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                    style: Theme.of(context).textTheme.bodySmall,
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
