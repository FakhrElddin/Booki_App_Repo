import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:graduation_project/models/book_model.dart';
import 'package:graduation_project/models/category_book_model.dart';
import 'package:graduation_project/views/book_view.dart';

class CategoryItem extends StatelessWidget {
  const CategoryItem({
    super.key, required this.categoryBookDataModel,
  });

  final CategoryBookDataModel categoryBookDataModel;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: (){
        Navigator.push(context, MaterialPageRoute(builder: (context){
          return BookView(
            bookModel: BookModel(
              bookId: categoryBookDataModel.id,
              title: categoryBookDataModel.title,
              edition: categoryBookDataModel.edition,
              category: categoryBookDataModel.category.name,
              timeUsed: categoryBookDataModel.usedTime,
              price: categoryBookDataModel.price,
              status: categoryBookDataModel.state,
              bookOwnerName: categoryBookDataModel.user.name,
              bookOwnerId: categoryBookDataModel.user.id,
              bookCoverImage: categoryBookDataModel.coverImage,
              bookPrintingImage: categoryBookDataModel.images[0],
              bookStubImage: categoryBookDataModel.images[1],
              bookOwnerImage: 'bookOwnerImage',
            ),
          );
        }));
      },
      child: SizedBox(
        height: 180,
        child: Row(
          children: [
            Stack(
              children: [
                ClipRRect(
                  borderRadius: BorderRadius.circular(10),
                  child: CachedNetworkImage(
                    width: 120,
                    height: 180,
                    fit: BoxFit.cover,
                    // imageUrl:
                    // "https://m.media-amazon.com/images/I/71xoHySBAEL.__AC_SX300_SY300_QL70_ML2_.jpg",
                    imageUrl:
                    categoryBookDataModel.coverImage,
                    progressIndicatorBuilder:
                        (context, url, downloadProgress) => Center(
                        child: CircularProgressIndicator(
                            value: downloadProgress.progress)),
                    errorWidget: (context, url, error) =>
                    const Center(child: Icon(Icons.error)),
                  ),
                ),
                IconButton(
                  onPressed: () {},
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
                    categoryBookDataModel.title,
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
                        categoryBookDataModel.user.name,
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
                      '${categoryBookDataModel.price} EGP',
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