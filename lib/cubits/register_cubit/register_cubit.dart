import 'package:bloc/bloc.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:graduation_project/helper/dio_helper.dart';
import 'package:graduation_project/helper/end_points.dart';
import 'package:graduation_project/models/register_model.dart';
import 'package:meta/meta.dart';

part 'register_state.dart';

class RegisterCubit extends Cubit<RegisterState> {
  RegisterCubit() : super(RegisterInitial());

  bool isPassword1 = true;
  bool isPassword2 = true;
  IconData password1SuffixIcon = Icons.visibility;
  IconData password2SuffixIcon = Icons.visibility;
  GlobalKey<FormState> formKey = GlobalKey();
  AutovalidateMode autoValidateMode = AutovalidateMode.disabled;

  void changeVisibilityPassword1(){
    isPassword1 = !isPassword1;
    isPassword1 ? password1SuffixIcon = Icons.visibility : password1SuffixIcon = Icons.visibility_off;
    emit(RegisterChangeVisibilityPasswordState());
  }
  void changeVisibilityPassword2(){
    isPassword2 = !isPassword2;
    isPassword2 ? password2SuffixIcon = Icons.visibility : password2SuffixIcon = Icons.visibility_off;
    emit(RegisterChangeVisibilityPasswordState());
  }
  void changeAutoValidateMode(){
    autoValidateMode = AutovalidateMode.always;
    emit(RegisterChangeAutoValidateModeState());
  }


  void registerSendCodeToUser({
    required String name,
    required String email,
    required String password,
    required String confirmPassword,
  }) async{
    emit(RegisterSendCodeLoadingState());
    try {
      await DioHelper.postData(
            url: SIGNUP,
            data: {
              'name': name,
              'email': email,
              'password': password,
              'passwordConfirm': confirmPassword,
            },
          );
      emit(RegisterSendCodeSuccessState());
    } on DioException catch (e) {
        RegisterErrorModel errorModel = RegisterErrorModel.fromJson(e.response!.data);
        emit(RegisterSendCodeFailureState(
            errorMessage: errorModel.errors![0].message));
    } catch (e){
      emit(RegisterSendCodeFailureState(
          errorMessage: 'There was an error, try again later'));
    }
  }

  RegisterModel? registerModel;
  void registerUser({required String email, required String code}) async{
    emit(RegisterLoadingState());
    try {
      Response response = await DioHelper.putData(
            url: VERIFY_OTP,
            data: {
              'email': email,
              'OTP': code,
            },
          );
      registerModel = RegisterModel.fromJson(response.data);
      emit(RegisterSuccessState(registerModel: registerModel!));
    } on DioException catch (e) {
      String errorMessage = e.response!.data['message'];
      emit(RegisterFailureState(errorMessage: errorMessage));
    } catch (e){
      print('error = ${e.toString()}');
      emit(RegisterFailureState(errorMessage: 'There was an error, try again later'));
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
