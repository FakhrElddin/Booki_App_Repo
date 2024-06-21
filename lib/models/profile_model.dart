
class ProfileModel{
  final ProfileDataModel data;

  ProfileModel({
    required this.data,
  });

  factory ProfileModel.formJson(Map<String, dynamic> json){
    return ProfileModel(
        data: ProfileDataModel.fromJson(json['data']),
    );
  }
}

class ProfileDataModel {
  final String id;
  final String name;
  final String email;
  final String? cardId;
  final String? profileImage;
  final dynamic ratingsAverage;
  final String? city;

  ProfileDataModel({
    required this.id,
    required this.name,
    required this.email,
    required this.cardId,
    required this.profileImage,
    required this.ratingsAverage,
    required this.city,
  });

  factory ProfileDataModel.fromJson(Map<String, dynamic> json) {
    return ProfileDataModel(
      id: json['_id'],
      name: json['name'],
      email: json['email'],
      cardId: json['cardId'],
      profileImage: json['profileImage'],
      ratingsAverage: json['ratingsAverage'],
      city: json['city'],
    );
  }
}
