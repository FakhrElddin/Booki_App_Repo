import 'dart:io';

import 'package:bloc/bloc.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:graduation_project/constants.dart';
import 'package:graduation_project/helper/dio_helper.dart';
import 'package:graduation_project/helper/end_points.dart';
import 'package:graduation_project/models/add_book_model.dart';
import 'package:graduation_project/models/category_model.dart';
import 'package:graduation_project/models/favorites_model.dart';
import 'package:graduation_project/models/home_grid_books_model.dart';
import 'package:graduation_project/models/profile_model.dart';
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
      List<MultipartFile> images = [];
      images.add(await MultipartFile.fromFile(bookStubImage!.path, filename: bookStubImage!.path.split('/').last,));
      images.add(await MultipartFile.fromFile(bookPrintingImage!.path, filename: bookPrintingImage!.path.split('/').last,));
      var formData = FormData.fromMap({
        'title': name,
        'price': price,
        'usedTime': usedTime,
        'edition': edition,
        'category': addBookCategoryValue,
        'state': addBookStateValue,
        'coverImage': await MultipartFile.fromFile(bookStubImage!.path, filename: bookStubImage!.path.split('/').last,),
        'images': images,
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
      print('add book success state : ${response.data}');
      getUserBooks();
      getHomeGridBooks();
      emit(AppAddBookSuccessState());
    } on DioException catch (e) {
      print('add book failure state 1');
      print(e.response?.data ?? 'response is null');
      emit(AppAddBookFailureState(errorMessage: e.response!.data['errors'][0]['msg']));
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

  int pageNumber = 1;
  HomeGridBooksModel? homeGridBooksModel;
  List<HomeGridBooksDataModel> homeGridBooks = [];
  void getHomeGridBooks({bool fromPagination = false}) async{
    if(fromPagination){
      emit(AppGetNextPageForHomeGridBooksLoadingState());
      pageNumber++;
    } else{
      emit(AppGetHomeGridBooksLoadingState());
    }
    try {
      Response response = await DioHelper.getData(
            url: 'api/v1/books?page=$pageNumber&limit=9',
          );
      homeGridBooksModel = HomeGridBooksModel.fromJson(response.data);
      for(var book in homeGridBooksModel!.data){
        homeGridBooks.add(book);
      }
      emit(AppGetHomeGridBooksSuccessState());
    } on DioException catch(e){
      print('1');
      print(e.response!.data);
      emit(AppGetHomeGridBooksFailureState(errorMessage: 'There was an error'));
    }
    catch (e) {
      print('2');
      print(e.toString());
      emit(AppGetHomeGridBooksFailureState(errorMessage: 'There was an error'));
    }
  }

  void getNextPageForHomeGridBooks({required bool fromPagination}){
    if(pageNumber >= homeGridBooksModel!.paginationResult.numberOfPages){}
    else{
      getHomeGridBooks(fromPagination: fromPagination);
    }
  }

  FavoritesModel? favoritesModel;
  List<FavoritesDataModel> favoritesList = [];
  void getUserFavorites() async{
    try {
      Response response = await DioHelper.getData(
            url: 'api/v1/wishlist',
            token: token,
          );
      favoritesModel = FavoritesModel.fromJson(response.data);
      for(var book in favoritesModel!.data){
        favoritesList.add(book);
      }
      print(favoritesModel!.data[0].images);
      print(favoritesList[0].images);
    } on DioException catch(e){
      emit(AppGetFavoritesFailureState(errorMessage: 'There was an error, try again later'));
      print(e.response.toString());
    } catch (e) {
      emit(AppGetFavoritesFailureState(errorMessage: 'There was an error, try again'));
    }
  }

  ProfileModel? profileModel;
  void getProfileInfo() async{
    emit(AppGetProfileInfoLoadingState());
    try {
      Response response = await DioHelper.getData(
        url: PROFILEINFO,
        token: token,
          );
      profileModel = ProfileModel.formJson(response.data);
      print('profile data = ${profileModel!.data.email}');
      emit(AppGetProfileInfoSuccessState());
    } on DioException catch(e){
      print('1');
      print(e.response!.data);
      emit(AppGetProfileInfoFailureState(errorMessage: 'You are not logged in'));
    }
    catch (e) {
      print('2');
      print(e.toString());
      emit(AppGetProfileInfoFailureState(errorMessage: 'There was an error'));
    }
  }

  void logoutUser(){
    profileModel = null;
    print(profileModel?.data.email);
  }

  File? profileImage;
  void addProfileImage() async {
    final pickedFile = await picker.pickImage(
      source: ImageSource.gallery,
    );
    if (pickedFile != null) {
      profileImage = File(pickedFile.path);
      emit(AppGetProfileImageSuccessState());
      print(profileImage);
      print(Uri.parse(profileImage!.path).pathSegments.last);
    } else {
      emit(AppGetProfileImageFailureState(
          errorMessage: 'Profile Image Not Selected, Try Again'));
    }
  }

  void updateProfile({
    required String email,
    required String name,
    String? cardId,
    String? city,
  }) async{
    emit(AppUpdateProfileLoadingState());
    print(email);
    print(name);
    print(cardId);
    print(city);
    var formData = FormData.fromMap({
      'email': email,
      'title': name,
      'city': city ?? 'Faiyum',
      'cardId': cardId ?? '00000000000000',
      'profileImage': await MultipartFile.fromFile(profileImage!.path),
    });
    try {
      Dio dio = Dio();
      dio.options.headers = {
        'Content-Type': 'application/json',
        'Authorization': 'Bearer $token',

      };
      Response response = await dio.put(
        'http://10.0.2.2:4000/api/v1/user/updateData',
        data: formData,
      );
      // Response response = await DioHelper.putDat(
      //       url: UPDATEPROFILE,
      //       data: {
      //         'profileImage': profileImage ?? 'https://t3.ftcdn.net/jpg/06/92/34/64/240_F_692346400_UzYGmrJm6qhyPPXyZeUGuyEhkwr1iSFN.jpg',
      //         'email': email,
      //         'name': name,
      //         'city': city ?? 'Faiyum',
      //         'cardId': cardId ?? '00000000000000',
      //       },
      //     );
      print(response.data);
      emit(AppUpdateProfileSuccessState());
    } on DioException catch(e){
      print('first');
      print(e.response!.data);
      emit(AppUpdateProfileFailureState(errorMessage: 'Failed to update profile'));
    }
    catch (e) {
      print('second');
      print(e);
      emit(AppUpdateProfileFailureState(errorMessage: 'There was an error'));
    }
  }

}
