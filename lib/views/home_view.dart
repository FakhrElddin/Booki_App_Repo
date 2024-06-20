import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:graduation_project/cubits/app_cubit/app_cubit.dart';
import 'package:graduation_project/widgets/home_view_body.dart';

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
        return ConditionalBuilder(
          condition: appCubit.categoryModel != null && appCubit.homeGridBooksModel != null,
          builder: (context) => HomeViewBody(categoryModel: appCubit.categoryModel!,),
          fallback: (context) => const Center(child: CircularProgressIndicator()),
        );
      },
    );
  }
}