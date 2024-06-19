class LoginModel{
  final LoginUserData data;
  final String token;

  LoginModel({
    required this.data,
    required this.token,
});

  factory LoginModel.fromJson(Map<String, dynamic> json){
    return LoginModel(
      data: LoginUserData.fromJson(json['data']),
      token: json['token'],
    );
  }
}

class LoginUserData{
  final String id;
  final String name;
  final String email;
  final String city;
  final bool active;

  LoginUserData({
    required this.id,
    required this.name,
    required this.email,
    required this.city,
    required this.active,
  });

  factory LoginUserData.fromJson(Map<String, dynamic> json){
    return LoginUserData(
      id: json['_id'],
      name: json['name'],
      email: json['email'],
      city: json['city'],
      active: json['active'],
    );
  }
}


class LoginErrorModel{
  final String? errorMessage;

  LoginErrorModel({required this.errorMessage});

  factory LoginErrorModel.fromJson(Map<String, dynamic> json){
    return LoginErrorModel(errorMessage: json['message']);
  }
}