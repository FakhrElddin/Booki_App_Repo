import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:graduation_project/cubits/app_cubit/app_cubit.dart';
import 'package:graduation_project/models/category_model.dart';
import 'package:graduation_project/views/category_view.dart';

class CategoryCard extends StatelessWidget {
  const CategoryCard({super.key, required this.categoryDataModel});

  final CategoryDataModel categoryDataModel;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: (){
        BlocProvider.of<AppCubit>(context).getCategoryBooks(
          categoryId: categoryDataModel.id,
        );
        Navigator.push(context, MaterialPageRoute(builder: (context){
          return CategoryView(categoryName: categoryDataModel.name,);
        }));
      },
      child: Stack(
        alignment: Alignment.center,
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(10),
            child: CachedNetworkImage(
              width: 180,
              height: 120,
              fit: BoxFit.fill,
              imageUrl: categoryDataModel.image,
              progressIndicatorBuilder: (context, url, downloadProgress) =>
                  Center(child: CircularProgressIndicator(value: downloadProgress.progress)),
              errorWidget: (context, url, error) => const Center(child: Icon(Icons.error)),
            ),
          ),
          Text(
            categoryDataModel.name,
            style: const TextStyle(
              color: Colors.white,
            ),
          ),
        ],
      ),
    );
  }
}
