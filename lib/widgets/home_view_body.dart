import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:graduation_project/cubits/app_cubit/app_cubit.dart';
import 'package:graduation_project/models/category_model.dart';
import 'package:graduation_project/widgets/book_item.dart';
import 'package:graduation_project/widgets/category_card.dart';
import 'package:graduation_project/widgets/grid_view_item.dart';

class HomeViewBody extends StatelessWidget {
  const HomeViewBody({
    super.key, required this.categoryModel,
  });

  final CategoryModel categoryModel;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16.0),
      child: NotificationListener<ScrollNotification>(
        onNotification: (notification) {
          if(notification.metrics.pixels == notification.metrics.maxScrollExtent && notification is ScrollUpdateNotification){
            BlocProvider.of<AppCubit>(context).getNextPageForHomeGridBooks(fromPagination: true);
          }
          return true;
        },
        child: SingleChildScrollView(
          physics: const BouncingScrollPhysics(),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(
                height: 15,
              ),
              // const Text(
              //   'For You',
              // ),
              // const SizedBox(
              //   height: 8,
              // ),
              // SizedBox(
              //   height: 250,
              //   child: ListView.separated(
              //     scrollDirection: Axis.horizontal,
              //     physics: const BouncingScrollPhysics(),
              //     itemBuilder: (context, index) => const BookItem(),
              //     separatorBuilder: (context, index) =>
              //     const SizedBox(width: 24,),
              //     itemCount: 10,
              //   ),
              // ),
              // const SizedBox(
              //   height: 30,
              // ),
              const Text(
                'Categories',
              ),
              const SizedBox(
                height: 8,
              ),
              SizedBox(
                height: 120,
                child: ListView.separated(
                  scrollDirection: Axis.horizontal,
                  physics: const BouncingScrollPhysics(),
                  itemBuilder: (context, index) => CategoryCard(categoryDataModel: categoryModel.data[index],),
                  separatorBuilder: (context, index) => const SizedBox(width: 16,),
                  itemCount: categoryModel.data.length,
                ),
              ),
              //
              const SizedBox(
                height: 30,
              ),
              const Text(
                'All Books',
              ),
              const SizedBox(
                height: 8,
              ),
              GridView.builder(
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 3,
                  childAspectRatio: 1 / 2.15,
                  crossAxisSpacing: 16,
                  mainAxisSpacing: 16,
                ),
                itemBuilder: (context, index) => GridViewItem(
                  homeGridBooksDataModel: BlocProvider.of<AppCubit>(context).homeGridBooks[index],
                ),
                itemCount: BlocProvider.of<AppCubit>(context).homeGridBooks.length,
              ),
              const SizedBox(
                height: 16,
              ),
              BlocBuilder<AppCubit, AppState>(builder: (context, state) {
                if(state is AppGetNextPageForHomeGridBooksLoadingState){
                  return const LinearProgressIndicator();
                } else{
                  return const SizedBox.shrink();
                }
              }
              ),
              const SizedBox(
                height: 50,
              ),
            ],
          ),
        ),
      ),
    );
  }
}