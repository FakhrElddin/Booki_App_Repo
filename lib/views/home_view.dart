import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:graduation_project/cubits/app_cubit/app_cubit.dart';
import 'package:graduation_project/widgets/book_item.dart';
import 'package:graduation_project/widgets/category_card.dart';
import 'package:graduation_project/widgets/grid_view_item.dart';

class HomeView extends StatelessWidget {
  const HomeView({super.key});


  @override
  Widget build(BuildContext context) {
    return BlocConsumer<AppCubit, AppState>(
      listener: (context, state) {
        // TODO: implement listener
      },
      builder: (context, state) {
        var appCubit = BlocProvider.of<AppCubit>(context);
        return Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16.0),
          child: SingleChildScrollView(
            physics: const BouncingScrollPhysics(),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const SizedBox(
                  height: 15,
                ),
                const Text(
                  'For You',
                ),
                const SizedBox(
                  height: 8,
                ),
                SizedBox(
                  height: 250,
                  child: ListView.separated(
                    scrollDirection: Axis.horizontal,
                    physics: const BouncingScrollPhysics(),
                    itemBuilder: (context, index) => const BookItem(),
                    separatorBuilder: (context, index) =>
                    const SizedBox(width: 24,),
                    itemCount: 10,
                  ),
                ),
                const SizedBox(
                  height: 30,
                ),
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
                    itemBuilder: (context, index) => const CategoryCard(),
                    separatorBuilder: (context, index) => const SizedBox(width: 16,),
                    itemCount: 10,
                  ),
                ),
                //
                const SizedBox(
                  height: 40,
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
                  itemBuilder: (context, index) => const BookItem(),
                  itemCount: 20,
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}