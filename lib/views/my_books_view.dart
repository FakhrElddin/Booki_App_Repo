import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:graduation_project/cubits/app_cubit/app_cubit.dart';
import 'package:graduation_project/helper/show_toast_message.dart';
import 'package:graduation_project/views/add_book_view.dart';
import 'package:graduation_project/widgets/my_books_view_body.dart';

class MyBooksView extends StatelessWidget {
  const MyBooksView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<AppCubit, AppState>(
      listener: (context, state) {
        if(state is AppDeleteUserBookFailureState){
          showToastMessage(
            context,
            message: state.errorMessage,
            state: ToastStates.ERROR,
          );
        }
        if(state is AppDeleteUserBookSuccessState){
          showToastMessage(
            context,
            message: 'Book deleted successfully',
            state: ToastStates.SUCCESS,
          );
        }
      },
      builder: (context, state) {
        return Scaffold(
          floatingActionButton: SizedBox(
            width: 70,
            height: 70,
            child: FloatingActionButton(
              onPressed: () {
                Navigator.push(context, MaterialPageRoute(builder: (context) {
                  return const AddBookView();
                },
                ),
                );
              },
              child: const Icon(
                Icons.add,
                size: 32,
              ),
            ),
          ),
          body: ConditionalBuilder(
            condition: BlocProvider.of<AppCubit>(context).userBooksModel != null,
            builder: (context) => MyBooksViewBody(
              userBooksModel: BlocProvider.of<AppCubit>(context).userBooksModel!,
            ),
            fallback: (context) =>
            const Center(child: CircularProgressIndicator()),
          ),
        );
      },
    );
  }
}
