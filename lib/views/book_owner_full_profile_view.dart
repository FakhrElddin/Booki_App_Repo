import 'package:flutter/material.dart';

class BookOwnerFullProfileView extends StatelessWidget {
  const BookOwnerFullProfileView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
          appBar: AppBar(
            centerTitle: true,
            title: const Text(
              'Full Profile',
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),
            leading: IconButton(
              onPressed: () {
                Navigator.pop(context);
              },
              icon: const Icon(
                Icons.arrow_back_ios_new_sharp,
                color: Colors.black,
              ),
            ),
            actions: [
              IconButton(
                onPressed: () {},
                padding: const EdgeInsetsDirectional.only(end: 8),
                icon: const Icon(
                  Icons.info_outline_rounded,
                  size: 28,
                  color: Colors.black,
                ),
              ),
            ],
          ),
      body:  SingleChildScrollView(
        child: Padding(
          padding:  const EdgeInsets.symmetric(horizontal: 30),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(
                height:
                40,
              ),
              const Text('Full Name',
              style: TextStyle(
                fontSize: 20,
                color: Colors.grey,
              ),
              ),
              const SizedBox(
                height:
                10,
              ),
              Container(
                height: 60,
                width: double.maxFinite,
                decoration: BoxDecoration(
                  border: Border.all(
                    color: Colors.grey,
                  ),
                  shape: BoxShape.rectangle,
                  borderRadius: BorderRadius.circular(6)
                ),
                child: const Padding(
                  padding: EdgeInsets.all(16),
                  child: Text("Mo'men Ali Ibrahim",
                    style: TextStyle(
                      fontSize: 20,
                    fontWeight: FontWeight.w500,
                    ),
                  ),
                ),
              ),
              const SizedBox(
                height:
                20,
              ),
              const Text('Contact number',
                style: TextStyle(
                  fontSize: 20,
                  color: Colors.grey,
                ),
              ),
              const SizedBox(
                height:
                10,
              ),
              Container(
                height: 60,
                width: double.maxFinite,
                decoration: BoxDecoration(
                    border: Border.all(
                      color: Colors.grey,
                    ),
                    shape: BoxShape.rectangle,
                    borderRadius: BorderRadius.circular(6)
                ),
                child: const Padding(
                  padding: EdgeInsets.all(16),
                  child: Text("(+20)1027928685",
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ),
              ),
              const SizedBox(
                height:
                20,
              ),
              const Text('ID number',
                style: TextStyle(
                  fontSize: 20,
                  color: Colors.grey,
                ),
              ),
              const SizedBox(
                height:
                10,
              ),
              Container(
                height: 60,
                width: double.maxFinite,
                decoration: BoxDecoration(
                    border: Border.all(
                      color: Colors.grey,
                    ),
                    shape: BoxShape.rectangle,
                    borderRadius: BorderRadius.circular(6)
                ),
                child: const Padding(
                  padding: EdgeInsets.all(16),
                  child: Text("30212212358798",
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ),
              ),
              const SizedBox(
                height:
                20,
              ),
              const Text("City/region",
                style: TextStyle(
                  fontSize: 20,
                  color: Colors.grey,
                ),
              ),
              const SizedBox(
                height:
                10,
              ),
              Container(
                height: 60,
                width: double.maxFinite,
                decoration: BoxDecoration(
                    border: Border.all(
                      color: Colors.grey,
                    ),
                    shape: BoxShape.rectangle,
                    borderRadius: BorderRadius.circular(6)
                ),
                child: const Padding(
                  padding: EdgeInsets.all(16),
                  child: Text("Cairo",
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ),
              ),
              const SizedBox(
                height:
                20,
              ),
              const Text('Address',
                style: TextStyle(
                  fontSize: 20,
                  color: Colors.grey,
                ),
              ),
              const SizedBox(
                height:
                10,
              ),
              Container(
                height: 100,
                width: double.maxFinite,
                decoration: BoxDecoration(
                    border: Border.all(
                      color: Colors.grey,
                    ),
                    shape: BoxShape.rectangle,
                    borderRadius: BorderRadius.circular(6)
                ),
                child: const Padding(
                  padding: EdgeInsets.all(16),
                  child: Text("Robert Robertson, 1234 NW Bobcat Lane, St. Robert, MO 65584-5678",
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.w500,
                    ),
                    maxLines: 2,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
