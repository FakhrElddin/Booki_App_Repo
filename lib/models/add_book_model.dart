import 'dart:io';

import 'package:dio/dio.dart';

class AddBookModel {
  final String title;
  final String price;
  final String usedTime;
  final String edition;
  final String category;
  final String state;
  final File coverImage;
  final List<File> images;

  AddBookModel({
    required this.title,
    required this.price,
    required this.usedTime,
    required this.edition,
    required this.category,
    required this.state,
    required this.coverImage,
    required this.images,
  });

  Future<FormData> toMap() async {
    return FormData.fromMap({
      'title': title,
      'price': price,
      'usedTime': usedTime,
      'edition': edition,
      'category': category,
      'state': state,
      'coverImage': await MultipartFile.fromFile(coverImage.path),
      'images': images.map((e) async {
        return await MultipartFile.fromFile(e.path);
      }).toList(),
    });
  }
}
