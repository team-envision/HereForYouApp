import 'package:get/get.dart';

class QuestionState {
  String nextId = "";
  List<String> questions = [];
  RxList<String> options = (<String>[]).obs;
  RxInt selected = (-1).obs;
  RxInt questionNo = 0.obs;
}
