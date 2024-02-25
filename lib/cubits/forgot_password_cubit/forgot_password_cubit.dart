import 'package:bloc/bloc.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:graduation_project/helper/dio_helper.dart';
import 'package:graduation_project/helper/end_points.dart';
import 'package:meta/meta.dart';
part 'forgot_password_state.dart';

class ForgotPasswordCubit extends Cubit<ForgotPasswordState> {
  ForgotPasswordCubit() : super(ForgotPasswordInitial());

  GlobalKey<FormState> forgotPasswordFormKey = GlobalKey();
  AutovalidateMode forgotPasswordAutoValidateMode = AutovalidateMode.disabled;
  GlobalKey<FormState> verifyCodeFormKey = GlobalKey();
  AutovalidateMode verifyCodeAutoValidateMode = AutovalidateMode.disabled;
  GlobalKey<FormState> resetPasswordFormKey = GlobalKey();
  AutovalidateMode resetPasswordAutoValidateMode = AutovalidateMode.disabled;
  bool isPassword1 = true;
  bool isPassword2 = true;
  IconData password1SuffixIcon = Icons.visibility;
  IconData password2SuffixIcon = Icons.visibility;


  void forgotPasswordChangeAutoValidateMode(){
    forgotPasswordAutoValidateMode = AutovalidateMode.always;
    emit(ForgotPasswordChangeAutoValidateModeState());
  }

  void verifyCodeChangeAutoValidateMode(){
    verifyCodeAutoValidateMode = AutovalidateMode.always;
    emit(VerifyCodeChangeAutoValidateModeState());
  }

  void resetPasswordChangeAutoValidateMode(){
    resetPasswordAutoValidateMode = AutovalidateMode.always;
    emit(ResetPasswordChangeAutoValidateModeState());
  }

  void changeVisibilityPassword1(){
    isPassword1 = !isPassword1;
    isPassword1 ? password1SuffixIcon = Icons.visibility : password1SuffixIcon = Icons.visibility_off;
    emit(ResetPasswordChangeVisibilityPasswordState());
  }
  void changeVisibilityPassword2(){
    isPassword2 = !isPassword2;
    isPassword2 ? password2SuffixIcon = Icons.visibility : password2SuffixIcon = Icons.visibility_off;
    emit(ResetPasswordChangeVisibilityPasswordState());
  }
  
  void sendCodeToUser({required String email}) async{
    emit(ForgotPasswordSendCodeLoadingState());
    try {
      await DioHelper.postData(
            url: FORGOT_PASSWORD,
            data: {
              'email': email,
            },
          );
      emit(ForgotPasswordSendCodeSuccessState());
    } on DioException catch (e) {
      emit(ForgotPasswordSendCodeFailureState(errorMessage: 'There is no user with that email address'));
    } catch (e){
      emit(ForgotPasswordSendCodeFailureState(errorMessage: 'There was an error, try again later'));
    }
  }

  void receiveCodeFromUser({required String email, required String resetCode}) async{
    emit(ForgotPasswordReceiveCodeLoadingState());
    try {
      await DioHelper.postData(
            url: VERIFY_RESET_CODE,
            data: {
              'email': email,
              'resetCode': resetCode,
            },
          );
      emit(ForgotPasswordReceiveCodeSuccessState());
    } on DioException catch (e) {
      String errorMessage = e.response!.data['message'];
      emit(ForgotPasswordReceiveCodeFailureState(errorMessage: errorMessage));
    } catch (e){
      emit(ForgotPasswordReceiveCodeFailureState(errorMessage: 'There was an error, try again later'));
    }
  }

  void changePassword({required String email, required String resetCode, required String newPassword}) async{
    emit(ChangePasswordLoadingState());
    try {
      await DioHelper.patchData(
            url: RESET_PASSWORD,
            data: {
              'email': email,
              'resetCode': resetCode,
              'newPassword': newPassword,
            },
          );
      emit(ChangePasswordSuccessState());
    } on DioException catch (e) {
      String errorMessage = e.response!.data['message'];
      emit(ChangePasswordFailureState(errorMessage: errorMessage));
    } catch (e){
      emit(ChangePasswordFailureState(errorMessage: 'There was an error, try again later'));
    }
  }





  RegExp validatePin = RegExp(r"(?=.*\d)");

  bool validatePinCode({required String pin}){
    String PIN = pin.trim();
    if(validatePin.hasMatch(PIN)){
      return true;
    }else{
      return false;
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
