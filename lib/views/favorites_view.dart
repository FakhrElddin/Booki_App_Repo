import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:graduation_project/cubits/app_cubit/app_cubit.dart';
import 'package:graduation_project/widgets/favorites_view_body.dart';

class FavoritesView extends StatelessWidget {
  const FavoritesView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<AppCubit, AppState>(
      listener: (context, state) {
        // TODO: implement listener
      },
      builder: (context, state) {
        return ConditionalBuilder(
          condition: BlocProvider
              .of<AppCubit>(context)
              .favoritesModel != null,
          builder: (context) => FavoritesViewBody(),
          fallback: (context) =>
          const Center(child: CircularProgressIndicator()),
        );
      },
    );
  }
}
