// models/user_model.dart

class UserModel {
  final String name;
  final String email;
  final String? cardId;
  final String? profileImage;
  final dynamic ratingsAverage;
  final String? city;

  UserModel({
    required this.name,
    required this.email,
    this.cardId,
    this.profileImage,
    this.ratingsAverage,
    this.city,
  });

  factory UserModel.fromJson(Map<String, dynamic> json) {
    return UserModel(
      name: json['name'],
      email: json['email'],
      cardId: json['cardId'],
      profileImage: json['profileImage'],
      ratingsAverage: json['ratingsAverage'],
      city: json['city'],
    );
  }
}
