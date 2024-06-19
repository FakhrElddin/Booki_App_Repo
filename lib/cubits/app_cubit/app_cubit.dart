import 'dart:io';

import 'package:bloc/bloc.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:graduation_project/constants.dart';
import 'package:graduation_project/helper/dio_helper.dart';
import 'package:graduation_project/helper/end_points.dart';
import 'package:graduation_project/models/add_book_model.dart';
import 'package:graduation_project/models/category_model.dart';
import 'package:graduation_project/models/user_books_model.dart';
import 'package:image_picker/image_picker.dart';
import 'package:meta/meta.dart';

part 'app_state.dart';

class AppCubit extends Cubit<AppState> {
  AppCubit() : super(AppInitial());

  CategoryModel? categoryModel;
  List<String> categoryNamesList = [];
  List<String> categoryIdsList = [];
  String? addBookCategoryValue;
  String? addBookStateValue;

  void getCategories() async {
    emit(AppGetCategoriesLoadingState());
    try {
      Response response = await DioHelper.getData(url: CATEGORIES);
      categoryModel = CategoryModel.fromJson(response.data);
      for (int i = 0; i < categoryModel!.data.length; i++) {
        categoryNamesList.add(categoryModel!.data[i].name);
        categoryIdsList.add(categoryModel!.data[i].id);
      }
      emit(AppGetCategoriesSuccessState());
    } catch (e) {
      emit(AppGetCategoriesFailureState(errorMessage: e.toString()));
    }
  }

  void changeAddBookSelectedCategory({required String categoryValue}) {
    addBookCategoryValue = categoryValue;
    emit(AppChangeAddBookSelectedCategoryState());
  }

  void changeAddBookSelectedState({required String stateValue}) {
    addBookStateValue = stateValue;
    emit(AppChangeAddBookStateValueState());
  }

  final ImagePicker picker = ImagePicker();
  File? bookCoverImage;

  void addBookCoverImage() async {
    final pickedFile = await picker.pickImage(
      source: ImageSource.gallery,
    );
    if (pickedFile != null) {
      bookCoverImage = File(pickedFile.path);
      emit(AppGetBookCoverImageSuccessState());
      //var image = await MultipartFile.fromFile(bookCoverImage!.path, filename: 'image.jpg');
      //print(image);
      print(bookCoverImage);
      print(Uri.parse(bookCoverImage!.path).pathSegments.last);
    } else {
      emit(AppGetBookCoverImageFailureState(
          errorMessage: 'Cover Image Not Selected, Try Again'));
    }
  }

  File? bookStubImage;
  void addBookStubImage() async {
    final pickedFile = await picker.pickImage(
      source: ImageSource.gallery,
    );
    if (pickedFile != null) {
      bookStubImage = File(pickedFile.path);
      emit(AppGetBookStubImageSuccessState());
      print(bookStubImage);
      print(Uri.parse(bookStubImage!.path).pathSegments.last);
    } else {
      emit(AppGetBookStubImageFailureState(
          errorMessage: 'Stub Image Not Selected, Try Again'));
    }
  }

  File? bookPrintingImage;
  void addBookPrintingImage() async {
    final pickedFile = await picker.pickImage(
      source: ImageSource.gallery,
    );
    if (pickedFile != null) {
      bookPrintingImage = File(pickedFile.path);
      emit(AppGetBookPrintingImageSuccessState());
      print(bookPrintingImage);
      print(Uri.parse(bookPrintingImage!.path).pathSegments.last);
    } else {
      emit(AppGetBookPrintingImageFailureState(
          errorMessage: 'Printing Image Not Selected, Try Again'));
    }
  }

  void addBook({
    required String name,
    required String price,
    required String usedTime,
    required String edition,
  }) async {
    emit(AppAddBookLoadingState());
    try {
      // AddBookModel addBookModel = AddBookModel(
      //   title: name,
      //   price: price,
      //   usedTime: usedTime,
      //   edition: edition,
      //   category: category,
      //   state: state,
      //   coverImage: coverImage,
      //   images: [
      //     stubImage,
      //     printingImage,
      //   ],
      // );
      // //
      var formData = FormData.fromMap({
        'title': name,
        'price': price,
        'usedTime': usedTime,
        'edition': edition,
        'category': addBookCategoryValue,
        'state': addBookStateValue,
        'coverImage': await MultipartFile.fromFile(bookCoverImage!.path),
        'images': [
          await MultipartFile.fromFile(bookStubImage!.path),
          await MultipartFile.fromFile(bookPrintingImage!.path),
        ],
      });
      Dio dio = Dio();
      Response response = await dio.post('http://10.0.2.2:4000/api/v1/books',
          data: formData,
          options: Options(
            headers: {
              'Content-Type': 'application/json',
              'Authorization': 'Bearer $token',
            },
          ));
      /////
      // Response response = await DioHelper.postData(
      //   url: ADDBOOK,
      //   data: {
      //         'title': name,
      //         'price': price,
      //         'usedTime': usedTime,
      //         'edition': edition,
      //         'category': addBookCategoryValue,
      //         'state': addBookStateValue,
      //         'coverImage': Uri.parse(bookCoverImage!.path).pathSegments.last,
      //         'images': [
      //           Uri.parse(bookStubImage!.path).pathSegments.last,
      //           Uri.parse(bookPrintingImage!.path).pathSegments.last,
      //         ],
      //       },
      //   token: token,
      //     );
      ///////
      // print('name: $name, price: $price, usedTime: $usedTime, edition: $edition');
      // print('category: $addBookCategoryValue, state: $addBookStateValue');
      // print(Uri.parse(bookCoverImage!.path).pathSegments.last);
      // print(Uri.parse(bookStubImage!.path).pathSegments.last);
      // print(Uri.parse(bookPrintingImage!.path).pathSegments.last);
      print('add book success state : ${response.data}');
      emit(AppAddBookSuccessState());
    } on DioException catch (e) {
      print('add book failure state 1');
      print(e.response?.data ?? 'response is null');
      emit(AppAddBookFailureState(errorMessage: 'dio error'));
    } catch (e) {
      print('add book failure state 2 : ${e.toString()}');
      emit(AppAddBookFailureState(
          errorMessage: 'There was an error, try again'));
    }
  }

  UserBooksModel? userBooksModel;
  void getUserBooks() async{
    emit(AppGetUserBooksLoadingState());
    try {
      Response response = await DioHelper.getData(
            url: '/api/v1/user/$userId/books',
          );
      userBooksModel = UserBooksModel.fromJson(response.data);
      emit(AppGetUserBooksSuccessState());
    } catch (e) {
      emit(AppGetUserBooksFailureState(errorMessage: 'There was an error'));
    }
  }
}
