class CategoryBookModel {
  List<CategoryBookDataModel> data = [];
  CategoryBookModel.fromJson(Map<String, dynamic> json){
    json['data'].forEach((element){
      data.add(CategoryBookDataModel.fromJson(element));
    });
  }
}

class CategoryBookDataModel {
  final String id;
  final String title;
  final int price;
  final int usedTime;
  final int edition;
  final String state;
  final String coverImage;
  final List<dynamic> images;
  final CategoryBookCategoryModel category;
  final CategoryBookUserModel user;

  CategoryBookDataModel({
    required this.id,
    required this.title,
    required this.price,
    required this.usedTime,
    required this.edition,
    required this.state,
    required this.coverImage,
    required this.images,
    required this.category,
    required this.user,
  });

  factory CategoryBookDataModel.fromJson(Map<String, dynamic> json) {
    return CategoryBookDataModel(
      id: json['_id'],
      title: json['title'],
      price: json['price'],
      usedTime: json['usedTime'],
      edition: json['edition'],
      state: json['state'],
      coverImage: json['coverImage'],
      images: json['images'],
      category: CategoryBookCategoryModel.fromJson(json['category']),
      user: CategoryBookUserModel.fromJson(json['user']),
    );
  }
}

class CategoryBookCategoryModel {
  final String name;

  CategoryBookCategoryModel({
    required this.name,
  });

  factory CategoryBookCategoryModel.fromJson(Map<String, dynamic> json) {
    return CategoryBookCategoryModel(
      name: json['name'],
    );
  }
}

class CategoryBookUserModel {
  final int ratingsAverage;
  final String id;
  final String name;
  final String city;

  CategoryBookUserModel({
    required this.ratingsAverage,
    required this.id,
    required this.name,
    required this.city,
  });

  factory CategoryBookUserModel.fromJson(Map<String, dynamic> json) {
    return CategoryBookUserModel(
      ratingsAverage: json['ratingsAverage'],
      id: json['_id'],
      name: json['name'],
      city: json['city'],
    );
  }
}