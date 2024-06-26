import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:graduation_project/cubits/app_cubit/app_cubit.dart';
import 'package:graduation_project/models/book_model.dart';
import 'package:graduation_project/models/home_grid_books_model.dart';
import 'package:graduation_project/views/book_view.dart';

class GridViewItem extends StatefulWidget {
  const GridViewItem({super.key, required this.homeGridBooksDataModel});

  final HomeGridBooksDataModel homeGridBooksDataModel;

  @override
  State<GridViewItem> createState() => _GridViewItemState();
}

class _GridViewItemState extends State<GridViewItem> {
  IconData favoriteIcon = Icons.favorite_border;
  bool inFavorites = false;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: (){
        Navigator.push(context, MaterialPageRoute(builder: (context){
          return BookView(
            bookModel: BookModel(
              bookId: widget.homeGridBooksDataModel.id,
              title: widget.homeGridBooksDataModel.title,
              edition: widget.homeGridBooksDataModel.edition,
              category: widget.homeGridBooksDataModel.category.name,
              timeUsed: widget.homeGridBooksDataModel.usedTime,
              price: widget.homeGridBooksDataModel.price,
              status: widget.homeGridBooksDataModel.state,
              bookOwnerName: widget.homeGridBooksDataModel.user.name,
              bookOwnerId: widget.homeGridBooksDataModel.user.id,
              bookCoverImage: widget.homeGridBooksDataModel.coverImage,
              bookPrintingImage: widget.homeGridBooksDataModel.images[0],
              bookStubImage: widget.homeGridBooksDataModel.images[1],
              bookOwnerImage: 'bookOwnerImage',
            ),
          );
        }));
      },
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
                  //imageUrl: "https://m.media-amazon.com/images/I/71xoHySBAEL.__AC_SX300_SY300_QL70_ML2_.jpg",
                  imageUrl: widget.homeGridBooksDataModel.coverImage,
                  progressIndicatorBuilder: (context, url, downloadProgress) =>
                      Center(child: CircularProgressIndicator(value: downloadProgress.progress)),
                  errorWidget: (context, url, error) => const Center(child: Icon(Icons.error)),
                ),
              ),
              IconButton(
                onPressed: (){
                  setState(() {
                    if(inFavorites == false){
                      favoriteIcon = Icons.favorite;
                      inFavorites = true;
                      BlocProvider.of<AppCubit>(context).addToFavorites(bookId: widget.homeGridBooksDataModel.id);
                    }
                  });
                },
                icon: Icon(
                  favoriteIcon,
                  color: inFavorites ? Colors.red : Colors.white,
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
              widget.homeGridBooksDataModel.title,
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
                  '${widget.homeGridBooksDataModel.price} EGP',
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
                  widget.homeGridBooksDataModel.user.name,
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                  style: Theme.of(context).textTheme.bodySmall,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
