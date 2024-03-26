import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:graduation_project/constants.dart';
import 'package:graduation_project/cubits/bottom_nav_bar_cubit/bottom_nav_bar_cubit.dart';
import 'package:graduation_project/cubits/login_cubit/login_cubit.dart';
import 'package:graduation_project/helper/show_toast_message.dart';
import 'package:graduation_project/local/cache_helper.dart';
import 'package:graduation_project/views/app_view.dart';
import 'package:graduation_project/views/forgot_password_view.dart';
import 'package:graduation_project/views/register_view.dart';
import 'package:graduation_project/widgets/custom_text_button.dart';
import 'package:graduation_project/widgets/custom_text_form_field.dart';

class LoginBody extends StatelessWidget {
  const LoginBody({super.key});

  static TextEditingController emailController = TextEditingController();
  static TextEditingController passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => LoginCubit(),
      child: BlocConsumer<LoginCubit, LoginState>(
        listener: (context, state) {
          if(state is LoginSuccessState){
            BlocProvider.of<BottomNavBarCubit>(context).currentIndex = 0;
            CacheHelper.saveData(
              key: 'token',
              value: BlocProvider.of<LoginCubit>(context).loginModel!.token,
            );
             print('token = ${BlocProvider.of<LoginCubit>(context).loginModel!.token}');
            Navigator.push(context, MaterialPageRoute(builder: (context){
              return const AppView();
            }));
          }
          if (state is LoginFailureState){
            showToastMessage(
              context,
              message: state.errorMessage,
              state: ToastStates.ERROR,
            );
          }
        },
        builder: (context, state) {
          var loginCubit = BlocProvider.of<LoginCubit>(context);
          return AbsorbPointer(
            absorbing: state is LoginLoadingState ? true : false,
            child: Form(
              key: loginCubit.formKey,
              autovalidateMode: loginCubit.autoValidateMode,
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16.0),
                child: Center(
                  child: SingleChildScrollView(
                    physics: const BouncingScrollPhysics(),
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
                        CustomTextFormField(
                          textInputAction: TextInputAction.next,
                          labelText: 'Email',
                          hintText: 'fakhr_elddin@gmail.com',
                          controller: emailController,
                          textInputType: TextInputType.emailAddress,
                          validator: (value) {
                            if (value?.trim().isEmpty ?? true) {
                              return 'Email must not be empty';
                            } else {
                              return null;
                            }
                          },
                          onFieldSubmitted: (value) {},
                        ),
                        const SizedBox(
                          height: 16,
                        ),
                        CustomTextFormField(
                          textInputAction: TextInputAction.done,
                          textInputType: TextInputType.visiblePassword,
                          labelText: 'Password',
                          hintText: 'Enter Your Password',
                          controller: passwordController,
                          validator: (value) {
                            if (value?.trim().isEmpty ?? true) {
                                return 'Password must not be empty';
                            } else {
                              return null;
                            }
                          },
                          isPassword: loginCubit.isPassword,
                          suffixIcon: IconButton(
                            onPressed: () {
                              loginCubit.changeVisibilityPassword();
                            },
                            icon: Icon(
                                loginCubit.passwordSuffixIcon,
                            ),
                          ),
                          onFieldSubmitted: (value){
                            if(emailController.text.trim().isEmpty || passwordController.text.trim().isEmpty){}
                            else{
                              if(loginCubit.formKey.currentState!.validate()){
                                loginCubit.loginUser(
                                  email: emailController.text,
                                  password: passwordController.text,
                                );
                                loginCubit.formKey.currentState?.reset();
                              } else{
                                loginCubit.changeAutoValidateMode();
                              }
                            }
                          },
                        ),
                        const SizedBox(
                          height: 4,
                        ),
                        TextButton(
                          onPressed: () {
                            Navigator.push(
                                context, MaterialPageRoute(builder: (context) {
                              return const ForgotPasswordView();
                            }));
                            loginCubit.formKey.currentState?.reset();
                          },
                          child: const Text(
                            'Forget password?',
                            style: TextStyle(
                              color: Colors.grey,
                              fontSize: 16,
                            ),
                          ),
                        ),
                        const SizedBox(
                          height: 4,
                        ),
                        ConditionalBuilder(
                          condition: state is! LoginLoadingState,
                          builder: (context) => CustomTextButton(
                            text: 'Log In',
                            onTap: () {
                              if (loginCubit.formKey.currentState!.validate()) {
                                loginCubit.formKey.currentState!.save();
                                loginCubit.loginUser(
                                  email: emailController.text,
                                  password: passwordController.text,
                                );
                              } else {
                                loginCubit.changeAutoValidateMode();
                              }
                            },
                          ),
                          fallback: (context) => const Center(child: CircularProgressIndicator()),
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            const Text(
                              "Don't have an account?",
                              style: TextStyle(
                                fontSize: 18,
                              ),
                            ),
                            TextButton(
                              onPressed: () {
                                Navigator.push(context,
                                    MaterialPageRoute(builder: (context) {
                                      return const RegisterView();
                                    }));
                                loginCubit.formKey.currentState?.reset();
                              },
                              child: const Text(
                                'sign up',
                                style: TextStyle(
                                  fontSize: 18,
                                  color: kPrimaryColor,
                                ),
                              ),
                            ),
                          ],
                        ),
                        const SizedBox(
                          height: 8,
                        ),
                        const Text(
                          'or sign up with',
                          style: TextStyle(
                            color: Colors.grey,
                            fontSize: 16,
                          ),
                        ),
                        const SizedBox(
                          height: 24,
                        ),
                        const Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            CircleAvatar(
                              backgroundImage: AssetImage(
                                'assets/images/google.png',
                              ),
                            ),
                            SizedBox(
                              width: 32,
                            ),
                            CircleAvatar(
                              backgroundImage: AssetImage(
                                'assets/images/apple.png',
                              ),
            
                            ),
                            SizedBox(
                              width: 32,
                            ),
                            CircleAvatar(
                              backgroundImage: AssetImage(
                                'assets/images/facebook.png',
                              ),
                            ),
                          ],
                        ),
                      ],
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