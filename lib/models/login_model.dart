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
  final String name;
  final String email;
  final bool active;

  LoginUserData({
    required this.name,
    required this.email,
    required this.active,
  });

  factory LoginUserData.fromJson(Map<String, dynamic> json){
    return LoginUserData(
      name: json['name'],
      email: json['email'],
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