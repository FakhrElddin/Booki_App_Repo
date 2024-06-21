import 'package:flutter/material.dart';
import 'package:graduation_project/widgets/book_attributes.dart';
class BookDetails extends StatelessWidget {
   const BookDetails({super.key,required this.editionDetails, required this.categoryDetails, required this.timeUsedDetails, required this.priceDetails, required this.statusDetails,});

   final String editionDetails;
   final String categoryDetails;
   final String timeUsedDetails;
   final String priceDetails;
   final String statusDetails;

   @override
   Widget build(BuildContext context) {
     return Padding(
       padding: const EdgeInsets.only(left: 25),
       child: Column(
         children: [
           BookAttribute(attribute: 'Edition', description: editionDetails),
           BookAttribute(attribute: 'Category', description: categoryDetails),
           BookAttribute(attribute: 'Time Used', description: timeUsedDetails),
           BookAttribute(attribute: 'Price', description: priceDetails),
           BookAttribute(attribute: 'Status', description: statusDetails),
         ],
       ),
     );
   }



}
