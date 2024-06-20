
import 'package:dio/dio.dart';
import '../constants.dart';
import '../models/user_model.dart';

class UserService {
  final Dio dio;

  UserService(this.dio);

  Future<UserModel> getUserInfo() async {
    try {
      dio.options.headers={"Authorization":"Bearer $token"};
      final response =
      await dio.get('http://10.0.2.2:4000/api/v1/user/getMyInfo');
      final jsonData = response.data['data'];
      print(jsonData);
      return UserModel.fromJson(jsonData);
    } on DioException catch(e){
      print(e.response.toString());
      throw Exception('Failed to load user info 1');
    }catch (e) {
      throw Exception('Failed to load user info');
    }
  }
}
