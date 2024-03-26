import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:graduation_project/constants.dart';
import 'package:graduation_project/cubits/forgot_password_cubit/forgot_password_cubit.dart';
import 'package:graduation_project/helper/show_toast_message.dart';
import 'package:graduation_project/views/verify_code_view.dart';
import 'package:graduation_project/widgets/custom_text_button.dart';
import 'package:graduation_project/widgets/custom_text_form_field.dart';


class ForgotPasswordView extends StatelessWidget {
  const ForgotPasswordView({super.key});

  static TextEditingController emailController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => ForgotPasswordCubit(),
      child: BlocConsumer<ForgotPasswordCubit, ForgotPasswordState>(
        listener: (context, state) {
          if(state is ForgotPasswordSendCodeSuccessState){
            Navigator.push(context, MaterialPageRoute(builder: (context){
              return VerifyCodeView(email: emailController.text,);
            }));
          }
          if(state is ForgotPasswordSendCodeFailureState){
            showToastMessage(
              context,
              message: state.errorMessage,
              state: ToastStates.ERROR,
              positionedToastBuilder: (context, child){
                return Positioned(
                  bottom: 42.0,
                  left: 32.0,
                  right: 32.0,
                  child: child,
                );
              },
            );
          }
        },
        builder: (context, state) {
          var forgotPasswordCubit = BlocProvider.of<ForgotPasswordCubit>(context);
          return AbsorbPointer(
            absorbing: state is ForgotPasswordSendCodeLoadingState ? true : false,
            child: Scaffold(
              body: Padding(
                padding: const EdgeInsets.all(16.0),
                child: Center(
                  child: SingleChildScrollView(
                    child: Form(
                      key: forgotPasswordCubit.forgotPasswordFormKey,
                      autovalidateMode: forgotPasswordCubit.forgotPasswordAutoValidateMode,
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
                                'Forgot Password',
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
                            'Enter your email for the verification process, we will send 6 digits code to your email.',
                            style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                              fontSize: 16,
                            ),
                          ),
                          const SizedBox(
                            height: 50,
                          ),
                          CustomTextFormField(
                            controller: emailController,
                            textInputAction: TextInputAction.done,
                            labelText: 'Email',
                            hintText: 'Enter Your Email',
                            textInputType: TextInputType.emailAddress,
                            validator: (value){
                              if(value?.isEmpty ?? true){
                                return 'Email must not be empty';
                              } else{
                                return null;
                              }
                            },
                            onFieldSubmitted: (value){
                              if(emailController.text.trim().isEmpty){}
                              else {
                                if(forgotPasswordCubit.forgotPasswordFormKey.currentState!.validate()){
                                  forgotPasswordCubit.forgotPasswordFormKey.currentState!.save();
                                  forgotPasswordCubit.sendCodeToUser(
                                    email: emailController.text,
                                  );
                                } else{
                                  forgotPasswordCubit.forgotPasswordChangeAutoValidateMode();
                                }
                              }
                            },
                          ),
                          const SizedBox(
                            height: 24,
                          ),
                          ConditionalBuilder(
                            condition: state is! ForgotPasswordSendCodeLoadingState,
                            builder: (context) => CustomTextButton(
                              text: 'Send Code',
                              onTap: (){
                                if(forgotPasswordCubit.forgotPasswordFormKey.currentState!.validate()){
                                  forgotPasswordCubit.forgotPasswordFormKey.currentState!.save();
                                  forgotPasswordCubit.sendCodeToUser(
                                    email: emailController.text,
                                  );
                                  forgotPasswordCubit.forgotPasswordFormKey.currentState?.reset();
                                } else{
                                  forgotPasswordCubit.forgotPasswordChangeAutoValidateMode();
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
                              forgotPasswordCubit.forgotPasswordFormKey.currentState?.reset();
                            },
                            child: const Text(
                              'Back to login?',
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
      ),
    );
  }
}
