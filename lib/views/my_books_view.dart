import 'package:flutter/material.dart';
import 'package:graduation_project/widgets/book_item.dart';
import 'package:graduation_project/widgets/my_books_item.dart';

class MyBooksView extends StatelessWidget {
  const MyBooksView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: SizedBox(
        width: 70,
        height: 70,
        child: FloatingActionButton(
          onPressed: (){},
          child: const Icon(
            Icons.add,
            size: 32,
          ),
        ),
      ),
      body: Padding(
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
                itemBuilder: (context, index) => const MyBooksItem(),
                separatorBuilder: (context, index) => const SizedBox(height: 32,),
                itemCount: 10,
              ),
              const SizedBox(
                height: 100,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
