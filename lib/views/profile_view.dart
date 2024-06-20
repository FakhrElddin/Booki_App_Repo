import 'package:flutter/material.dart';
import 'package:dio/dio.dart';
import 'package:graduation_project/models/user_model.dart';
import 'package:graduation_project/widgets/user_service.dart';
import '../widgets/user_full_profile_body.dart';

class ProfileView extends StatefulWidget {
  const ProfileView({Key? key,  this.user});
final UserModel? user;
  @override
  State<ProfileView> createState() => _ProfileViewState();
}

class _ProfileViewState extends State<ProfileView> {
  late Future<UserModel> futureUser;

  @override
  void initState() {
    super.initState();
    futureUser = UserService(Dio()).getUserInfo();
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<UserModel>(
      future: futureUser,
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return const Center(child: CircularProgressIndicator());
        } else if (snapshot.hasError) {
          return const Center(child: Text('Failed to load user data'));
        } else if (snapshot.hasData) {
          final user = snapshot.data!;
          return Column(
            children: [
              Expanded(
                child: SingleChildScrollView(
                  physics: const BouncingScrollPhysics(),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      UserProfileBody(user: user,),
                    ],
                  ),
                ),
              ),
            ],
          );
        }
        else {
          return const Center(child: Text('No user data available'));
        }
      },
    );
  }
}
