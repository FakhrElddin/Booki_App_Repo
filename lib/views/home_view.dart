
import 'package:flutter/material.dart';
import 'package:graduation_project/widgets/book_item.dart';

class HomeView extends StatelessWidget {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: SingleChildScrollView(
        physics: const BouncingScrollPhysics(),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              'Last Seen',
            ),
            const SizedBox(
              height: 8,
            ),
            SizedBox(
              height: 260,
              child: ListView.separated(
                scrollDirection: Axis.horizontal,
                physics: const BouncingScrollPhysics(),
                itemBuilder: (context, index) => const BookItme(),
                separatorBuilder: (context, index) => const SizedBox(width: 10,),
                itemCount: 10,
              ),
            ),
            const SizedBox(
              height: 16,
            ),
            const Text(
              'For You',
            ),
            const SizedBox(
              height: 8,
            ),
            SizedBox(
              height: 260,
              child: ListView.separated(
                scrollDirection: Axis.horizontal,
                physics: const BouncingScrollPhysics(),
                itemBuilder: (context, index) => const BookItme(),
                separatorBuilder: (context, index) => const SizedBox(width: 10,),
                itemCount: 10,
              ),
            ),
            const SizedBox(
              height: 16,
            ),
          ],
        ),
      ),
    );
  }
}