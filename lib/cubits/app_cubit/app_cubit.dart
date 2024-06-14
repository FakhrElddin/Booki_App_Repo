import 'package:bloc/bloc.dart';
import 'package:dio/dio.dart';
import 'package:graduation_project/helper/dio_helper.dart';
import 'package:graduation_project/helper/end_points.dart';
import 'package:graduation_project/models/category_model.dart';
import 'package:meta/meta.dart';

part 'app_state.dart';

class AppCubit extends Cubit<AppState> {
  AppCubit() : super(AppInitial());

  CategoryModel? categoryModel;
  void getCategories() async{
    emit(AppGetCategoriesLoadingState());
    try {
      Response response = await DioHelper.getData(url: CATEGORIES);
      categoryModel = CategoryModel.fromJson(response.data);
      emit(AppGetCategoriesSuccessState());
    } catch (e) {
      emit(AppGetCategoriesFailureState(errorMessage: e.toString()));
    }
  }
}
