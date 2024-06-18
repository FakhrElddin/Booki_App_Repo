// models/user_model.dart

class UserModel {
  final String name;
  final String email;
  final String? cardId;
  final String? profileImage;
  final int? ratingsAverage;

  UserModel({
    required this.name,
    required this.email,
    this.cardId,
    this.profileImage,
    this.ratingsAverage,
  });

  factory UserModel.fromJson(Map<String, dynamic> json) {
    return UserModel(
      name: json['name'],
      email: json['email'],
      cardId: json['cardId'],
      profileImage: json['profileImage'],
      ratingsAverage: json['ratingsAverage'],
    );
  }
}
