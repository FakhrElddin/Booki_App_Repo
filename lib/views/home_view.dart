import 'package:custom_radio_grouped_button/custom_radio_grouped_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:graduation_project/constants.dart';
import 'package:graduation_project/cubits/app_cubit/app_cubit.dart';
import 'package:graduation_project/widgets/book_item.dart';
import 'package:graduation_project/widgets/grid_view_item.dart';

class HomeView extends StatelessWidget {
  const HomeView({super.key});

  final List<String> buttons = const [
    'General',
    'Sports',
    'Business',
    'Science',
    'Fiction',
    'Historical',
  ];

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<AppCubit, AppState>(
      listener: (context, state) {
        // TODO: implement listener
      },
      builder: (context, state) {
        var appCubit = BlocProvider.of<AppCubit>(context);
        return Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16.0),
          child: SingleChildScrollView(
            physics: const BouncingScrollPhysics(),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const SizedBox(
                  height: 15,
                ),
                const Text(
                  'For You',
                ),
                const SizedBox(
                  height: 8,
                ),
                SizedBox(
                  height: 250,
                  child: ListView.separated(
                    scrollDirection: Axis.horizontal,
                    physics: const BouncingScrollPhysics(),
                    itemBuilder: (context, index) => const BookItem(),
                    separatorBuilder: (context, index) =>
                    const SizedBox(width: 24,),
                    itemCount: 10,
                  ),
                ),
                const SizedBox(
                  height: 40,
                ),
                SingleChildScrollView(
                  scrollDirection: Axis.horizontal,
                  physics: const BouncingScrollPhysics(),
                  child: CustomRadioButton(
                    margin: const EdgeInsetsDirectional.only(end: 16),
                    elevation: 0,
                    height: 40,
                    shapeRadius: 5,
                    autoWidth: true,
                    enableShape: true,
                    selectedBorderColor: kPrimaryColor,
                    unSelectedBorderColor: kPrimaryColor,
                    unSelectedColor: Colors.white,
                    buttonLables: buttons,
                    buttonValues: buttons,
                    defaultSelected: buttons[0],
                    buttonTextStyle: const ButtonTextStyle(
                        selectedColor: Colors.white,
                        unSelectedColor: kPrimaryColor,
                        textStyle: TextStyle(fontSize: 16)),
                    radioButtonValue: (value) {
                      print(value);
                    },
                    selectedColor: kPrimaryColor,
                  ),
                ),
                const SizedBox(
                  height: 40,
                ),
                GridView.builder(
                  shrinkWrap: true,
                  physics: const NeverScrollableScrollPhysics(),
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 3,
                    childAspectRatio: .49,
                    crossAxisSpacing: 16,
                    mainAxisSpacing: 16,
                  ),
                  itemBuilder: (context, index) => const GridViewItem(),
                  itemCount: 20,
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}