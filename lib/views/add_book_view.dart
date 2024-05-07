import 'package:flutter/material.dart';
import 'package:graduation_project/constants.dart';
import 'package:graduation_project/widgets/add_book_photo_item.dart';
import 'package:graduation_project/widgets/custom_text_form_field.dart';

class AddBookView extends StatelessWidget {
  const AddBookView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text(
          'Add book to your gallery',
        ),
        leading: IconButton(
          onPressed: (){
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
                            onTap: (){},
                          ),
                        ),
                        const SizedBox(
                          width: 12,
                        ),
                        Expanded(
                          child: AddBookPhotoItem(
                            photoName: 'Stub',
                            onTap: (){},
                          ),
                        ),
                        const SizedBox(
                          width: 12,
                        ),
                        Expanded(
                          child: AddBookPhotoItem(
                            photoName: 'Printing',
                            onTap: (){},
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
                      filledColor: true,
                      fillColor: Colors.grey[200],
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
                            labelText: 'price',
                            filledColor: true,
                            fillColor: Colors.grey[200],
                            textInputType: TextInputType.number,
                            suffixIcon: Column(
                              children: [
                                IconButton(
                                  padding: EdgeInsets.zero,
                                  constraints: const BoxConstraints(),
                                  onPressed: (){},
                                  icon: const Icon(
                                    Icons.arrow_drop_up,
                                  ),
                                ),
                                IconButton(
                                  padding: EdgeInsets.zero,
                                  constraints: const BoxConstraints(),
                                  onPressed: (){},
                                  icon: const Icon(
                                    Icons.arrow_drop_down,
                                  ),
                                ),
                              ],
                            ),
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
                            labelText: 'used time',
                            filledColor: true,
                            fillColor: Colors.grey[200],
                            textInputType: TextInputType.number,
                            suffixIcon: Column(
                              children: [
                                IconButton(
                                  padding: EdgeInsets.zero,
                                  constraints: const BoxConstraints(),
                                  onPressed: (){},
                                  icon: const Icon(
                                    Icons.arrow_drop_up,
                                  ),
                                ),
                                IconButton(
                                  padding: EdgeInsets.zero,
                                  constraints: const BoxConstraints(),
                                  onPressed: (){},
                                  icon: const Icon(
                                    Icons.arrow_drop_down,
                                  ),
                                ),
                              ],
                            ),
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
                            labelText: 'edition',
                            filledColor: true,
                            fillColor: Colors.grey[200],
                            textInputType: TextInputType.number,
                            suffixIcon: Column(
                              children: [
                                IconButton(
                                  padding: EdgeInsets.zero,
                                  constraints: const BoxConstraints(),
                                  onPressed: (){},
                                  icon: const Icon(
                                    Icons.arrow_drop_up,
                                  ),
                                ),
                                IconButton(
                                  padding: EdgeInsets.zero,
                                  constraints: const BoxConstraints(),
                                  onPressed: (){},
                                  icon: const Icon(
                                    Icons.arrow_drop_down,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(
                      height: 16,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        Row(
                          children: [
                            const Text(
                              'Book',
                              style: TextStyle(
                                fontSize: 16,
                              ),
                            ),
                            Transform.scale(
                              scale: 1.4,
                              child: Checkbox(
                                value: true,
                                onChanged: (value){},
                              ),
                            ),
                          ],
                        ),
                        Row(
                          children: [
                            const Text(
                              'Novel',
                              style: TextStyle(
                                fontSize: 16,
                              ),
                            ),
                            Transform.scale(
                              scale: 1.4,
                              child: Checkbox(
                                value: false,
                                onChanged: (value){},
                              ),
                            ),
                          ],
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
                onPressed: () {},
                child: const Text(
                  'Publish',
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
