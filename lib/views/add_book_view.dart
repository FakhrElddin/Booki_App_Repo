import 'package:flutter/material.dart';
import 'package:graduation_project/constants.dart';
import 'package:graduation_project/widgets/add_book_photo_item.dart';
import 'package:graduation_project/widgets/custom_text_form_field.dart';

class AddBookView extends StatefulWidget {
  const AddBookView({super.key});

  @override
  State<AddBookView> createState() => _AddBookViewState();
}

class _AddBookViewState extends State<AddBookView> {
  String? categoryValue;
  String? stateValue;
  bool? checkBoxValue = false;
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
                            labelText: 'Price',
                            filledColor: true,
                            fillColor: Colors.grey[200],
                            textInputType: TextInputType.number,
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
                            filledColor: true,
                            fillColor: Colors.grey[200],
                            textInputType: TextInputType.number,
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
                            filledColor: true,
                            fillColor: Colors.grey[200],
                            textInputType: TextInputType.number,
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(
                      height: 16,
                    ),
                    Container(
                      decoration: BoxDecoration(
                        border: Border.all(),
                        borderRadius: BorderRadius.circular(10),
                        color: Colors.grey[200],
                      ),
                      child: DropdownButton(
                        borderRadius: BorderRadius.circular(10),
                        value: categoryValue,
                        isExpanded: true,
                        padding: const EdgeInsets.symmetric(horizontal: 12),
                        icon: const Icon(
                            Icons.arrow_drop_down,
                        ),
                        hint: const Text('Category'),

                        items: const [
                          DropdownMenuItem(
                            value: 'general',
                            child: Text('General',),
                          ),
                          DropdownMenuItem(
                            value: 'sports',
                            child: Text('Sports',),
                          ),
                          DropdownMenuItem(
                            value: 'history',
                            child: Text('History',),
                          ),
                        ],
                        onChanged: (value){
                          setState(() {
                            categoryValue = value;
                          });
                        },
                      ),
                    ),
                    const SizedBox(
                      height: 16,
                    ),
                    Row(
                      children: [
                        Expanded(
                          child: Row(
                            children: [
                              Transform.scale(
                                scale: 1.4,
                                child: Checkbox(
                                    value: checkBoxValue,
                                  onChanged: (value){
                                      setState(() {
                                        checkBoxValue = value;
                                      });
                                  },
                                ),
                              ),
                              const Text(
                                'Negotiable',
                                style: TextStyle(
                                  fontSize: 20,
                                ),
                              ),
                            ],
                          ),
                        ),
                        Expanded(
                          child: Container(
                            decoration: BoxDecoration(
                              border: Border.all(),
                              borderRadius: BorderRadius.circular(10),
                              color: Colors.grey[200],
                            ),
                            child: DropdownButton(
                              borderRadius: BorderRadius.circular(10),
                              value: stateValue,
                              padding: const EdgeInsets.symmetric(horizontal: 12),
                              icon: const Icon(
                                Icons.arrow_drop_down,
                              ),
                              hint: const Text('State'),
                              isExpanded: true,
                              items: const [
                                DropdownMenuItem(
                                  value: 'bad',
                                  child: Text('Bad',),
                                ),
                                DropdownMenuItem(
                                  value: 'accepted',
                                  child: Text('Accepted',),
                                ),
                                DropdownMenuItem(
                                  value: 'good',
                                  child: Text('Good',),
                                ),
                                DropdownMenuItem(
                                  value: 'excellent',
                                  child: Text('Excellent',),
                                ),
                              ],
                              onChanged: (value){
                                setState(() {
                                  stateValue = value;
                                });
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
