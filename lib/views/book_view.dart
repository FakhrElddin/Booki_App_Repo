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
                height: 275,
                width: 185,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  image: DecorationImage(
                    fit: BoxFit.fill,
                    image:AssetImage('assets/images/ibn.jpg',
                    ),
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
            SizedBox(
              height: 30,
            ),
            Padding(
              padding: const EdgeInsets.only(left: 25),
              child: Row(
                mainAxisSize: MainAxisSize.max,
                children: [
                  Icon(Icons.circle,
                  size: 7,
                  ),
                  SizedBox(
                    width: 10,
                  ),
                  Text("Edition : 1999",
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.w500,
                  ),
                  ),
                ],
              ),
            ),
            SizedBox(
              height: 15,
            ),
            Padding(
              padding: const EdgeInsets.only(left: 25),
              child: Row(
                mainAxisSize: MainAxisSize.max,
                children: [
                  Icon(Icons.circle,
                    size: 7,
                  ),
                  SizedBox(
                    width: 10,
                  ),
                  Text("Category : Religious",
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(
              height: 15,
            ),
            Padding(
              padding: const EdgeInsets.only(left: 25),
              child: Row(
                mainAxisSize: MainAxisSize.max,
                children: [
                  Icon(Icons.circle,
                    size: 7,
                  ),
                  SizedBox(
                    width: 10,
                  ),
                  Text("Time used : 2 years",
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(
              height: 15,
            ),
            Padding(
              padding: const EdgeInsets.only(left: 25),
              child: Row(
                mainAxisSize: MainAxisSize.max,
                children: [
                  Icon(Icons.circle,
                    size: 7,
                  ),
                  SizedBox(
                    width: 10,
                  ),
                  Text("Price : 20 L.E",
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(
              height: 15,
            ),
            Padding(
              padding: const EdgeInsets.only(left: 25),
              child: Row(
                mainAxisSize: MainAxisSize.max,
                children: [
                  Icon(Icons.circle,
                    size: 7,
                  ),
                  SizedBox(
                    width: 10,
                  ),
                  Text("Book status : Good",
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(
              height: 15,
            ),
            Divider(
              height: 10,
              thickness: 2.35,
              color: Colors.grey,
              indent: 50,
              endIndent: 50,
            ),
            SizedBox(height: 15),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                ElevatedButton(
                  style:ElevatedButton.styleFrom(
                    textStyle: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.w500,
                    ) ,
                    backgroundColor: Color(0xff0766AD),
                    fixedSize: Size(220, 60),
                  ),
                  onPressed: (){}, child: Text('Order',
                  ),
                  ),

                ElevatedButton(
                  style:ElevatedButton.styleFrom(
                    textStyle: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.w500,
                    ) ,
                    backgroundColor: Color(0xffE2E7F0),
                      fixedSize: Size(140, 60),
                    foregroundColor: Colors.black,
                  ),
                  onPressed: (){}, child: Text('Exchange',
                ),
                ),
              ],
            ),
          ],
        ),
    );
  }
}
