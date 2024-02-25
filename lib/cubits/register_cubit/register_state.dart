part of 'register_cubit.dart';

@immutable
abstract class RegisterState {}

class RegisterInitial extends RegisterState {}

class RegisterChangeVisibilityPasswordState extends RegisterState {}

class RegisterChangeAutoValidateModeState extends RegisterState {}

class RegisterSendCodeSuccessState extends RegisterState {}

class RegisterSendCodeLoadingState extends RegisterState {}

class RegisterSendCodeFailureState extends RegisterState {
  final String errorMessage;

  RegisterSendCodeFailureState({required this.errorMessage});
}

class RegisterSuccessState extends RegisterState {
  final RegisterModel registerModel;

  RegisterSuccessState({required this.registerModel});
}

class RegisterLoadingState extends RegisterState {}

class RegisterFailureState extends RegisterState {
  final String errorMessage;

  RegisterFailureState({required this.errorMessage});
}
