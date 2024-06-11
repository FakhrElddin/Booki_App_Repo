import 'package:flutter/material.dart';
import 'package:graduation_project/views/update_user_info.dart';
import '../constants.dart';
import '../widgets/book_owner_full_profile_body.dart';
import '../widgets/book_owner_info.dart';
import 'login_view.dart';

class ProfileView extends StatelessWidget {
  const ProfileView({super.key, required this.model});
final UserInfoModel model;
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
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) {
                          return const LoginView();
                        }));
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
class UserInfoModel{
  final String name;
  final String full_name;
  final String number;
  final String city;
  int? id;
  final String address;

  UserInfoModel({required this.name, required this.full_name, required this.number, required this.city, required this.address});
}