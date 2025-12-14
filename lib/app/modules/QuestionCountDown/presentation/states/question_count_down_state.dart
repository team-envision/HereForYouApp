import 'package:get/get.dart';

class QuestionCountDownState extends GetXState {
  Rx<String> progressLabel = "".obs;
  Rx<String> description = "".obs;
  Rx<String> note = "".obs;
  String questionnaire = "";
  List<String> options = [];
  List<String> questions = [];
  String nextId = "";
  RxBool isLoading = true.obs;
}
