
import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:double_back_to_close_app/double_back_to_close_app.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import 'package:graduation_project/constants.dart';
import 'package:graduation_project/cubits/forgot_password_cubit/forgot_password_cubit.dart';
import 'package:graduation_project/helper/show_awesome_dialog.dart';
import 'package:graduation_project/helper/show_toast_message.dart';
import 'package:graduation_project/views/login_view.dart';
import 'package:graduation_project/widgets/custom_text_button.dart';
import 'package:graduation_project/widgets/custom_text_form_field.dart';
import 'package:graduation_project/widgets/leave_app_snack_bar.dart';

class ResetPasswordView extends StatelessWidget {
  const ResetPasswordView({super.key, required this.email, required this.resetCode});

  final String email;
  final String resetCode;
  static TextEditingController newPasswordController = TextEditingController();
  static TextEditingController confirmNewPasswordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
  create: (context) => ForgotPasswordCubit(),
  child: BlocConsumer<ForgotPasswordCubit, ForgotPasswordState>(
    listener: (context, state) {
      if(state is ChangePasswordSuccessState){
        showAwesomeDialog(
            context,
            title: 'Password Changed!',
            body: 'Your password has been changed successfully',
            dialogType: DialogType.success,
            okOnPress: (){
              Navigator.pushReplacement(context, MaterialPageRoute(builder: (context){
                return const LoginView();
              }));
            });
      }
      if(state is ChangePasswordFailureState){
        showToastMessage(
          context,
          message: state.errorMessage,
          state: ToastStates.ERROR,
        );
      }
    },
  builder: (context, state) {
    var forgotPasswordCubit = BlocProvider.of<ForgotPasswordCubit>(context);
    return AbsorbPointer(
      absorbing: state is ChangePasswordLoadingState ? true : false,
      child: Scaffold(
        body: DoubleBackToCloseApp(
          snackBar: closeAppSnackBar(),
          child: Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Center(
                    child: SingleChildScrollView(
                      child: Form(
                        key: forgotPasswordCubit.resetPasswordFormKey,
                        autovalidateMode: forgotPasswordCubit.resetPasswordAutoValidateMode,
                        child: Column(
                          children: [
                            SvgPicture.asset(
                              kBookLogo,
                              height: 150,
                              width: 150,
                            ),
                            const Text(
                              'Booki',
                              style: TextStyle(
                                fontSize: 60,
                                fontFamily: 'Pacifico',
                                fontWeight: FontWeight.bold,
                                color: kPrimaryColor,
                              ),
                            ),
                            const SizedBox(
                              height: 50,
                            ),
                            Row(
                              children: [
                                Text(
                                  'Reset Password',
                                  style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              ],
                            ),
                            const SizedBox(
                              height: 8,
                            ),
                            Text(
                              'Set the new password for your account so you can login and access all the features.',
                              style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                                fontSize: 16,
                              ),
                            ),
                            const SizedBox(
                              height: 50,
                            ),
                            CustomTextFormField(
                              readOnly: state is ChangePasswordSuccessState ? true : false,
                              controller: newPasswordController,
                              textInputAction: TextInputAction.done,
                              labelText: 'New Password',
                              hintText: 'Enter New Password',
                              validator: (value){
                                if (value?.trim().isEmpty ?? true) {
                                  return 'New Password must not be empty';
                                } else {
                                  if(value!.length < 8){
                                    return 'New Password must be at least 8 characters';
                                  }
                                  bool result = forgotPasswordCubit.validatePassword(password: value);
                                  if(result){
                                    return null;
                                  } else{
                                    return "New Password should contain letters and numbers";
                                  }
                                }
                              },
                              isPassword: forgotPasswordCubit.isPassword1,
                              suffixIcon: IconButton(
                                onPressed: (){
                                  forgotPasswordCubit.changeVisibilityPassword1();
                                },
                                icon: Icon(
                                  forgotPasswordCubit.password1SuffixIcon,
                                ),
                              ),
                            ),
                            const SizedBox(
                              height: 16,
                            ),
                            CustomTextFormField(
                              readOnly: state is ChangePasswordSuccessState ? true : false,
                              controller: confirmNewPasswordController,
                              textInputAction: TextInputAction.done,
                              labelText: 'Confirm Password',
                              hintText: 'Enter Same Password',
                              validator: (value){
                                if(value?.trim().isEmpty ?? true){
                                  return 'Confirm password must not be empty';
                                } else{
                                  if(newPasswordController.text != confirmNewPasswordController.text){
                                    return 'Confirm password does not match new password';
                                  } else{
                                    return null;
                                  }
                                }
                              },
                              isPassword: forgotPasswordCubit.isPassword2,
                              suffixIcon: IconButton(
                                onPressed: (){
                                  forgotPasswordCubit.changeVisibilityPassword2();
                                },
                                icon: Icon(
                                  forgotPasswordCubit.password2SuffixIcon,
                                ),
                              ),
                              onFieldSubmitted: (value){
                                if(
                                newPasswordController.text.trim().isEmpty
                                    || confirmNewPasswordController.text.trim().isEmpty){}
                                else{
                                  if(forgotPasswordCubit.resetPasswordFormKey.currentState!.validate()){
                                    forgotPasswordCubit.changePassword(
                                      email: email,
                                      resetCode: resetCode,
                                      newPassword: newPasswordController.text,
                                    );
                                  } else{
                                    forgotPasswordCubit.resetPasswordChangeAutoValidateMode();
                                  }
                                }
                              },
                            ),
                            const SizedBox(
                              height: 24,
                            ),
                            ConditionalBuilder(
                              condition: state is! ChangePasswordLoadingState,
                              builder: (context) => CustomTextButton(
                                text: 'Reset Password',
                                onTap: (){
                                  if(forgotPasswordCubit.resetPasswordFormKey.currentState!.validate()){
                                    forgotPasswordCubit.resetPasswordFormKey.currentState!.save();
                                    forgotPasswordCubit.changePassword(
                                        email: email,
                                        resetCode: resetCode,
                                        newPassword: newPasswordController.text,
                                    );
                                  } else{
                                    forgotPasswordCubit.resetPasswordChangeAutoValidateMode();
                                  }
                                },
                              ),
                              fallback: (context) => const Center(child: CircularProgressIndicator()),
                            ),
                            const SizedBox(
                              height: 4,
                            ),
                              if(state is ChangePasswordSuccessState || state is ChangePasswordFailureState)
                              TextButton(
                                onPressed: (){
                                  Navigator.pushReplacement(context, MaterialPageRoute(builder: (context){
                                    return const LoginView();
                                  }));
                                },
                                child: const Text(
                                  'Back to Login?',
                                  style: TextStyle(
                                    color: Colors.grey,
                                    fontSize: 16,
                                  ),
                                ),
                              ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ),
        ),
      ),
    );
  },
),
);
  }
}
