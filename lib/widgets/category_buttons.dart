import 'package:flutter/material.dart';
import 'package:graduation_project/constants.dart';

class CategoryButtons extends StatefulWidget {
  const CategoryButtons({super.key});

  @override
  State<CategoryButtons> createState() => _CategoryButtonsState();
}

class _CategoryButtonsState extends State<CategoryButtons> {
  List<bool> isSelected = [
    true,
    false,
    false,
  ];
  @override
  Widget build(BuildContext context) {
    return ToggleButtons(
      borderRadius: BorderRadius.circular(5),
      children: [
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Text(
            'first button',
          ),
        ),
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Text(
            'second button',
          ),
        ),
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Text(
            'third button',
          ),
        ),
      ],
      selectedBorderColor: Colors.white,
      fillColor: kPrimaryColor,
      borderColor: kPrimaryColor,
      selectedColor: Colors.white,
      color: kPrimaryColor,
      isSelected: isSelected,
      onPressed: (index){
        setState(() {
          for(int i = 0; i < isSelected.length; i++){
            if(index == i){
              isSelected[i] = true;
              print('index = $index');
            } else{
              isSelected[i] = false;
            }
          }
        });
      },
    );
  }
}