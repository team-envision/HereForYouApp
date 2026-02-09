import 'package:dio/dio.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:here_for_you_app/common/firebase/firebase_auth.dart';
import 'package:here_for_you_app/core/dio_interceptors.dart';

class DioClient {
  static final DioClient instance = DioClient._internal();
  late final Dio dio;

  factory DioClient() {
    return instance;
  }

  DioClient._internal() {
    BaseOptions baseOptions = BaseOptions(
      baseUrl: dotenv.env["BASE_URL"] ?? "",
      headers: {
        "Content-Type": "application/json",
        "Accept": "application/json",
      },
    );
    dio = Dio(baseOptions);
    dio.interceptors.add(
      DioInterceptors(firebaseAuthService: FirebaseAuthService()),
    );
  }

  Future<Response> get({
    required String path,
    Map<String, dynamic>? queryParameters,
    Options? options,
  }) async {
    return await dio.get(
      path,
      queryParameters: queryParameters,
      options: options,
    );
  }

  Future<Response> post({
    required String path,
    Object? data,
    Options? options,
  }) async {
    return await dio.post(path, data: data, options: options);
  }

  Future<Response> put(String path, {Object? data, Options? options}) async {
    return await dio.put(path, data: data, options: options);
  }

  Future<Response> delete(String path, {Object? data, Options? options}) async {
    return await dio.delete(path, data: data, options: options);
  }
}
