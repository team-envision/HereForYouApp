import 'dart:convert';

import 'package:fpdart/fpdart.dart';
import 'package:here_for_you_app/common/exceptions/custom_exception.dart';
import 'package:shared_preferences/shared_preferences.dart';

class LocalStorage {
  Future<Either<CustomException, String>> addResults(
    Map<String, String> results,
    String? key,
  ) async {
    final String storeKey = key ?? 'results_${DateTime.now()}';
    try {
      final prevResults = await getMap(key: storeKey);
      prevResults.addAll(results);
      await saveMap(key: storeKey, map: prevResults);
      return Right(storeKey);
    } catch (e) {
      return Left(CustomException(message: e.toString()));
    }
  }

  Future<Map<String, String>> getMap({required String key}) async {
    final prefs = await SharedPreferences.getInstance();
    String? jsonString = prefs.getString(key);
    if (jsonString == null) {
      return {};
    } else {
      final Map<String, dynamic> decodedMap = jsonDecode(jsonString);
      return decodedMap.map((key, value) => MapEntry(key, value.toString()));
    }
  }

  Future<void> saveMap({
    required String key,
    required Map<String, String> map,
  }) async {
    final prefs = await SharedPreferences.getInstance();
    final jsonString = jsonEncode(map);
    prefs.setString(key, jsonString);
  }
}
