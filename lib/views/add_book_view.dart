import 'package:flutter/material.dart';
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
          ),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
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
                  child: Column(
                    children: [
                      Stack(
                        alignment: AlignmentDirectional.center,
                        children: [
                          Container(
                            height: 200,
                            decoration: BoxDecoration(
                              color: Colors.grey[400],
                              borderRadius: BorderRadius.circular(10),
                            ),
                          ),
                          Icon(
                            Icons.add,
                            size: 32,
                          ),
                        ],
                      ),
                      SizedBox(
                        height: 8,
                      ),
                      Text(
                        'cover',
                      ),
                    ],
                  ),
                ),
                const SizedBox(
                  width: 12,
                ),
                Expanded(
                  child: Column(
                    children: [
                      Stack(
                        alignment: AlignmentDirectional.center,
                        children: [
                          Container(
                            height: 200,
                            decoration: BoxDecoration(
                              color: Colors.grey[400],
                              borderRadius: BorderRadius.circular(10),
                            ),
                          ),
                          const Icon(
                            Icons.add,
                            size: 32,
                          ),
                        ],
                      ),
                      const SizedBox(
                        height: 8,
                      ),
                      Text(
                        'stub',
                      ),
                    ],
                  ),
                ),
                const SizedBox(
                  width: 12,
                ),
                Expanded(
                  child: Column(
                    children: [
                      Stack(
                        alignment: AlignmentDirectional.center,
                        children: [
                          Container(
                            height: 200,
                            decoration: BoxDecoration(
                              color: Colors.grey[400],
                              borderRadius: BorderRadius.circular(10),
                            ),
                          ),
                          Icon(
                            Icons.add,
                            size: 32,
                          ),
                        ],
                      ),
                      SizedBox(
                        height: 8,
                      ),
                      Text(
                        'printing',
                      ),
                    ],
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
            ),
            Row(
              children: [

              ],
            ),
          ],
        ),
      ),
    );
  }
}
