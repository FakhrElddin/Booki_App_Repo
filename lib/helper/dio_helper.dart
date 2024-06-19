import 'package:dio/dio.dart';
import 'package:graduation_project/helper/end_points.dart';

class DioHelper{

  static late Dio dio;
  static init(){
    dio = Dio(
      BaseOptions(
        baseUrl: baseUrl,
        receiveDataWhenStatusError: true,
        headers: {
          'Content-Type': 'application/json',
        },
      ),
    );
  }

  static Future<Response> getData({
    required String url,
    Map<String, dynamic>? queryParameters,
    String? token,
  }) async{
    return await dio.get(
      url,
      queryParameters: queryParameters,
    );
  }

  static Future<Response> postData({
    required String url,
    Map<String, dynamic>? queryParameters,
    required Map<String, dynamic> data,
    String? token,
}) async{
    dio.options.headers = {
      'Content-Type': 'application/json',
      'Authorization': 'Bearer $token',

    };
    return await dio.post(
      url,
      queryParameters: queryParameters,
      data: data,
    );
  }

  static Future<Response> patchData({
    required String url,
    Map<String, dynamic>? queryParameters,
    required Map<String, dynamic> data,
  }) async{
    return await dio.patch(
      url,
      queryParameters: queryParameters,
      data: data,
    );
  }

  static Future<Response> putDat({
    required String url,
    Map<String, dynamic>? queryParameters,
    required Map<String, dynamic> data,
}) async{
    return await dio.put(
      url,
      queryParameters: queryParameters,
      data: data,
    );
  }

}