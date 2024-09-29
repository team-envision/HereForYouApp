import 'dart:convert';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:here_for_you_app/app/modules/mentalScore/views/mental_score_view.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../../../models/questions.dart';
import '../../QuestionCountDown/views/question_count_down_view.dart';

class PHQ9QuestionController extends GetxController {
  RxList<String> PHQ9questions = <String>[].obs;
  RxList<String> PHQ9options = <String>[].obs;
  RxInt currentQuestionIndex = 0.obs;
  RxInt selectedOptionIndex = (-1).obs;
  var selectedIndex = (-1).obs;

  RxMap<int,int> PHQ9Index = <int,int>{}.obs;
  String get currentQuestion => PHQ9questions[currentQuestionIndex.value];
  List<String> get currentOptions => PHQ9options;

  RxInt totalScore=(0).obs;
  RxString result="".obs;



  @override
  void onInit() {
    super.onInit();
    loadQuestionnaire();
  }

  void selectOption(int index) {
    selectedIndex.value = index;
  }

  Future<void> loadQuestionnaire() async {
    String jsonString = await rootBundle.loadString('lib/assets/json/questions.json');
    if (jsonString.isNotEmpty) {
      Map<String, dynamic>? jsonData = jsonDecode(jsonString);
      if (jsonData != null) {
        QuestionnaireModel questionnaire = QuestionnaireModel.fromJson(jsonData);
        PHQ9questions.value = questionnaire.phq9.questions;
        PHQ9options.value = questionnaire.phq9.options;
      } else {
        print("Error: Loaded JSON data is null.");
      }
    } else {
      print("Error: JSON file is empty or not loaded.");
    }
  }


  void nextQuestion() {
   if(selectedIndex.value!=-1){
     if (currentQuestionIndex.value < PHQ9questions.length - 1) {
        PHQ9Index[currentQuestionIndex.value]=selectedIndex.value;
       currentQuestionIndex.value++;
       selectedOptionIndex.value = -1;
     } else {
       getResult();
       if(result.value=="Moderate"||result.value=="Moderately severe"||result.value=="Severe"){
       SaveToPreference(result.value);
       }

       finishPHQ9();

     }
   }
   else{
     Get.snackbar("Error", "Select an Option");
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



  Future<void> SaveToPreference(String  result) async {
    SharedPreferences prefs;

    prefs = await SharedPreferences.getInstance();
    prefs.setString('DepressionResult', result);
  }



   getResult(){
     totalScore.value=PHQ9Index.values.reduce((sum, element) => sum + element);

    if (totalScore.value >= 0 && totalScore.value <= 4)
      result.value = "Minimal";
    else if (totalScore.value >= 5 && totalScore.value <= 9)
      result.value = "Mild";
    else if (totalScore.value >= 10 && totalScore.value <= 14)
      result.value = "Moderate";
    else if (totalScore.value >= 15 && totalScore.value <= 19)
      result.value = "Moderately severe";
    else if (totalScore.value >= 20 && totalScore.value <= 27)
      result.value = "Severe";

  }



  void finishPHQ9() {
    String next = Get.arguments['next'] ?? '';

    if(next=='BACE')
      Get.to(() => QuestionCountdownView(), arguments: {'next': next,"nextToNext" : 'SDRS','TotalPage':2});





  }




}
