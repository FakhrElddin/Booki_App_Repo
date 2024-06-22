import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:graduation_project/constants.dart';
import 'package:graduation_project/cubits/app_cubit/app_cubit.dart';
import 'package:graduation_project/helper/show_toast_message.dart';
import 'package:graduation_project/widgets/custom_text_form_field.dart';

class UpdateProfileView extends StatefulWidget {
  const UpdateProfileView({super.key});

  @override
  State<UpdateProfileView> createState() => _UpdateProfileViewState();
}

class _UpdateProfileViewState extends State<UpdateProfileView> {

  TextEditingController emailController = TextEditingController();
  TextEditingController nameController = TextEditingController();
  TextEditingController cardIdController = TextEditingController();
  TextEditingController cityController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<AppCubit, AppState>(
      listener: (context, state) {
        if(state is AppUpdateProfileSuccessState){
          showToastMessage(
            context,
            message: 'Profile Updated Successfully',
            state: ToastStates.SUCCESS,
          );
        }
        if(state is AppUpdateProfileFailureState){
          showToastMessage(
            context,
            message: state.errorMessage,
            state: ToastStates.SUCCESS,
          );
        }
      },
      builder: (context, state) {
        var appCubit = BlocProvider.of<AppCubit>(context);
        emailController.text = appCubit.profileModel!.data.email;
        nameController.text = appCubit.profileModel!.data.name;
        cardIdController.text = appCubit.profileModel?.data.cardId ?? '';
        cityController.text = appCubit.profileModel?.data.city ?? '';
        return Scaffold(
          appBar: AppBar(
            centerTitle: true,
            title: const Text(
              'Update Profile',
            ),
            leading: IconButton(
              onPressed: () {
                Navigator.pop(context);
              },
              icon: const Icon(
                Icons.arrow_back_ios,
                color: Colors.black,
              ),
            ),
          ),
          body: SingleChildScrollView(
            physics: const BouncingScrollPhysics(),
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const SizedBox(
                    height: 25,
                  ),
                  Center(
                    child: Stack(
                      alignment: Alignment.bottomRight,
                      children: [
                        ClipRRect(
                          borderRadius: BorderRadius.circular(100),
                          child: appCubit.profileImage != null ? Image.file(
                            appCubit.profileImage!,
                            width: 180,
                            height: 180,
                            fit: BoxFit.cover,
                          )
                              : CachedNetworkImage(
                            width: 180,
                            height: 180,
                            fit: BoxFit.cover,
                            imageUrl: "https://t3.ftcdn.net/jpg/06/92/34/64/240_F_692346400_UzYGmrJm6qhyPPXyZeUGuyEhkwr1iSFN.jpg",
                            progressIndicatorBuilder: (context, url, downloadProgress) =>
                                Center(child: CircularProgressIndicator(value: downloadProgress.progress)),
                            errorWidget: (context, url, error) => const Center(child: Icon(Icons.error)),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: CircleAvatar(
                            radius: 20,
                            child: IconButton(
                                onPressed: () {
                                  appCubit.addProfileImage();
                                },
                                icon: const Icon(
                                  Icons.camera_alt,
                                  color: Colors.white,
                                )
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  const Text(
                    'Email',
                    style: TextStyle(
                      fontSize: 20,
                      color: Colors.grey,
                    ),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  CustomTextFormField(
                    controller: emailController,
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  const Text(
                    'Full name',
                    style: TextStyle(
                      fontSize: 20,
                      color: Colors.grey,
                    ),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  CustomTextFormField(
                    controller: nameController,
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  const Text(
                    "Card ID",
                    style: TextStyle(
                      fontSize: 20,
                      color: Colors.grey,
                    ),
                  ),
                  CustomTextFormField(
                    controller: cardIdController,
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  const Text(
                    "City/Region",
                    style: TextStyle(
                      fontSize: 20,
                      color: Colors.grey,
                    ),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  CustomTextFormField(
                    controller: cityController,
                  ),
                  const SizedBox(
                    height: 30,
                  ),
                  Center(
                    child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        textStyle: const TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.w500,
                        ),
                        backgroundColor: kPrimaryColor,
                        fixedSize: const Size(360, 60),
                      ),
                      onPressed: () {
                        appCubit.updateProfile(
                          email: emailController.text,
                          name: nameController.text,
                          cardId: cardIdController.text,
                          city: cityController.text,
                        );
                      },
                      child: const Text('Update profile'),
                    ),
                  )
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}
