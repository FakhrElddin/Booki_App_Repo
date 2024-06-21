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
  final int usedTime;
  final int edition;
  final String state;
  final String coverImage;
  final List<dynamic> images;
  final HomeGridBooksUserModel user;
  final HomeGridBooksCategoryModel category;

  HomeGridBooksDataModel({
    required this.id,
    required this.title,
    required this.price,
    required this.usedTime,
    required this.edition,
    required this.state,
    required this.coverImage,
    required this.images,
    required this.user,
    required this.category,
  });

  factory HomeGridBooksDataModel.fromJson(Map<String, dynamic> json){
    return HomeGridBooksDataModel(
      id: json['_id'],
      title: json['title'],
      price: json['price'],
      usedTime: json['usedTime'],
      edition: json['edition'],
      state: json['state'],
      coverImage: json['coverImage'],
      images: json['images'],
      user: HomeGridBooksUserModel.fromJson(json['user']),
      category: HomeGridBooksCategoryModel.fromJson(json['category'])
    );
  }
}

class HomeGridBooksUserModel{
  final String id;
  final String name;

  HomeGridBooksUserModel({
    required this.id,
    required this.name,
  });

  factory HomeGridBooksUserModel.fromJson(Map<String, dynamic> json){
    return HomeGridBooksUserModel(
      name: json['name'],
      id: json['_id'],
    );
  }
}

class HomeGridBooksCategoryModel{
  final String name;

  HomeGridBooksCategoryModel({
    required this.name,
  });

  factory HomeGridBooksCategoryModel.fromJson(Map<String, dynamic> json){
    return HomeGridBooksCategoryModel(
      name: json['name'],
    );
  }
}