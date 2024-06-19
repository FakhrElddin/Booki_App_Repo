import 'package:flutter/material.dart';
import 'package:dio/dio.dart';
import 'package:graduation_project/models/user_model.dart';
import 'package:graduation_project/widgets/user_service.dart';
import 'package:graduation_project/local/cache_helper.dart';
import 'login_view.dart';
import 'update_user_info.dart';
import '../constants.dart';
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
        // } else if (snapshot.hasError) {
        //   return const Center(child: Text('Failed to load user data'));
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
                      const SizedBox(height: 24),
                      Padding(
                        padding: const EdgeInsets.only(left: 25),
                        child: Column(
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
                      ),
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



// import 'package:flutter/material.dart';
// import 'package:graduation_project/local/cache_helper.dart';
// import 'package:graduation_project/views/update_user_info.dart';
// import '../constants.dart';
// import '../widgets/user_full_profile_body.dart';
// import 'login_view.dart';
//
// class ProfileView extends StatelessWidget {
//   const ProfileView({super.key});
//
//   @override
//   Widget build(BuildContext context) {
//     return Column(
//       children: [
//         Expanded(
//           child: SingleChildScrollView(
//             physics: BouncingScrollPhysics(),
//             child: Column(
//               mainAxisAlignment: MainAxisAlignment.start,
//               crossAxisAlignment: CrossAxisAlignment.start,
//               children: [
//                 BookOwnerFullProfileBody(),
//                 const SizedBox(
//                   height: 24,
//                 ),
//                 Padding(
//                   padding: const EdgeInsets.only(left: 25),
//                   child: Column(
//                     children: [
//                       ElevatedButton(
//                         style: ElevatedButton.styleFrom(
//                           textStyle: const TextStyle(
//                             fontSize: 20,
//                             fontWeight: FontWeight.w500,
//                           ),
//                           backgroundColor: kPrimaryColor,
//                           fixedSize: const Size(360, 60),
//                         ),
//                         onPressed: () {
//                           Navigator.push(context,
//                               MaterialPageRoute(builder: (context) {
//                             return const UpdateUserInfo();
//                           }));
//                         },
//                         child: const Text(
//                           'Update profile',
//                         ),
//                       ),
//                       const SizedBox(
//                         height: 24,
//                       ),
//                       ElevatedButton(
//                         style: ElevatedButton.styleFrom(
//                           textStyle: const TextStyle(
//                             fontSize: 20,
//                             fontWeight: FontWeight.w500,
//                           ),
//                           backgroundColor: const Color(0xffE2E7F0),
//                           fixedSize: const Size(360, 60),
//                           foregroundColor: Colors.black,
//                         ),
//                         onPressed: () {
//                           CacheHelper.removeData(key: 'token');
//                           Navigator.pushReplacement(
//                             context,
//                             MaterialPageRoute(
//                               builder: (context) {
//                                 return const LoginView();
//                               },
//                             ),
//                           );
//                         },
//                         child: const Text(
//                           'log out',
//                         ),
//                       ),
//                       const SizedBox(
//                         height: 24,
//                       ),
//                       ElevatedButton(
//                         style: ElevatedButton.styleFrom(
//                           textStyle: const TextStyle(
//                             fontSize: 20,
//                             fontWeight: FontWeight.w500,
//                           ),
//                           backgroundColor: Colors.red,
//                           fixedSize: const Size(360, 60),
//                           foregroundColor: Colors.black,
//                         ),
//                         onPressed: () {
//                           CacheHelper.removeData(key: 'token');
//                           Navigator.pushReplacement(
//                             context,
//                             MaterialPageRoute(
//                               builder: (context) {
//                                 return const LoginView();
//                               },
//                             ),
//                           );
//                         },
//                         child: const Text(
//                           'Delete account',
//                         ),
//                       ),
//                     ],
//                   ),
//                 ),
//               ],
//             ),
//           ),
//         ),
//       ],
//     );
//   }
// }
// Padding(
//   padding: const EdgeInsets.only(
//     left: 16,
//     right: 16,
//     bottom: 20,
//   ),
//   child: Row(
//     children: [
//       Expanded(
//         flex: 2,
//         child: ElevatedButton(
//           style: ElevatedButton.styleFrom(
//             textStyle: const TextStyle(
//               fontSize: 20,
//               fontWeight: FontWeight.w500,
//             ),
//             backgroundColor: kPrimaryColor,
//             fixedSize: const Size(220, 60),
//           ),
//           onPressed: () {
//             Navigator.push(context,
//                 MaterialPageRoute(builder: (context) {
//                  return const UpdateUserInfo();
//                 }));
//           },
//           child: const Text(
//             'Update profile',
//           ),
//         ),
//       ),
//       const SizedBox(
//         width: 12,
//       ),
//       Expanded(
//         flex: 1,
//         child: ElevatedButton(
//           style: ElevatedButton.styleFrom(
//             textStyle: const TextStyle(
//               fontSize: 20,
//               fontWeight: FontWeight.w500,
//             ),
//             backgroundColor: const Color(0xffE2E7F0),
//             fixedSize: const Size(140, 60),
//             foregroundColor: Colors.black,
//           ),
//           onPressed: () {
//             CacheHelper.removeData(key: 'token');
//             Navigator.pushReplacement(context, MaterialPageRoute(builder: (context){
//               return const LoginView();
//             },),);
//           },
//           child: const Text(
//             'log out',
//           ),
//         ),
//       ),
//     ],
//   ),
// ),
