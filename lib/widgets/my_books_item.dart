import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:graduation_project/constants.dart';
import 'package:graduation_project/cubits/app_cubit/app_cubit.dart';
import 'package:graduation_project/helper/show_awesome_dialog.dart';
import 'package:graduation_project/models/user_books_model.dart';

class MyBooksItem extends StatelessWidget {
  const MyBooksItem({super.key, required this.userBooksDataModel});

  final UserBooksDataModel userBooksDataModel;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 160,
      child: Row(
        children: [
          Stack(
            children: [
              ClipRRect(
                borderRadius: BorderRadius.circular(10),
                child: CachedNetworkImage(
                  width: 120,
                  height: 160,
                  fit: BoxFit.cover,
                  imageUrl: userBooksDataModel.coverImage,
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
            width: 12,
          ),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    const Spacer(),
                    IconButton(
                      onPressed: (){
                        showAwesomeDialog(
                            context,
                            title: 'Warning',
                            body: 'Do you want to delete this book from your gallery?',
                            dialogType: DialogType.warning,
                            okOnPress: (){
                              BlocProvider.of<AppCubit>(context).deleteUserBook(bookId: userBooksDataModel.id);
                            }
                        );
                      },
                      icon: const Icon(
                        Icons.delete,
                        color: Colors.red,
                      ),
                    ),
                  ],
                ),
                Text(
                  userBooksDataModel.title,
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                  style: Theme.of(context).textTheme.bodyLarge!.copyWith(
                    fontSize: 16,
                    fontWeight: FontWeight.normal,
                    height: 1.5,
                  ),
                ),
                const Spacer(),
                Row(
                  children: [
                    Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(4),
                        border: Border.all(
                            color: kPrimaryColor
                        ),
                      ),
                      child: Padding(
                        padding: const EdgeInsets.all(5.0),
                        child: Text(
                          userBooksDataModel.category.name,
                          style: Theme.of(context).textTheme.bodyLarge!.copyWith(
                            color: kPrimaryColor,
                            fontWeight: FontWeight.normal,
                          ),
                        ),
                      ),
                    ),
                    const Spacer(),
                    Text(
                      '${userBooksDataModel.price} EGP',
                      style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                        fontSize: 20,
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
