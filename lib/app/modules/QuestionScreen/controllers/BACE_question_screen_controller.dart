import 'dart:convert';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:here_for_you_app/app/modules/QuestionCountDown/views/question_count_down_view.dart';
import 'package:here_for_you_app/app/modules/QuestionScreen/views/SDRS_question_screen_view.dart';
import 'package:here_for_you_app/app/modules/mentalScore/views/mental_score_view.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../../../models/questions.dart';
import '../views/BACE_question_screen_view.dart';

class BACEQuestionController extends GetxController {
  RxList<String> BACEquestions = <String>[].obs;
  RxList<String> BACEoptions = <String>[].obs;
  RxInt currentQuestionIndex = 0.obs;
  RxInt selectedOptionIndex = (-1).obs;
  var selectedIndex = (-1).obs;

  RxMap<int,int> BACEIndex = <int,int>{}.obs;
  String get currentQuestion => BACEquestions[currentQuestionIndex.value];
  List<String> get currentOptions => BACEoptions;

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
        BACEquestions.value = questionnaire.bace.questions;
        BACEoptions.value = questionnaire.bace.options;
      } else {
        print("Error: Loaded JSON data is null.");
      }
    } else {
      print("Error: JSON file is empty or not loaded.");
    }
  }

  Future<void> SaveToPreference(String  result) async {
    SharedPreferences prefs;

    prefs = await SharedPreferences.getInstance();
    prefs.setString('BACE_result', result);
  }

  void nextQuestion() {
   if(selectedIndex.value!=-1){
     if (currentQuestionIndex.value < BACEquestions.length - 1) {
        BACEIndex[currentQuestionIndex.value]=selectedIndex.value;
       currentQuestionIndex.value++;
       selectedOptionIndex.value = -1;
     } else {
       getResult();
       SaveToPreference(result.value);
       finishBACE();

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

   getResult(){
     totalScore.value=BACEIndex.values.reduce((sum, element) => sum + element);

     if (totalScore.value >= 50) {
      result.value= "You are facing significant barriers to accessing care. Consider anonymous helplines or telepsychiatry services.";
     } else if (totalScore.value >= 30) {
       result.value="You may be facing some barriers to accessing care. It's important to explore online resources or community support services.";
     } else if (totalScore.value >= 10) {
       result.value= "You have few barriers to accessing care, but some challenges may exist. Look for easily accessible services like online consultations.";
     } else {
       result.value=  "You have minimal barriers to accessing care. Please reach out to mental health services confidently.";
     }

  }
  void finishBACE() {
    String next = Get.arguments['nextToNext'] ?? '';

      Get.to(() => QuestionCountdownView(), arguments: {'next': next,'TotalPage':1});

  }





}
