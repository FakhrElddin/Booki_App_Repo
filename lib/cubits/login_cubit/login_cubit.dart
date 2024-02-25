import 'package:bloc/bloc.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:graduation_project/helper/dio_helper.dart';
import 'package:graduation_project/helper/end_points.dart';
import 'package:graduation_project/models/login_model.dart';
import 'package:meta/meta.dart';

part 'login_state.dart';

class LoginCubit extends Cubit<LoginState> {
  LoginCubit() : super(LoginInitial());

  bool isPassword = true;
  IconData passwordSuffixIcon = Icons.visibility;
  GlobalKey<FormState> formKey = GlobalKey();
  AutovalidateMode autoValidateMode = AutovalidateMode.disabled;

  void changeVisibilityPassword() {
    isPassword = !isPassword;
    isPassword
        ? passwordSuffixIcon = Icons.visibility
        : passwordSuffixIcon = Icons.visibility_off;
    emit(LoginChangeVisibilityPasswordState());
  }

  void changeAutoValidateMode() {
    autoValidateMode = AutovalidateMode.always;
    emit(LoginChangeAutoValidateModeState());
  }

  LoginModel? loginModel;

  void loginUser({required String email, required String password}) async {
    emit(LoginLoadingState());
    try {
      Response response = await DioHelper.postData(
        url: LOGIN,
        data: {
          'email': email,
          'password': password,
        },
      );
      loginModel = LoginModel.fromJson(response.data);
      emit(LoginSuccessState());
    } on DioException catch (e) {
      if (e.response!.statusCode == 400) {
        emit(LoginFailureState(errorMessage: 'This is not a valid email format'));
      } else if (e.response!.statusCode == 401) {
        emit(LoginFailureState(errorMessage: 'Email or password may be wrong'));
      } else if (e.response!.statusCode == 500) {
        emit(LoginFailureState(
            errorMessage: 'Sorry, server error try again later'));
      } else {
        emit(LoginFailureState(
            errorMessage: 'There was an error, try again later'));
      }
    } catch (e) {
      emit(LoginFailureState(
          errorMessage: 'There was an error, try again later'));
    }
  }




  RegExp validatePass = RegExp(r"(?=.*\d)(?=.*[a-z])");

  bool validatePassword({required String password}){
    String pass = password.trim();
    if(validatePass.hasMatch(pass)){
      return true;
    }else{
      return false;
    }
  }


}
