class FavoritesModel {
  List<FavoritesDataModel> data = [];

  FavoritesModel.fromJson(Map<String, dynamic> json){
    json['data'].forEach((element){
      data.add(FavoritesDataModel.fromJson(element));
    });
  }
}

class FavoritesDataModel {
  final String id;
  final String title;
  final int price;
  final int usedTime;
  final int edition;
  final String state;
  final String coverImage;
  final List<dynamic> images;
  final FavoritesCategoryModel category;
  final FavoritesUserModel user;

  FavoritesDataModel({
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

  factory FavoritesDataModel.fromJson(Map<String, dynamic> json) {
    return FavoritesDataModel(
      id: json['_id'],
      title: json['title'],
      price: json['price'],
      usedTime: json['usedTime'],
      edition: json['edition'],
      state: json['state'],
      coverImage: json['coverImage'],
      images: json['images'],
      category: FavoritesCategoryModel.fromJson(json['category']),
      user: FavoritesUserModel.fromJson(json['user']),
    );
  }
}

class FavoritesCategoryModel {
  final String name;

  FavoritesCategoryModel({
    required this.name,
  });

  factory FavoritesCategoryModel.fromJson(Map<String, dynamic> json) {
    return FavoritesCategoryModel(
      name: json['name'],
    );
  }
}

class FavoritesUserModel {
  final String id;
  final String name;

  FavoritesUserModel({
    required this.id,
    required this.name,
  });

  factory FavoritesUserModel.fromJson(Map<String, dynamic> json) {
    return FavoritesUserModel(
      id: json['_id'],
      name: json['name'],
    );
  }
}
