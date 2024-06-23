class SearchModel {
  List<SearchDataModel> data = [];
  SearchModel.fromJson(Map<String, dynamic> json){
    json['data'].forEach((element){
      data.add(SearchDataModel.fromJson(element));
    });
  }
}

class SearchDataModel {
  final String id;
  final String title;
  final int price;
  final int usedTime;
  final int edition;
  final String state;
  final String coverImage;
  final List<dynamic> images;
  final SearchCategoryModel category;
  final SearchUserModel user;

  SearchDataModel({
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

  factory SearchDataModel.fromJson(Map<String, dynamic> json) {
    return SearchDataModel(
        id: json['_id'],
        title: json['title'],
        price: json['price'],
        usedTime: json['usedTime'],
        edition: json['edition'],
        state: json['state'],
        coverImage: json['coverImage'],
        images: json['images'],
        category: SearchCategoryModel.fromJson(json['category']),
        user: SearchUserModel.fromJson(json['user']),
    );
  }
}

class SearchCategoryModel {
  final String name;

  SearchCategoryModel({
    required this.name,
  });

  factory SearchCategoryModel.fromJson(Map<String, dynamic> json) {
    return SearchCategoryModel(
      name: json['name'],
    );
  }
}

class SearchUserModel {
  final int ratingsAverage;
  final String id;
  final String name;
  final String city;

  SearchUserModel({
    required this.ratingsAverage,
    required this.id,
    required this.name,
    required this.city,
  });

  factory SearchUserModel.fromJson(Map<String, dynamic> json) {
    return SearchUserModel(
      ratingsAverage: json['ratingsAverage'],
      id: json['_id'],
      name: json['name'],
      city: json['city'],
    );
  }
}
