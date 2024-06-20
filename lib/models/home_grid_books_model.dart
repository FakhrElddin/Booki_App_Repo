class HomeGridBooksModel{
  late PaginationResultModel paginationResult;
  List<HomeGridBooksDataModel> data = [];

  
  HomeGridBooksModel.fromJson(Map<String, dynamic> json){
    paginationResult = PaginationResultModel.fromJson(json['paginationResult']);
    json['data'].forEach((element){
      data.add(HomeGridBooksDataModel.fromJson(element));
    });
  }


}

class PaginationResultModel{
  final int currentPage;
  final int limit;
  final int numberOfPages;

  PaginationResultModel({
    required this.currentPage,
    required this.limit,
    required this.numberOfPages,
  });

  factory PaginationResultModel.fromJson(Map<String, dynamic> json){
    return PaginationResultModel(
        currentPage: json['currentPage'],
        limit: json['limit'],
        numberOfPages: json['numberOfPages'],
    );
  }
}

class HomeGridBooksDataModel{
  final String id;
  final String title;
  final int price;
  final String coverImage;
  final List<dynamic> images;
  final UserModel user;

  HomeGridBooksDataModel({
    required this.id,
    required this.title,
    required this.price,
    required this.coverImage,
    required this.images,
    required this.user
  });

  factory HomeGridBooksDataModel.fromJson(Map<String, dynamic> json){
    return HomeGridBooksDataModel(
      id: json['_id'],
      title: json['title'],
      price: json['price'],
      coverImage: json['coverImage'],
      images: json['images'],
      user: UserModel.fromJson(json['user']),
    );
  }
}

class UserModel{
  final String name;

  UserModel({
    required this.name,
  });

  factory UserModel.fromJson(Map<String, dynamic> json){
    return UserModel(
      name: json['name'],
    );
  }
}