import 'package:flutter/material.dart';
import 'package:graduation_project/models/book_model.dart';
import 'package:graduation_project/widgets/book_view_body.dart';


class BookView extends StatelessWidget {
  const BookView({super.key, required this.bookModel,});

  final BookModel bookModel;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text(
          'Book Page',
          style: TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.bold,
          ),
        ),
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: const Icon(
            Icons.arrow_back_ios_new_sharp,
            color: Colors.black,
          ),
        ),
        actions: [
          IconButton(
            onPressed: () {},
            padding: const EdgeInsetsDirectional.only(end: 8),
            icon: const Icon(
              Icons.favorite_border_outlined,
              size: 28,
              color: Colors.black,
            ),
          ),
        ],
      ),
      body: BookViewBody(bookModel: bookModel,),
    );
  }
}
