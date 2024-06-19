import 'package:flutter/material.dart';
import 'package:graduation_project/widgets/book_owner_body.dart';
import '../widgets/book_owner_reviews.dart';

class BookOwnerProfile extends StatelessWidget {
  const BookOwnerProfile({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          centerTitle: true,
          title: const Text(
            'Profile',
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
              onPressed: () {
                // Navigator.push(context, MaterialPageRoute(builder: (context){
                //   return const BookOwnerFullProfileView();
                // }));
              },
              padding: const EdgeInsetsDirectional.only(end: 8),
              icon: const Icon(
                Icons.info_outline_rounded,
                size: 28,
                color: Colors.black,
              ),
            ),
          ],
        ),
        body: const SingleChildScrollView(
          child: Column(
            children: [
              BookOwnerBody(),
              const SizedBox(
                height: 20,
              ),
              const Divider(
                height: 10,
                thickness: 2.35,
                color: Colors.grey,
                indent: 50,
                endIndent: 50,
              ),
              const SizedBox(
                height: 15,
              ),
              const Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Spacer(
                    flex: 1,
                  ),
                  Text(
                    'Comments',
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                  Spacer(
                    flex: 20,
                  ),
                ],
              ),
              SizedBox(
                height: 30,
              ),
              BookOwnerReviews(
                userImage:
                'https://hips.hearstapps.com/hmg-prod/images/lionel-messi-celebrates-after-their-sides-third-goal-by-news-photo-1686170172.jpg?crop=0.66653xw:1xh;center,top&resize=1200:*',
                rate: 4,
              ),
              BookOwnerReviews(
                userImage:
                'https://hips.hearstapps.com/hmg-prod/images/lionel-messi-celebrates-after-their-sides-third-goal-by-news-photo-1686170172.jpg?crop=0.66653xw:1xh;center,top&resize=1200:*',
                rate: 3,
              ),
              BookOwnerReviews(
                userImage:
                'https://hips.hearstapps.com/hmg-prod/images/lionel-messi-celebrates-after-their-sides-third-goal-by-news-photo-1686170172.jpg?crop=0.66653xw:1xh;center,top&resize=1200:*',
                rate: 5,
              ),
              BookOwnerReviews(
                userImage:
                'https://hips.hearstapps.com/hmg-prod/images/lionel-messi-celebrates-after-their-sides-third-goal-by-news-photo-1686170172.jpg?crop=0.66653xw:1xh;center,top&resize=1200:*',
                rate: 4,
              ),
              BookOwnerReviews(
                userImage:
                'https://hips.hearstapps.com/hmg-prod/images/lionel-messi-celebrates-after-their-sides-third-goal-by-news-photo-1686170172.jpg?crop=0.66653xw:1xh;center,top&resize=1200:*',
                rate: 3,
              ),
            ],
          ),
        ),
    );
  }
}
