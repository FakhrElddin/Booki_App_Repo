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
