import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:graduation_project/cubits/app_cubit/app_cubit.dart';
import 'package:graduation_project/widgets/category_item.dart';

class CategoryView extends StatelessWidget {
  const CategoryView({super.key, required this.categoryName});

  final String categoryName;

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<AppCubit, AppState>(
      listener: (context, state) {
        // TODO: implement listener
      },
      builder: (context, state) {
        var appCubit = BlocProvider.of<AppCubit>(context);
        return Scaffold(
          appBar: AppBar(
            centerTitle: true,
            leading: IconButton(
              onPressed: () {
                Navigator.pop(context);
              },
              icon: const Icon(
                Icons.arrow_back_ios_new_sharp,
                color: Colors.black,
              ),
            ),
            title: Text(
              '$categoryName Books',
            ),
          ),
          body: ConditionalBuilder(
            condition: appCubit.categoryBookModel != null,
            builder: (context) => SingleChildScrollView(
              physics: const BouncingScrollPhysics(),
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16.0),
                child: Column(
                  children: [
                    const SizedBox(
                      height: 16,
                    ),
                    ListView.separated(
                      shrinkWrap: true,
                      physics: const NeverScrollableScrollPhysics(),
                      itemBuilder: (context, index) => CategoryItem(
                        categoryBookDataModel: appCubit.categoryBookModel!.data[index],
                      ),
                      separatorBuilder: (context, index) =>
                      const SizedBox(
                        height: 24,
                      ),
                      itemCount: appCubit.categoryBookModel!.data.length,
                    ),
                    const SizedBox(
                      height: 50,
                    )
                  ],
                ),
              ),
            ),
            fallback: (context) => const Center(child: CircularProgressIndicator()),
          ),
        );
      },
    );
  }
}


