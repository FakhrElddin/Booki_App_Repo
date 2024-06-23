import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:graduation_project/constants.dart';
import 'package:graduation_project/cubits/app_cubit/app_cubit.dart';
import 'package:graduation_project/helper/show_toast_message.dart';
import 'package:graduation_project/widgets/add_book_photo_item.dart';
import 'package:graduation_project/widgets/custom_text_form_field.dart';

class AddBookView extends StatefulWidget {
  const AddBookView({super.key});

  @override
  State<AddBookView> createState() => _AddBookViewState();
}

class _AddBookViewState extends State<AddBookView> {
  bool? checkBoxValue = false;

  TextEditingController nameController = TextEditingController();
  TextEditingController priceController = TextEditingController();
  TextEditingController usedTimeController = TextEditingController();
  TextEditingController editionController = TextEditingController();
  GlobalKey<FormState> formKey = GlobalKey();
  AutovalidateMode autoValidateMode = AutovalidateMode.disabled;

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<AppCubit, AppState>(
      listener: (context, state) {
        if(state is AppAddBookFailureState){
          showToastMessage(
            context,
            message: state.errorMessage,
            state: ToastStates.ERROR,
          );
        }
        if(state is AppAddBookSuccessState){
          BlocProvider.of<AppCubit>(context).bookCoverImage = null;
          BlocProvider.of<AppCubit>(context).bookStubImage = null;
          BlocProvider.of<AppCubit>(context).bookPrintingImage = null;
          BlocProvider.of<AppCubit>(context).addBookCategoryValue = null;
          BlocProvider.of<AppCubit>(context).addBookStateValue = null;
          Navigator.pop(context);
        }
      },
      builder: (context, state) {
        final appCubit = BlocProvider.of<AppCubit>(context);
        return Scaffold(
          appBar: AppBar(
            centerTitle: true,
            title: const Text(
              'Add book to your gallery',
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
          body: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Form(
              key: formKey,
              autovalidateMode: autoValidateMode,
              child: Column(
                children: [
                  Expanded(
                    child: SingleChildScrollView(
                      physics: const BouncingScrollPhysics(),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const Text(
                            'book photos',
                          ),
                          const SizedBox(
                            height: 16,
                          ),
                          Row(
                            children: [
                              Expanded(
                                child: AddBookPhotoItem(
                                  photoName: 'Cover',
                                  onTap: () {
                                    appCubit.addBookCoverImage();
                                  },
                                  imagePath: appCubit.bookCoverImage,
                                ),
                              ),
                              const SizedBox(
                                width: 12,
                              ),
                              Expanded(
                                child: AddBookPhotoItem(
                                  photoName: 'Stub',
                                  onTap: () {
                                    appCubit.addBookStubImage();
                                  },
                                  imagePath: appCubit.bookStubImage,
                                ),
                              ),
                              const SizedBox(
                                width: 12,
                              ),
                              Expanded(
                                child: AddBookPhotoItem(
                                  photoName: 'Printing',
                                  onTap: () {
                                    appCubit.addBookPrintingImage();
                                  },
                                  imagePath: appCubit.bookPrintingImage,
                                ),
                              ),
                            ],
                          ),
                          const SizedBox(
                            height: 32,
                          ),
                          const Text(
                            'book information',
                          ),
                          const SizedBox(
                            height: 16,
                          ),
                          CustomTextFormField(
                            hintText: 'Name',
                            labelText: 'Name',
                            controller: nameController,
                            filledColor: true,
                            fillColor: Colors.grey[200],
                            validator: (value){
                              if(value?.isEmpty ?? true){
                                return 'book name must be not empty';
                              } else {
                                return null;
                              }
                            },
                          ),
                          const SizedBox(
                            height: 16,
                          ),
                          Row(
                            children: [
                              Expanded(
                                flex: 3,
                                child: CustomTextFormField(
                                  hintFontSize: 12,
                                  hintText: '200 EGP',
                                  labelText: 'Price',
                                  controller: priceController,
                                  filledColor: true,
                                  fillColor: Colors.grey[200],
                                  textInputType: TextInputType.number,
                                  validator: (value){
                                    if(value?.isEmpty ?? true){
                                      return 'price is empty';
                                    } else {
                                      return null;
                                    }
                                  },
                                ),
                              ),
                              const SizedBox(
                                width: 8,
                              ),
                              Expanded(
                                flex: 4,
                                child: CustomTextFormField(
                                  hintFontSize: 12,
                                  hintText: '2 years',
                                  labelText: 'Used Time',
                                  controller: usedTimeController,
                                  filledColor: true,
                                  fillColor: Colors.grey[200],
                                  textInputType: TextInputType.number,
                                  validator: (value){
                                    if(value?.isEmpty ?? true){
                                      return 'time used is empty';
                                    } else {
                                      return null;
                                    }
                                  },
                                ),
                              ),
                              const SizedBox(
                                width: 8,
                              ),
                              Expanded(
                                flex: 3,
                                child: CustomTextFormField(
                                  hintFontSize: 12,
                                  hintText: '1990',
                                  labelText: 'Edition',
                                  controller: editionController,
                                  filledColor: true,
                                  fillColor: Colors.grey[200],
                                  textInputType: TextInputType.number,
                                  validator: (value){
                                    if(value?.isEmpty ?? true){
                                      return 'edition is empty';
                                    } else {
                                      return null;
                                    }
                                  },
                                ),
                              ),
                            ],
                          ),
                          const SizedBox(
                            height: 16,
                          ),
                          Text(
                            'Book State',
                            style: Theme.of(context).textTheme.bodyLarge,
                          ),
                          const SizedBox(
                            height: 4,
                          ),
                          Container(
                            decoration: BoxDecoration(
                              border: Border.all(),
                              borderRadius: BorderRadius.circular(10),
                              color: Colors.grey[200],
                            ),
                            child: DropdownButton(
                              borderRadius: BorderRadius.circular(10),
                              value: appCubit.addBookCategoryValue,
                              isExpanded: true,
                              padding: const EdgeInsets.symmetric(horizontal: 12),
                              icon: const Icon(
                                Icons.arrow_drop_down,
                              ),
                              hint: const Text('Category'),
                              items: [
                                for (int i = 0;
                                    i < appCubit.categoryNamesList.length;
                                    i++)
                                  DropdownMenuItem(
                                    value: appCubit.categoryIdsList[i],
                                    child: Text(
                                      appCubit.categoryNamesList[i],
                                    ),
                                  ),
                              ],
                              onChanged: (value) {
                                appCubit.changeAddBookSelectedCategory(
                                    categoryValue: value!);
                              },
                            ),
                          ),
                          const SizedBox(
                            height: 16,
                          ),
                          Text(
                            'Book State',
                            style: Theme.of(context).textTheme.bodyLarge,
                          ),
                          const SizedBox(
                            height: 4,
                          ),
                          Row(
                            children: [
                              // Expanded(
                              //   child: Row(
                              //     children: [
                              //       Transform.scale(
                              //         scale: 1.4,
                              //         child: Checkbox(
                              //           value: checkBoxValue,
                              //           onChanged: (value) {
                              //             setState(() {
                              //               checkBoxValue = value;
                              //             });
                              //           },
                              //         ),
                              //       ),
                              //       const Text(
                              //         'Negotiable',
                              //         style: TextStyle(
                              //           fontSize: 20,
                              //         ),
                              //       ),
                              //     ],
                              //   ),
                              // ),
                              Expanded(
                                child: Container(
                                  decoration: BoxDecoration(
                                    border: Border.all(),
                                    borderRadius: BorderRadius.circular(10),
                                    color: Colors.grey[200],
                                  ),
                                  child: DropdownButton(
                                    borderRadius: BorderRadius.circular(10),
                                    value: appCubit.addBookStateValue,
                                    padding: const EdgeInsets.symmetric(
                                        horizontal: 12),
                                    icon: const Icon(
                                      Icons.arrow_drop_down,
                                    ),
                                    hint: const Text('State'),
                                    isExpanded: true,
                                    items: const [
                                      DropdownMenuItem(
                                        value: 'Poor',
                                        child: Text(
                                          'Poor',
                                        ),
                                      ),
                                      DropdownMenuItem(
                                        value: 'Good',
                                        child: Text(
                                          'Good',
                                        ),
                                      ),
                                      DropdownMenuItem(
                                        value: 'Very Good',
                                        child: Text(
                                          'Very Good',
                                        ),
                                      ),
                                      DropdownMenuItem(
                                        value: 'Excellent',
                                        child: Text(
                                          'Excellent',
                                        ),
                                      ),
                                    ],
                                    onChanged: (value) {
                                      appCubit.changeAddBookSelectedState(
                                          stateValue: value!);
                                    },
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ),
                  SizedBox(
                    width: double.infinity,
                    height: 60,
                    child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        textStyle: const TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.w500,
                        ),
                        backgroundColor: kPrimaryColor,
                        foregroundColor: Colors.white,
                      ),
                      onPressed: () {
                        if(formKey.currentState!.validate()){
                          appCubit.addBook(
                            name: nameController.text,
                            price: priceController.text,
                            usedTime: usedTimeController.text,
                            edition: editionController.text,
                          );
                        } else{
                          setState(() {
                            autoValidateMode = AutovalidateMode.always;
                          });
                        }
                      },
                      child: const Text(
                        'Publish',
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}
