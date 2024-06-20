import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:graduation_project/models/home_grid_books_model.dart';

class GridViewItem extends StatelessWidget {
  const GridViewItem({super.key, required this.homeGridBooksDataModel});

  final HomeGridBooksDataModel homeGridBooksDataModel;

  @override
  Widget build(BuildContext context) {
    return Column(
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
                imageUrl: homeGridBooksDataModel.coverImage,
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
            homeGridBooksDataModel.title,
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
                '${homeGridBooksDataModel.price} EGP',
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
                homeGridBooksDataModel.user.name,
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
                style: Theme.of(context).textTheme.bodySmall,
              ),
            ],
          ),
        ),
      ],
    );
  }
}
