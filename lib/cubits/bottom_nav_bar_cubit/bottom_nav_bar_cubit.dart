import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:graduation_project/views/chat_view.dart';
import 'package:graduation_project/views/favorites_view.dart';
import 'package:graduation_project/views/home_view.dart';
import 'package:graduation_project/views/my_books_view.dart';
import 'package:graduation_project/views/profile_view.dart';
import 'package:meta/meta.dart';

part 'bottom_nav_bar_state.dart';

class BottomNavBarCubit extends Cubit<BottomNavBarState> {
  BottomNavBarCubit() : super(BottomNavBarInitial());

  List<BottomNavigationBarItem> items = const [
    BottomNavigationBarItem(
      icon: Icon(
        Icons.home_outlined,
      ),
      activeIcon: Icon(
        Icons.home,
      ),
      label: 'Home',
    ),
    BottomNavigationBarItem(
      icon: Icon(
          Icons.favorite_border_outlined,
      ),
      activeIcon: Icon(
        Icons.favorite,
      ),
      label: 'Favorites',
    ),
    BottomNavigationBarItem(
      icon: Icon(
          Icons.chat_outlined,
      ),
      activeIcon: Icon(
        Icons.chat,
      ),
      label: 'Chat',
    ),
    BottomNavigationBarItem(
      icon: Icon(
          Icons.menu_book_outlined,
      ),
      activeIcon: Icon(
        Icons.menu_book,
      ),
      label: 'My Books',
    ),
    BottomNavigationBarItem(
      icon: Icon(
          Icons.person_outline,
      ),
      activeIcon: Icon(
        Icons.person,
      ),
      label: 'Profile',
    ),
  ];
  List<Widget> views = const [
    HomeView(),
    FavoritesView(),
    ChatView(),
    MyBooksView(),
    ProfileView(),
  ];
  int currentIndex = 0;

  void changeBottomNavBar({required int index}){
    currentIndex = index;
    emit(BottomNavBarChangeState());
  }
}
