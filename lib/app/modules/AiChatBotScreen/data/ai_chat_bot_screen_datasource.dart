import 'package:fpdart/fpdart.dart';
import 'package:here_for_you_app/common/exceptions/custom_exception.dart';
import 'package:here_for_you_app/common/models/message.dart';
import 'package:here_for_you_app/common/utils/api_endpoints.dart';
import 'package:here_for_you_app/core/dio_client.dart';
import 'package:logger/logger.dart';

class AiChatBotScreenDataSource {
  final DioClient dioClient;
  Logger logger = Logger();

  AiChatBotScreenDataSource({required this.dioClient});

  Future<Either<CustomException, MessageModel>> sendMessage(
    String userMessage,
  ) async {
    try {
      final response = await dioClient.post(
        path: APIEndpoints.chat,
        data: {"message": userMessage},
      );
      logger.d("AI response: ${response.data}");
      return Right(MessageModel.fromJson(response.data["response"]));
    } catch (e) {
      logger.e("Error parsing AI response: $e");
      return Left(CustomException(message: e.toString()));
    }
  }

  Future<Either<CustomException, void>> verifyUser() async {
    try {
      final response = await dioClient.post(path: APIEndpoints.verifyUser);
      return const Right(null);
    } catch (e) {
      logger.e("Error parsing AI response: $e");
      return Left(CustomException(message: e.toString()));
    }
  }
}
