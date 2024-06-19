import 'package:flutter/material.dart';
import 'package:graduation_project/models/user_books_model.dart';
import 'package:graduation_project/widgets/my_books_item.dart';

class MyBooksViewBody extends StatelessWidget {
  const MyBooksViewBody({super.key, required this.userBooksModel});

  final UserBooksModel userBooksModel;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16.0),
      child: SingleChildScrollView(
        physics: const BouncingScrollPhysics(),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(
              height: 16,
            ),
            const Text(
              'My Books',
            ),
            const SizedBox(
              height: 16,
            ),
            ListView.separated(
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              itemBuilder: (context, index) => MyBooksItem(userBooksDataModel: userBooksModel.data[index],),
              separatorBuilder: (context, index) => const SizedBox(height: 32,),
              itemCount: userBooksModel.data.length,
            ),
            const SizedBox(
              height: 100,
            ),
          ],
        ),
      ),
    );
  }
}
