import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:flutter/material.dart';
import 'dart:io';

void showAwesomeDialog(context,{required String title,required String body,required Function()? okOnPress,DialogType dialogType = DialogType.info,}){
   Color titleColor = Colors.black;
  if(dialogType == DialogType.warning){
    titleColor = Colors.amber;
  } else if(dialogType == DialogType.error){
    titleColor = Colors.red;
  } else if(dialogType == DialogType.success){
    titleColor = Colors.green;
  } else{
    titleColor = Colors.black;
  }
  AwesomeDialog(
    context: context,
    dialogType: dialogType,
    animType: AnimType.rightSlide,
    title: title,
    titleTextStyle: TextStyle(
        color: titleColor,
    ),
    desc: body,
    btnOkOnPress: okOnPress,
  )..show();
}




// Future<bool> showExitPopup(context) async{
//   return await showDialog(
//       context: context,
//       builder: (BuildContext context) {
//         return AlertDialog(
//           content: Container(
//             height: 90,
//             child: Column(
//               crossAxisAlignment: CrossAxisAlignment.start,
//               children: [
//                 Text("Do you want to exit?"),
//                 SizedBox(height: 20),
//                 Row(
//                   children: [
//                     Expanded(
//                       child: ElevatedButton(
//                         onPressed: () {
//                           print('yes selected');
//                           exit(0);
//                         },
//                         child: Text("Yes"),
//                         style: ElevatedButton.styleFrom(
//                             primary: Colors.red.shade800),
//                       ),
//                     ),
//                     SizedBox(width: 15),
//                     Expanded(
//                         child: ElevatedButton(
//                           onPressed: () {
//                             print('no selected');
//                             Navigator.of(context).pop();
//                           },
//                           child: Text("No", style: TextStyle(color: Colors.black)),
//                           style: ElevatedButton.styleFrom(
//                             primary: Colors.white,
//                           ),
//                         ))
//                   ],
//                 )
//               ],
//             ),
//           ),
//         );
//       });
// }