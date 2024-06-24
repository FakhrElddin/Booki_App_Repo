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

class AppGetBookCoverImageSuccessState extends AppState {}

class AppGetBookCoverImageFailureState extends AppState {
  final String errorMessage;
  AppGetBookCoverImageFailureState({required this.errorMessage});
}

class AppGetBookStubImageSuccessState extends AppState {}

class AppGetBookStubImageFailureState extends AppState {
  final String errorMessage;
  AppGetBookStubImageFailureState({required this.errorMessage});
}

class AppGetBookPrintingImageSuccessState extends AppState {}

class AppGetBookPrintingImageFailureState extends AppState {
  final String errorMessage;
  AppGetBookPrintingImageFailureState({required this.errorMessage});
}

class AppChangeAddBookSelectedCategoryState extends AppState {}

class AppChangeAddBookStateValueState extends AppState {}

class AppAddBookLoadingState extends AppState {}

class AppAddBookSuccessState extends AppState {}

class AppAddBookFailureState extends AppState {
  final String errorMessage;

  AppAddBookFailureState({required this.errorMessage});
}

class AppGetUserBooksLoadingState extends AppState {}

class AppGetUserBooksSuccessState extends AppState {}

class AppGetUserBooksFailureState extends AppState {
  final String errorMessage;

  AppGetUserBooksFailureState({required this.errorMessage});
}

class AppGetHomeGridBooksLoadingState extends AppState {}

class AppGetHomeGridBooksSuccessState extends AppState {}

class AppGetHomeGridBooksFailureState extends AppState {
  final String errorMessage;

  AppGetHomeGridBooksFailureState({required this.errorMessage});
}

class AppGetNextPageForHomeGridBooksLoadingState extends AppState {}

class AppGetNextPageForHomeGridBooksFailureState extends AppState {}

class AppGetFavoritesLoadingState extends AppState {}

class AppGetFavoritesSuccessState extends AppState {}

class AppGetFavoritesFailureState extends AppState {
  final String errorMessage;

  AppGetFavoritesFailureState({required this.errorMessage});
}

class AppUserLogoutSuccessState extends AppState {}

class AppGetProfileInfoLoadingState extends AppState {}

class AppGetProfileInfoSuccessState extends AppState {}

class AppGetProfileInfoFailureState extends AppState {
  final String errorMessage;

  AppGetProfileInfoFailureState({required this.errorMessage});
}

class AppUpdateProfileLoadingState extends AppState {}

class AppUpdateProfileSuccessState extends AppState {}

class AppUpdateProfileFailureState extends AppState {
  final String errorMessage;

  AppUpdateProfileFailureState({required this.errorMessage});
}

class AppGetProfileImageSuccessState extends AppState {}

class AppGetProfileImageFailureState extends AppState {
  final String errorMessage;
  AppGetProfileImageFailureState({required this.errorMessage});
}

class AppSearchForBookLoadingState extends AppState {}

class AppSearchForBookSuccessState extends AppState {}

class AppSearchForBookFailureState extends AppState {
  final String errorMessage;
  AppSearchForBookFailureState({required this.errorMessage});
}

class AppGetCategoryBooksLoadingState extends AppState {}

class AppGetCategoryBooksSuccessState extends AppState {}

class AppGetCategoryBooksFailureState extends AppState {
  final String errorMessage;
  AppGetCategoryBooksFailureState({required this.errorMessage});
}

class AppAddToFavoritesLoadingState extends AppState {}

class AppAddToFavoritesSuccessState extends AppState {}

class AppAddToFavoritesFailureState extends AppState {
  final String errorMessage;
  AppAddToFavoritesFailureState({required this.errorMessage});
}