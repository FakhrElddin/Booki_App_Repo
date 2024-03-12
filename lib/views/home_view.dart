
import 'package:flutter/material.dart';
import 'package:graduation_project/widgets/book_item.dart';
import 'package:graduation_project/widgets/grid_view_item.dart';
import 'package:graduation_project/widgets/test.dart';

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
                separatorBuilder: (context, index) => const SizedBox(width: 24,),
                itemCount: 10,
              ),
            ),
            const SizedBox(
              height: 32,
            ),
            SizedBox(
              height: 32,
              child: ListView.separated(
                physics: const BouncingScrollPhysics(),
                scrollDirection: Axis.horizontal,
                itemBuilder: (context, index) => OutlinedButton(
                  onPressed: (){},
                  child: const Text(
                    'General',
                  ),
                ),
                separatorBuilder: (context, index) => SizedBox(width: 16,),
                itemCount: 10,
              ),
            ),
            const SizedBox(
              height: 32,
            ),
            GridView.builder(
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 3,
                childAspectRatio: .49,
                crossAxisSpacing: 16,
                mainAxisSpacing: 16,
              ),
              itemBuilder: (context, index) => const GridViewItem(),
              itemCount: 20,
            ),
          ],
        ),
      ),
    );
  }
}