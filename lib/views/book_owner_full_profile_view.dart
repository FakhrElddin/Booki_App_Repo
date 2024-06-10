import 'package:flutter/material.dart';
import 'package:graduation_project/widgets/book_owner_full_profile_body.dart';
//good_code
class BookOwnerFullProfileView extends StatelessWidget {
  const BookOwnerFullProfileView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
          appBar: AppBar(
            centerTitle: true,
            title: const Text(
              'Full profile',
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
                  Icons.info_outline_rounded,
                  size: 28,
                  color: Colors.black,
                ),
              ),
            ],
          ),
      body:  const BookOwnerFullProfileBody(),
    );
  }
}
