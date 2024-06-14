part of 'app_cubit.dart';

@immutable
abstract class AppState {}

class AppInitial extends AppState {}

class AppGetCategoriesLoadingState extends AppState {}

class AppGetCategoriesSuccessState extends AppState {}

class AppGetCategoriesFailureState extends AppState {
  final String errorMessage;
  AppGetCategoriesFailureState({required this.errorMessage});
}

