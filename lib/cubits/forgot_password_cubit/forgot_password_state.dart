part of 'forgot_password_cubit.dart';

@immutable
abstract class ForgotPasswordState {}

class ForgotPasswordInitial extends ForgotPasswordState {}

class ForgotPasswordChangeAutoValidateModeState extends ForgotPasswordState {}

class VerifyCodeChangeAutoValidateModeState extends ForgotPasswordState {}

class ResetPasswordChangeAutoValidateModeState extends ForgotPasswordState {}

class ResetPasswordChangeVisibilityPasswordState extends ForgotPasswordState {}

class ForgotPasswordSendCodeSuccessState extends ForgotPasswordState {}

class ForgotPasswordSendCodeLoadingState extends ForgotPasswordState {}

class ForgotPasswordSendCodeFailureState extends ForgotPasswordState {
  final String errorMessage;

  ForgotPasswordSendCodeFailureState({required this.errorMessage});
}

class ForgotPasswordReceiveCodeSuccessState extends ForgotPasswordState {}

class ForgotPasswordReceiveCodeLoadingState extends ForgotPasswordState {}

class ForgotPasswordReceiveCodeFailureState extends ForgotPasswordState {
  final String errorMessage;

  ForgotPasswordReceiveCodeFailureState({required this.errorMessage});
}

class ChangePasswordSuccessState extends ForgotPasswordState {}

class ChangePasswordLoadingState extends ForgotPasswordState {}

class ChangePasswordFailureState extends ForgotPasswordState {
  final String errorMessage;

  ChangePasswordFailureState({required this.errorMessage});
}
