import 'package:double_back_to_close_app/double_back_to_close_app.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:graduation_project/constants.dart';
import 'package:graduation_project/cubits/app_cubit/app_cubit.dart';
import 'package:graduation_project/cubits/bottom_nav_bar_cubit/bottom_nav_bar_cubit.dart';
import 'package:graduation_project/helper/show_toast_message.dart';
import 'package:graduation_project/views/search_view.dart';
import 'package:graduation_project/widgets/leave_app_snack_bar.dart';

class AppView extends StatelessWidget {
  const AppView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<BottomNavBarCubit, BottomNavBarState>(
      listener: (context, state) {
      },
      builder: (context, state) {
        var bottomNavCubit = BlocProvider.of<BottomNavBarCubit>(context);
        return BlocConsumer<AppCubit, AppState>(
          listener: (context, state) {
            // TODO: implement listener
          },
          builder: (context, state) {
            return Scaffold(
              appBar: AppBar(
                automaticallyImplyLeading: false,
                title: GestureDetector(
                  onTap: () {
                    if (bottomNavCubit.currentIndex != 0) {
                      bottomNavCubit.changeBottomNavBar(index: 0);
                    }
                  },
                  child: Row(
                    children: [
                      const Text(
                        'BOOKI',
                        style: TextStyle(
                          fontFamily: 'Pacifico',
                          fontWeight: FontWeight.bold,
                          color: kPrimaryColor,
                        ),
                      ),
                      const SizedBox(
                        width: 6,
                      ),
                      SvgPicture.asset(
                        kBookLogo,
                        height: 40,
                        width: 40,
                      ),
                    ],
                  ),
                ),
                actions: [
                  IconButton(
                    onPressed: () {
                      BlocProvider.of<AppCubit>(context).searchedBooksList = [];
                      Navigator.push(context, MaterialPageRoute(builder: (context){
                        return const SearchView();
                      }));
                    },
                    icon: const Icon(
                      Icons.search,
                    ),
                  ),
                  IconButton(
                    onPressed: () {},
                    icon: const Icon(
                      Icons.notifications_none,
                    ),
                  ),
                ],
                bottom: PreferredSize(
                  preferredSize: const Size.fromHeight(4),
                  child: Container(
                    color: Colors.grey[800],
                    height: 1,
                  ),
                ),
              ),
              bottomNavigationBar: Container(
                height: 75,
                decoration: const BoxDecoration(
                  border: Border(top: BorderSide(
                    color: Colors.grey,
                    width: 1,
                  )),
                ),
                child: BottomNavigationBar(
                  currentIndex: bottomNavCubit.currentIndex,
                  onTap: (index) {
                    bottomNavCubit.changeBottomNavBar(index: index);
                  },
                  items: bottomNavCubit.items,
                ),
              ),
              body: DoubleBackToCloseApp(
                snackBar: closeAppSnackBar(),
                child: bottomNavCubit.views[bottomNavCubit.currentIndex],
              ),
            );
          },
        );
      },
    );
  }
}
