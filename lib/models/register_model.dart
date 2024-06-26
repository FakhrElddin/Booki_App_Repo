class RegisterModel{
  final RegisterDataModel data;
  final String token;

  RegisterModel({
    required this.data,
    required this.token,
  });

  factory RegisterModel.fromJson(Map<String, dynamic> json){
    return RegisterModel(
      data: RegisterDataModel.formJson(json['data']),
      token: json['token'],
    );
  }

}


class RegisterDataModel{
  final String id;
  final String name;
  final String email;
  final String city;
  final bool active;

  RegisterDataModel({
    required this.id,
    required this.name,
    required this.email,
    required this.city,
    required this.active,
});

  factory RegisterDataModel.formJson(Map<String, dynamic> json){
    return RegisterDataModel(
      id: json['_id'],
      name: json['name'],
      email: json['email'],
      city: json['city'],
      active: json['active'],
    );
  }
}

class RegisterErrorModel{
  List<ErrorsModel>? errors = [];

  RegisterErrorModel.fromJson(Map<String, dynamic> json){
    if(json['errors'] != null ){
      json['errors'].forEach((element){
        errors!.add(ErrorsModel.fromJson(element));
      });
    }
  }


  // final String message;
  //
  // RegisterErrorModel({required this.message});
  //
  // factory RegisterErrorModel.formJson(Map<String, dynamic> json){
  //   return RegisterErrorModel(message: json['message']);
  // }

}

class ErrorsModel{
  final String message;

  ErrorsModel({required this.message});

  factory ErrorsModel.fromJson(Map<String, dynamic> json){
    return ErrorsModel(
      message: json['msg'],
    );
  }
}