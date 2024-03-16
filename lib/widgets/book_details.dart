import 'package:flutter/material.dart';
import 'package:graduation_project/widgets/book_attributes.dart';
class BookDetails extends StatelessWidget {
   const BookDetails({super.key,required this.editiondetails, required this.categorydetails, required this.timeUseddetails, required this.pricedetails, required this.statusdetails,});

   final String editiondetails;
   final String categorydetails;
   final String timeUseddetails;
   final String pricedetails;
   final String statusdetails;


   @override
  Widget build(BuildContext context) {
    return  Padding(
      padding: const EdgeInsets.only(left: 25),
      child: Column(
        children: [
          BookAttribute(attribute: 'Edition', description: editiondetails),
          BookAttribute(attribute: 'Category', description: categorydetails),
          BookAttribute(attribute: 'TimeUsed', description: timeUseddetails),
          BookAttribute(attribute: 'Price', description: pricedetails),
          BookAttribute(attribute: 'Status', description: statusdetails),
        ],
      ),
    );
  }
}
