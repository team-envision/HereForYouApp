import 'package:get/get.dart';
import 'package:here_for_you_app/common/models/option.dart';

class QuestionState {
  String nextId = "";
  List<String> questions = [];
  RxList<OptionModel> options = (<OptionModel>[]).obs;
  RxInt selected = (-1).obs;
  RxInt questionNo = 0.obs;
  RxBool isLoading = false.obs;
  String? key;
}
