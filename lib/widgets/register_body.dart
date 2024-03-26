import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:graduation_project/constants.dart';
import 'package:graduation_project/cubits/register_cubit/register_cubit.dart';
import 'package:graduation_project/helper/show_toast_message.dart';
import 'package:graduation_project/views/verify_code_view.dart';
import 'package:graduation_project/widgets/custom_text_button.dart';
import 'package:graduation_project/widgets/custom_text_form_field.dart';

class RegisterBody extends StatelessWidget {
  const RegisterBody({super.key});

  static TextEditingController nameController = TextEditingController();
  static TextEditingController emailController = TextEditingController();
  static TextEditingController passwordController = TextEditingController();
  static TextEditingController confirmPasswordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
  create: (context) => RegisterCubit(),
  child: BlocConsumer<RegisterCubit, RegisterState>(
  listener: (context, state) {

    if(state is RegisterSendCodeSuccessState){
      Navigator.push(context, MaterialPageRoute(builder: (context){
        return VerifyCodeView(email: emailController.text,isRegister: true,);
      }));
    }
    if(state is RegisterSendCodeFailureState){
      showToastMessage(
          context,
          message: state.errorMessage,
          state: ToastStates.ERROR,
      );
    }
  },
  builder: (context, state) {
    var registerCubit = BlocProvider.of<RegisterCubit>(context);
    return AbsorbPointer(
      absorbing: state is RegisterSendCodeLoadingState ? true : false,
      child: Form(
        key: registerCubit.formKey,
        autovalidateMode: registerCubit.autoValidateMode,
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
                    controller: nameController,
                    textInputAction: TextInputAction.next,
                    labelText: 'Name',
                    hintText: 'Enter Your Name',
                    textInputType: TextInputType.name,
                    validator: (value){
                      if(value?.trim().isEmpty ?? true){
                        return 'Name must not be empty';
                      } else{
                        return null;
                      }
                    },
                  ),
                  const SizedBox(
                    height: 16,
                  ),
                  CustomTextFormField(
                    controller: emailController,
                    textInputAction: TextInputAction.next,
                    labelText: 'Email',
                    hintText: 'Enter Your Email',
                    textInputType: TextInputType.emailAddress,
                    validator: (value){
                      if(value?.trim().isEmpty ?? true){
                        return 'Email must not be empty';
                      } else{
                        return null;
                      }
                    },
                  ),
                  const SizedBox(
                    height: 16,
                  ),
                  CustomTextFormField(
                    controller: passwordController,
                    textInputAction: TextInputAction.done,
                    labelText: 'Password',
                    hintText: 'Enter Password',
                    validator: (value){
                      if (value?.trim().isEmpty ?? true) {
                        return 'Password must not be empty';
                      } else {
                        if(value!.length < 8){
                          return 'Password must be at least 8 characters';
                        }
                        bool result = registerCubit.validatePassword(password: value);
                        if(result){
                          return null;
                        } else{
                          return "Password should contain letters and numbers";
                        }
                      }
                    },
                    isPassword: registerCubit.isPassword1,
                    suffixIcon: IconButton(
                      onPressed: (){
                        registerCubit.changeVisibilityPassword1();
                      },
                      icon: Icon(
                        registerCubit.password1SuffixIcon,
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 16,
                  ),
                  CustomTextFormField(
                    controller: confirmPasswordController,
                    textInputAction: TextInputAction.done,
                    labelText: 'Confirm Password',
                    hintText: 'Enter Same Password',
                    validator: (value){
                      if(value?.trim().isEmpty ?? true){
                        return 'Confirm password must not be empty';
                      } else{
                        if(passwordController.text != confirmPasswordController.text){
                          return 'Confirm password does not match password';
                        } else{
                          return null;
                        }
                      }
                    },
                    isPassword: registerCubit.isPassword2,
                    suffixIcon: IconButton(
                      onPressed: (){
                        registerCubit.changeVisibilityPassword2();
                      },
                      icon: Icon(
                        registerCubit.password2SuffixIcon,
                      ),
                    ),
                    onFieldSubmitted: (value){
                      if(
                      nameController.text.trim().isEmpty
                          || emailController.text.trim().isEmpty
                          || passwordController.text.trim().isEmpty
                          || confirmPasswordController.text.trim().isEmpty){}
                      else{
                        if(registerCubit.formKey.currentState!.validate()){
                          registerCubit.registerSendCodeToUser(
                            name: nameController.text,
                            email: emailController.text,
                            password: passwordController.text,
                            confirmPassword: confirmPasswordController.text,
                          );
                          registerCubit.formKey.currentState?.reset();
                        } else{
                          registerCubit.changeAutoValidateMode();
                        }
                      }
                    },
                  ),
                  const SizedBox(
                    height: 32,
                  ),
                  ConditionalBuilder(
                    condition: state is! RegisterSendCodeLoadingState,
                    builder: (context) => CustomTextButton(
                      text: 'Register',
                      onTap: (){
                        if(registerCubit.formKey.currentState!.validate()){
                          registerCubit.formKey.currentState!.save();
                          registerCubit.registerSendCodeToUser(
                            name: nameController.text,
                            email: emailController.text,
                            password: passwordController.text,
                            confirmPassword: confirmPasswordController.text,
                          );
                          registerCubit.formKey.currentState?.reset();
                        } else{
                          registerCubit.changeAutoValidateMode();
                        }
                      },
                    ),
                    fallback: (context) => const Center(child: CircularProgressIndicator()),
                  ),
                  const SizedBox(
                    height: 8,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const Text(
                        'Have account?',
                        style: TextStyle(
                          color: Colors.grey,
                          fontSize: 18,
                        ),
                      ),
                      TextButton(
                        onPressed: (){
                          Navigator.pop(context);
                          registerCubit.formKey.currentState?.reset();
                        },
                        child: const Text(
                          'Login Now',
                          style: TextStyle(
                            color: kPrimaryColor,
                            fontSize: 18,
                          ),
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