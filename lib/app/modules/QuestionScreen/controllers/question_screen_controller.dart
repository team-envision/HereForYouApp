import 'dart:convert';

import 'package:flutter/services.dart';
import 'package:get/get.dart';

import '../../../models/questions.dart';

class QuestionController extends GetxController {
  RxList<Question> questions = <Question>[].obs; // Store questions
  RxInt currentQuestionIndex = 0.obs; // Track current question
  RxInt selectedOptionIndex = (-1).obs;
  var selectedIndex = (-1).obs;

  // Getter for current question
  Question get currentQuestion => questions[currentQuestionIndex.value];

  @override
  void onInit() {
    super.onInit();
    loadQuestionnaire(); // Load data on controller initialization
  }



  void selectOption(int index) {
    selectedIndex.value = index;
  }

  Future<void> loadQuestionnaire() async {
    String jsonString = await rootBundle.loadString('lib/assets/json/questions.json');
    Map<String, dynamic> jsonData = jsonDecode(jsonString);
    Questionnaire questionnaire = Questionnaire.fromJson(jsonData);
    questions.value = questionnaire.questions; // Populate the questions list
  }

  // Move to next question
  void nextQuestion() {
    if (currentQuestionIndex.value < questions.length - 1) {
      currentQuestionIndex.value++;
      selectedOptionIndex.value = -1; // Reset selected option
    } else {
      Get.snackbar("End", "You have completed the assessment");
    }
  }

  String getOptionIcon(int index) {
    switch (index) {
      case 0:
        return "lib/assets/icons/neverIcon.png";
      case 1:
        return "lib/assets/icons/SometimesIcon.png";
      case 2:
        return "lib/assets/icons/OftenIcon.png";
      case 3:
        return "lib/assets/icons/alwaysIcon.png";
      default:
        return "";
    }
  }
}
