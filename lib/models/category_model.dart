class CategoryModel{
  List<CategoryDataModel> data = [];

  CategoryModel.fromJson(Map<String, dynamic> json){
    json['data'].forEach((element){
      data.add(CategoryDataModel.fromJson(element));
    });
  }

}

class CategoryDataModel{
  final String name;
  final String image;

  CategoryDataModel({
    required this.name,
    required this.image,
  });

  factory CategoryDataModel.fromJson(Map<String, dynamic> json){
    return CategoryDataModel(
      image: json['image'],
      name: json['name'],
    );
  }

}