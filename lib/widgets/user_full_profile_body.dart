import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:graduation_project/models/user_model.dart';
import 'package:graduation_project/widgets/star_display_item.dart';

import '../constants.dart';
import '../local/cache_helper.dart';
import '../views/login_view.dart';
import '../views/update_user_info.dart';

class UserProfileBody extends StatelessWidget {
  const UserProfileBody({super.key, required this.user});
  final UserModel user;
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 25),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(
              height: 25,
            ),
            ClipRRect(
              child: CachedNetworkImage(
                fit: BoxFit.fill,
                imageUrl: user.profileImage.toString(),
                imageBuilder: (context, imageProvider) => Container(
                  width: 180.0,
                  height: 180.0,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    image: DecorationImage(
                        image: imageProvider, fit: BoxFit.cover),
                  ),
                ),
                progressIndicatorBuilder: (context, url, downloadProgress) =>
                    Center(
                        child: CircularProgressIndicator(
                            value: downloadProgress.progress)),
                errorWidget: (context, url, error) =>
                    const Center(child: Icon(Icons.error)),
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            Row(
              children: [
                const SizedBox(
                  width: 85,
                ),
                StarDisplay(
                  value: user.ratingsAverage,
                  size: 35,
                  //size: 35,
                ),
              ],
            ),
            const SizedBox(
              height: 20,
            ),
            const Text(
              'Email',
              style: TextStyle(
                fontSize: 20,
                color: Colors.grey,
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            Container(
              height: 60,
              width: double.maxFinite,
              decoration: BoxDecoration(
                  border: Border.all(
                    color: Colors.grey,
                  ),
                  shape: BoxShape.rectangle,
                  borderRadius: BorderRadius.circular(6)),
              child: Padding(
                padding: const EdgeInsets.all(16),
                child: Text(
                  user.email,
                  style: const TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            const Text(
              'Full name',
              style: TextStyle(
                fontSize: 20,
                color: Colors.grey,
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            Container(
              height: 60,
              width: double.maxFinite,
              decoration: BoxDecoration(
                  border: Border.all(
                    color: Colors.grey,
                  ),
                  shape: BoxShape.rectangle,
                  borderRadius: BorderRadius.circular(6)),
              child: Padding(
                padding: const EdgeInsets.all(16),
                child: Text(
                  user.name,
                  style: const TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            const Text(
              "Card ID",
              style: TextStyle(
                fontSize: 20,
                color: Colors.grey,
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            Container(
              height: 60,
              width: double.maxFinite,
              decoration: BoxDecoration(
                  border: Border.all(
                    color: Colors.grey,
                  ),
                  shape: BoxShape.rectangle,
                  borderRadius: BorderRadius.circular(6)),
              child: Padding(
                padding: const EdgeInsets.all(16),
                child: Text(
                  user.cardId.toString(),
                  style: const TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            const Text(
              "City/Region",
              style: TextStyle(
                fontSize: 20,
                color: Colors.grey,
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            Container(
              height: 60,
              width: double.maxFinite,
              decoration: BoxDecoration(
                  border: Border.all(
                    color: Colors.grey,
                  ),
                  shape: BoxShape.rectangle,
                  borderRadius: BorderRadius.circular(6)),
              child: Padding(
                padding: const EdgeInsets.all(16),
                child: Text(
                  user.city.toString(),
                  style: const TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ),
            ),
            const SizedBox(
              height: 30,
            ),
            Column(
              children: [
                ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    textStyle: const TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.w500,
                    ),
                    backgroundColor: kPrimaryColor,
                    fixedSize: const Size(360, 60),
                  ),
                  onPressed: () {
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) {
                          return const UpdateUserInfo();
                        }));
                  },
                  child: const Text('Update profile'),
                ),
                const SizedBox(height: 24),
                ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    textStyle: const TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.w500,
                    ),
                    backgroundColor: const Color(0xffE2E7F0),
                    fixedSize: const Size(360, 60),
                    foregroundColor: Colors.black,
                  ),
                  onPressed: () {
                    CacheHelper.removeData(key: 'token');
                    Navigator.pushReplacement(
                      context,
                      MaterialPageRoute(
                        builder: (context) {
                          return const LoginView();
                        },
                      ),
                    );
                  },
                  child: const Text('Log out'),
                ),
                const SizedBox(height: 24),
                ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    textStyle: const TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.w500,
                    ),
                    backgroundColor: Colors.red,
                    fixedSize: const Size(360, 60),
                    foregroundColor: Colors.black,
                  ),
                  onPressed: () {
                    CacheHelper.removeData(key: 'token');
                    Navigator.pushReplacement(
                      context,
                      MaterialPageRoute(
                        builder: (context) {
                          return const LoginView();
                        },
                      ),
                    );
                  },
                  child: const Text('Delete account'),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
