import 'package:flutter/material.dart';
import 'package:graduation_project/local/cache_helper.dart';
import 'package:graduation_project/views/update_user_info.dart';
import '../constants.dart';
import '../widgets/book_owner_full_profile_body.dart';
import '../widgets/book_owner_info.dart';
import 'login_view.dart';

class ProfileView extends StatelessWidget {
  const ProfileView({super.key});

  @override
  Widget build(BuildContext context) {
    return  Column(
      children: [
        const Expanded(
          child: SingleChildScrollView(
            physics: BouncingScrollPhysics(),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                BookOwnerInfo(),
                BookOwnerFullProfileBody(),
                SizedBox(
                  height: 24,
                ),
              ],
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(
            left: 16,
            right: 16,
            bottom: 20,
          ),
          child: Row(
            children: [
              Expanded(
                flex: 2,
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    textStyle: const TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.w500,
                    ),
                    backgroundColor: kPrimaryColor,
                    fixedSize: const Size(220, 60),
                  ),
                  onPressed: () {
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) {
                         return const UpdateUserInfo();
                        }));
                  },
                  child: const Text(
                    'Update profile',
                  ),
                ),
              ),
              const SizedBox(
                width: 12,
              ),
              Expanded(
                flex: 1,
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    textStyle: const TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.w500,
                    ),
                    backgroundColor: const Color(0xffE2E7F0),
                    fixedSize: const Size(140, 60),
                    foregroundColor: Colors.black,
                  ),
                  onPressed: () {
                    CacheHelper.removeData(key: 'token');
                    Navigator.pushReplacement(context, MaterialPageRoute(builder: (context){
                      return const LoginView();
                    },),);
                  },
                  child: const Text(
                    'log out',
                  ),
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}