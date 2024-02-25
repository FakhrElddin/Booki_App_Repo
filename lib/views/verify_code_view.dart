import 'dart:async';

import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import 'package:graduation_project/constants.dart';
import 'package:graduation_project/cubits/bottom_nav_bar_cubit/bottom_nav_bar_cubit.dart';
import 'package:graduation_project/cubits/forgot_password_cubit/forgot_password_cubit.dart';
import 'package:graduation_project/cubits/register_cubit/register_cubit.dart';
import 'package:graduation_project/helper/show_toast_message.dart';
import 'package:graduation_project/local/cache_helper.dart';
import 'package:graduation_project/views/app_view.dart';
import 'package:graduation_project/views/reset_password_view.dart';
import 'package:graduation_project/widgets/custom_text_button.dart';
import 'package:pin_code_fields/pin_code_fields.dart';

class VerifyCodeView extends StatelessWidget {
  const VerifyCodeView({super.key, required this.email, this.isRegister = false});

  final String email;
  final bool isRegister;
  static StreamController<ErrorAnimationType> errorController = StreamController();
  static TextEditingController codeController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
  providers: [
    BlocProvider(create: (context) => ForgotPasswordCubit()),
    BlocProvider(create: (context) => RegisterCubit()),
  ],
  child: BlocConsumer<ForgotPasswordCubit, ForgotPasswordState>(
  listener: (context, state) {
    if(state is ForgotPasswordReceiveCodeSuccessState){
      Navigator.pushReplacement(context, MaterialPageRoute(builder: (context){
        return ResetPasswordView(
          email: email,
          resetCode: codeController.text,
        );
      }));
    }
    if(state is ForgotPasswordReceiveCodeFailureState){
      showToastMessage(
        context,
        message: state.errorMessage,
        state: ToastStates.ERROR,
      );
    }
  },
  builder: (context, state) {
    var forgotPasswordCubit = BlocProvider.of<ForgotPasswordCubit>(context);
    return BlocConsumer<RegisterCubit, RegisterState>(
  listener: (context, state) {
    if(state is RegisterSuccessState){
      BlocProvider.of<BottomNavBarCubit>(context).currentIndex = 0;
      CacheHelper.saveData(
        key: 'token',
        value: BlocProvider.of<RegisterCubit>(context).registerModel!.token,
      );
      print('token = ${BlocProvider.of<RegisterCubit>(context).registerModel!.token}');
      Navigator.push(context, MaterialPageRoute(builder: (context){
        return const AppView();
      }));
    }
    if(state is RegisterFailureState){
      showToastMessage(
        context,
        message: state.errorMessage,
        state: ToastStates.ERROR,
      );
    }
  },
  builder: (context, state) {
    return AbsorbPointer(
      absorbing: state is ForgotPasswordReceiveCodeLoadingState || state is RegisterSuccessState ? true : false,
      child: Scaffold(
        // appBar: AppBar(
        //   //automaticallyImplyLeading: false,
        //   centerTitle: true,
        //   title: Text(
        //     'Verify Reset Code',
        //     style: Theme.of(context).textTheme.bodyMedium!.copyWith(
        //       color: kPrimaryColor,
        //     ),
        //   ),
        // ),
        body: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Center(
            child: SingleChildScrollView(
              child: Form(
                key: forgotPasswordCubit.verifyCodeFormKey,
                autovalidateMode: forgotPasswordCubit.verifyCodeAutoValidateMode,
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
                          'Enter 6 Digits Code',
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
                      'Enter the 6 digits code that you received on your email.',
                      style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                        fontSize: 16,
                      ),
                    ),
                    const SizedBox(
                      height: 50,
                    ),
                    PinCodeTextField(
                      appContext: context,
                      length: 6,
                      obscureText: false,
                      animationType: AnimationType.fade,
                      pinTheme: PinTheme(
                        shape: PinCodeFieldShape.box,
                        borderRadius: BorderRadius.circular(5),
                        fieldHeight: 50,
                        fieldWidth: 40,
                        inactiveColor: Colors.grey[600],
                        inactiveFillColor: Colors.white,
                        selectedColor: kPrimaryColor,
                        selectedFillColor: Colors.white,
                        activeFillColor: Colors.white,
                      ),
                      animationDuration: const Duration(milliseconds: 300),
                      enableActiveFill: true,
                      keyboardType: TextInputType.number,
                      errorAnimationController: errorController,
                      controller: codeController,
                      validator: (value){
                        if(value?.isEmpty ?? true){
                          return 'PIN must be not empty';
                        } else{
                          return null;
                        }
                      },
                      onCompleted: (v) {
                        FocusManager.instance.primaryFocus?.unfocus();
                      },
                      // beforeTextPaste: (text) {
                      //   return false;
                      // },
                    ),
                    const SizedBox(
                      height: 24,
                    ),
                    ConditionalBuilder(
                      condition: state is! ForgotPasswordReceiveCodeLoadingState || state is! RegisterLoadingState,
                      builder: (context) => CustomTextButton(
                        text: 'Confirm Code',
                        onTap: (){
                          if(forgotPasswordCubit.verifyCodeFormKey.currentState!.validate()){
                            forgotPasswordCubit.verifyCodeFormKey.currentState!.save();
                            if(codeController.text.trim().length < 6){
                              showToastMessage(
                                  context,
                                  message: 'Code must be 6 digits',
                                  state: ToastStates.ERROR,
                              );
                            } else{
                              if(isRegister){
                                BlocProvider.of<RegisterCubit>(context).registerUser(
                                  email: email,
                                  code: codeController.text,
                                );
                              } else{
                                forgotPasswordCubit.receiveCodeFromUser(
                                  email: email,
                                  resetCode: codeController.text,
                                );
                              }
                            }
                          } else{
                            forgotPasswordCubit.verifyCodeChangeAutoValidateMode();
                          }
                        },
                      ),
                      fallback: (context) => const Center(child: CircularProgressIndicator()),
                    ),
                    const SizedBox(
                      height: 4,
                    ),
                    TextButton(
                      onPressed: (){
                        Navigator.pop(context);
                      },
                      child: const Text(
                        'Enter another email?',
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
    );
  },
);
  },
),
);
  }
}



