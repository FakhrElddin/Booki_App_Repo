import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:graduation_project/models/book_model.dart';
import 'package:graduation_project/models/search_model.dart';
import 'package:graduation_project/views/book_view.dart';

class SearchItem extends StatelessWidget {
  const SearchItem({
    super.key, required this.searchDataModel,
  });

  final SearchDataModel searchDataModel;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: (){
        Navigator.push(context, MaterialPageRoute(builder: (context){
          return BookView(
            bookModel: BookModel(
              title: searchDataModel.title,
              edition: searchDataModel.edition,
              category: searchDataModel.category.name,
              timeUsed: searchDataModel.usedTime,
              price: searchDataModel.price,
              status: searchDataModel.state,
              bookOwnerName: searchDataModel.user.name,
              bookOwnerId: searchDataModel.user.id,
              bookOwnerImage: 'bookOwnerImage',
              bookCoverImage: searchDataModel.coverImage,
              bookStubImage: searchDataModel.images[0],
              bookPrintingImage: searchDataModel.images[1],
            ),
          );
        }));
      },
      child: SizedBox(
        height: 180,
        child: Row(
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(10),
              child: CachedNetworkImage(
                width: 120,
                height: 180,
                fit: BoxFit.cover,
                imageUrl:
                "https://m.media-amazon.com/images/I/71xoHySBAEL.__AC_SX300_SY300_QL70_ML2_.jpg",
                // imageUrl:
                // searchDataModel.coverImage,
                progressIndicatorBuilder:
                    (context, url, downloadProgress) => Center(
                    child: CircularProgressIndicator(
                        value: downloadProgress.progress)),
                errorWidget: (context, url, error) =>
                const Center(child: Icon(Icons.error)),
              ),
            ),
            const SizedBox(
              width: 12,
            ),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const SizedBox(
                    height: 16,
                  ),
                  Text(
                    searchDataModel.title,
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                    style: Theme.of(context)
                        .textTheme
                        .bodyLarge!
                        .copyWith(
                      fontSize: 16,
                      fontWeight: FontWeight.normal,
                      height: 1.5,
                    ),
                  ),
                  const SizedBox(
                    height: 16,
                  ),
                  Row(
                    children: [
                      const CircleAvatar(
                        radius: 15,
                        backgroundImage: NetworkImage(
                            'https://t3.ftcdn.net/jpg/06/92/34/64/240_F_692346400_UzYGmrJm6qhyPPXyZeUGuyEhkwr1iSFN.jpg'),
                      ),
                      const SizedBox(
                        width: 10,
                      ),
                      Text(
                        searchDataModel.user.name,
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                        style: Theme.of(context)
                            .textTheme
                            .bodyLarge!
                            .copyWith(
                          color: Colors.grey[600],
                        ),
                      ),
                    ],
                  ),
                  const Spacer(),
                  Padding(
                    padding: const EdgeInsets.only(bottom: 24.0),
                    child: Text(
                      '${searchDataModel.price} EGP',
                      style: Theme.of(context)
                          .textTheme
                          .bodyMedium!
                          .copyWith(
                        fontSize: 20,
                      ),
                    ),
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