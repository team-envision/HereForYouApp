import 'package:dio/dio.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:here_for_you_app/common/firebase/firebase_auth.dart';
import 'package:logger/logger.dart';

class DioInterceptors extends Interceptor {
  Logger logger = Logger();
  final FirebaseAuthService firebaseAuthService;

  DioInterceptors({required this.firebaseAuthService});

  @override
  Future<void> onRequest(
    RequestOptions options,
    RequestInterceptorHandler handler,
  ) async {
    User? user = await firebaseAuthService.getUser();
    if (user == null) {
      handler.reject(
        DioException(
          requestOptions: options,
          error: "User is not logged in",
          type: DioExceptionType.cancel,
        ),
      );
      return;
    }

    if (options.data == null) {
      options.data = {"user_id": user.uid};
    } else if (options.data is Map) {
      final Map<String, dynamic> newData = Map<String, dynamic>.from(
        options.data,
      );
      newData["user_id"] = user.uid;
      options.data = newData;
    }

    handler.next(options);
  }

  @override
  void onError(DioException err, ErrorInterceptorHandler handler) {
    logger.e(err);
    handler.next(err);
  }

  @override
  void onResponse(Response response, ResponseInterceptorHandler handler) {
    logger.d(response);
    handler.next(response);
  }
}
