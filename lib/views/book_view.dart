import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:graduation_project/views/confirm_exchange.dart';
import 'package:graduation_project/views/confirm_order.dart';
import 'package:graduation_project/widgets/book_details.dart';

import 'book_owner_profile.dart';
class BookView extends StatelessWidget {
  const BookView({super.key});

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text('Book page',
        style: TextStyle(
          fontSize: 20,
          fontWeight: FontWeight.bold,
        ),
        ),
        leading: const Icon(Icons.arrow_back_ios_new_sharp,
        ),
        actions: const [
        Padding(
          padding: EdgeInsets.only(right: 20),
          child: Icon(Icons.favorite_border_outlined),
        ),
        ],
      ),
      body:
         SingleChildScrollView(
           child: Column(
             children: [
               Column(
                 children: [
                   const SizedBox(
                     height: 20,
                   ),
                   Center(
                     child: Container(
                       height: 275,
                       width: 185,
                       decoration: BoxDecoration(
                         borderRadius: BorderRadius.circular(10),
                         image: const DecorationImage(
                           fit: BoxFit.fill,
                           image:AssetImage('assets/images/ibn.jpg',
                           ),
                         ),
                       ),
                     ),
                   ),
                   const SizedBox(
                     height: 30,
                   ),
                   const Text('Book name',
                     style: TextStyle(
                       fontSize: 20,
                       fontWeight: FontWeight.bold,
                     ),
                   ),
                   const SizedBox(
                     height: 30,
                   ),
                   BookDetails(attribute: 'Edition', description: '1999'),
                   BookDetails(attribute: 'Category', description: 'Religious'),
                   BookDetails(attribute: 'Time used', description: '1999'),
                   BookDetails(attribute: 'Price', description: '200 L.E'),
                   BookDetails(attribute: 'Status', description: 'Good'),
                   SizedBox(
                     height: 20,
                   ),
                   const Divider(
                     height: 10,
                     thickness: 2.35,
                     color: Colors.grey,
                     indent: 50,
                     endIndent: 50,
                   ),
                   const SizedBox(
                     height: 10,
                   ),
                   Padding(
                     padding: const EdgeInsets.symmetric(horizontal: 20),
                     child: GestureDetector(
                       onTap: (){
                         Navigator.push(context, MaterialPageRoute(builder: (context){
                           return const BookOwnerProfile();
                         }));
                       },
                       child: Row(
                         mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                         children: [
                           CircleAvatar(
                             radius: 30,
                             backgroundImage:
                              AssetImage('assets/images/profile.jpg',
                             ),
                           ),
                           SizedBox(width: 30),
                           Text('Book owner name',
                             style: const TextStyle(
                               fontSize: 20,
                               fontWeight: FontWeight.w500,
                             ),
                           ),
                         ],
                       ),
                     ),
                   ),
                 ],
               ),
               SizedBox(height: 15),
               Row(
                 mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                 children: [
                   ElevatedButton(
                     style:ElevatedButton.styleFrom(
                       textStyle: const TextStyle(
                         fontSize: 20,
                         fontWeight: FontWeight.w500,
                       ) ,
                       backgroundColor: const Color(0xff0766AD),
                       fixedSize: const Size(220, 60),
                     ),
                     onPressed: (){
                       Navigator.push(context, MaterialPageRoute(builder: (context){
                         return const ConfirmOrder();
                       }));
                     }, child: const Text('Order',
                   ),
                   ),

                   ElevatedButton(
                     style:ElevatedButton.styleFrom(
                       textStyle: const TextStyle(
                         fontSize: 20,
                         fontWeight: FontWeight.w500,
                       ) ,
                       backgroundColor: const Color(0xffE2E7F0),
                       fixedSize: const Size(140, 60),
                       foregroundColor: Colors.black,
                     ),
                     onPressed: (){
                       Navigator.push(context, MaterialPageRoute(builder: (context){
                        return const ConfirmExchange();
                       }
                       ));
                     }, child: const Text('Exchange',
                   ),
                   ),
                 ],
               ),
             ],
           ),
         ),
    );
  }
}
