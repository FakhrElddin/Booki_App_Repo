import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
class BookView extends StatelessWidget {
  const BookView({super.key});

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text('Book page',
        style: TextStyle(
          fontSize: 20,
          fontWeight: FontWeight.bold,
        ),
        ),
        leading: Icon(Icons.arrow_back_ios_new_sharp,
        ),
        actions: [
        Padding(
          padding: const EdgeInsets.only(right: 20),
          child: Icon(Icons.favorite_border_outlined),
        ),
        ],
      ),
      body:
         Column(
           mainAxisSize: MainAxisSize.max,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            SizedBox(
              height: 20,
            ),
            Center(
              child: Container(
                height: 300,
                width: 180,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(30),
                  image: DecorationImage(
                    image:AssetImage('assets/images/ibn.jpg'),
                  ),
                ),
                ),
              ),
            SizedBox(
              height: 30,
            ),
            Text('Book name',
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),
          ],
        ),
    );
  }
}
