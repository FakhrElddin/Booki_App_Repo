class UserBooksModel{
  List<UserBooksDataModel> data = [];

  UserBooksModel.fromJson(Map<String, dynamic> json){
    json['data'].forEach((element){
      data.add(UserBooksDataModel.fromJson(element));
    });
  }
}

class UserBooksDataModel{
  final String id;
  final String title;
  final int price;
  final String coverImage;
  final List<dynamic> images;
  final UserBooksCategoryModel category;

  UserBooksDataModel({
    required this.id,
    required this.title,
    required this.price,
    required this.coverImage,
    required this.images,
    required this.category,
  });

  factory UserBooksDataModel.fromJson(Map<String,dynamic> json){
    return UserBooksDataModel(
      id: json['_id'],
      title: json['title'],
      price: json['price'],
      coverImage: json['coverImage'],
      images: json['images'],
      category: UserBooksCategoryModel.fromJson(json['category']),
    );
  }

}

class UserBooksCategoryModel{
  final String name;

  UserBooksCategoryModel({
    required this.name,
  });

  factory UserBooksCategoryModel.fromJson(Map<String, dynamic> json){
    return UserBooksCategoryModel(
      name: json['name'],
    );
  }

}