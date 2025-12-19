import 'package:get/get.dart';
import 'package:here_for_you_app/common/models/option.dart';

class QuestionCountDownState extends GetXState {
  Rx<String> progressLabel = "".obs;
  Rx<String> description = "".obs;
  Rx<String> note = "".obs;
  String questionnaire = "";
  List<OptionModel> options = [];
  List<String> questions = [];
  String nextId = "";
  RxBool isLoading = true.obs;
  String? key;
}
