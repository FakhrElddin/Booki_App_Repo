import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:graduation_project/constants.dart';
import 'package:graduation_project/cubits/app_cubit/app_cubit.dart';
import 'package:graduation_project/cubits/bottom_nav_bar_cubit/bottom_nav_bar_cubit.dart';
import 'package:graduation_project/helper/dio_helper.dart';
import 'package:graduation_project/local/cache_helper.dart';
import 'package:graduation_project/simple_bloc_observer.dart';
import 'package:graduation_project/themes/light_theme.dart';
import 'package:graduation_project/views/app_view.dart';
import 'package:graduation_project/views/login_view.dart';
import 'package:graduation_project/views/on_boarding_view.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  Bloc.observer = SimpleBlocObserver();
  await CacheHelper.init();
  await DioHelper.init();
  bool? onBoarding = CacheHelper.getData(key: 'onBoarding') ?? false;
  token = CacheHelper.getData(key: 'token');
  late Widget startView;

  if (onBoarding ?? false) {
    token == null ? startView = const LoginView() : startView = const AppView();
  } else {
    startView = const OnBoardingView();
  }

  runApp(BookiApp(startView: startView,));
}

class BookiApp extends StatelessWidget {
  const BookiApp({super.key, required this.startView});

  final Widget startView;

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (context) => BottomNavBarCubit(),),
        BlocProvider(create: (context) => AppCubit()..getCategories(),),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        theme: lightTheme(context),
        home: startView,
      ),
    );
  }
}
