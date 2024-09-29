import 'dart:convert';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:here_for_you_app/app/modules/QuestionScreen/views/SDRS_question_screen_view.dart';
import 'package:here_for_you_app/app/modules/mentalScore/views/mental_score_view.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../../../models/questions.dart';
import '../../QuestionCountDown/views/question_count_down_view.dart';

class DASS21QuestionController extends GetxController {
  RxList<String> DASS21questions = <String>[].obs;
  RxList<String> DASS21options = <String>[].obs;
  RxInt currentQuestionIndex = 0.obs;
  RxInt selectedOptionIndex = (-1).obs;
  var selectedIndex = (-1).obs;

  RxMap<int,int> anxietyIndex = <int,int>{1:0, 3:0, 6:0, 8:0, 14:0, 17:0, 18:0}.obs;
  RxMap<int,int> stressIndex = <int,int>{0:0, 5:0, 7:0, 10:0, 11:0, 13:0, 17:0}.obs;
  RxMap<int,int> depressionIndex = <int,int>{2:0, 4:0, 9:0, 12:0, 15:0, 16:0, 19:0}.obs;

  String get currentQuestion => DASS21questions[currentQuestionIndex.value];
  List<String> get currentOptions => DASS21options;

  RxInt total_s=(0).obs;
  RxInt total_a=(0).obs;
  RxInt total_d=(0).obs;
  RxString result_s=''.obs;
  RxString result_a=''.obs;
  RxString result_d=''.obs;


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
        DASS21questions.value = questionnaire.dass21.questions;
        DASS21options.value = questionnaire.dass21.options;
      } else {
        print("Error: Loaded JSON data is null.");
      }
    } else {
      print("Error: JSON file is empty or not loaded.");
    }
  }


  Future<void> nextQuestion() async {
   if(selectedIndex.value!=-1){
     if (currentQuestionIndex.value < DASS21questions.length - 1) {
       if(anxietyIndex.containsKey(currentQuestionIndex.value)){
         anxietyIndex[currentQuestionIndex.value]=selectedIndex.value;
       }
       else if(stressIndex.containsKey(currentQuestionIndex.value)){
         stressIndex[currentQuestionIndex.value]=selectedIndex.value;
       }

       else if(depressionIndex.containsKey(currentQuestionIndex.value)){
         depressionIndex[currentQuestionIndex.value]=selectedIndex.value;
       }
       currentQuestionIndex.value++;
       selectedOptionIndex.value = -1;
     } else {
       getResult();
       await SaveToPreference(result_s.value);
       handleNavigation();
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

    total_s.value=stressIndex.values.reduce((sum, element) => sum + element);
    total_a.value=anxietyIndex.values.reduce((sum, element) => sum + element);
    total_d.value=depressionIndex.values.reduce((sum, element) => sum + element);

    total_s.value=total_s.value*2;
    total_a.value=total_a.value*2;
    total_d.value=total_d.value*2;


    if (total_s.value >= 0 && total_s.value <= 14) {
      result_s.value = "Normal";
    } else if (total_s.value >= 15 && total_s.value <= 18) {
      result_s.value = "Mild";
    }
    else if (total_s.value >= 19 && total_s.value <= 25) {
      result_s.value = "Moderate";
    }
    else if (total_s.value >= 26 && total_s.value <= 33) {
      result_s.value = "Severe";
    }
    else {
      result_s.value = "Extremely Severe";
    }

    if (total_a.value >= 0 && total_a.value <= 7) {
      result_a.value = "Normal";
    }
    else if (total_a.value >= 8 && total_a.value <= 9) {
      result_a.value = "Mild";
    }
    else if (total_a.value >= 10 && total_a.value <= 14) {
      result_a.value = "Moderate";
    }
    else if (total_a.value >= 15 && total_a.value <= 19) {
      result_a.value = "Severe";
    }
    else {
      result_a.value = "Extremely Severe";
    }

    if (total_d.value >= 0 && total_d.value <= 9) {
      result_d.value = "Normal";
    } else if (total_d.value >= 10 && total_d.value <= 13) {
      result_d.value = "Mild";
    }
    else if (total_d.value >= 14 && total_d.value <= 20) {
      result_d.value = "Moderate";
    }
    else if (total_d.value >= 21 && total_d.value <= 27) {
      result_d.value = "Severe";
    }
    else {
      result_d.value = "Extremely Severe";
    }
  }


  Future<void> SaveToPreference(String StressResult) async {
    SharedPreferences prefs;

    prefs = await SharedPreferences.getInstance();
    prefs.setString('StressResult', StressResult);
  }



  void handleNavigation()  {

    bool requiresPHQ9 = result_d.value == "Moderate" || result_d.value == "Severe" || result_d.value == "Extremely Severe";
    bool requiresGAD7 = result_a.value == "Moderate" || result_a.value == "Severe" || result_a.value == "Extremely Severe";

    if (requiresPHQ9 && requiresGAD7) {
      Get.to(() => QuestionCountdownView(), arguments: {'next': 'GAD7','nextToNext': 'PHQ9','TotalPage':4});

    } else if (requiresPHQ9) {
      Get.to(() => QuestionCountdownView(), arguments: {'next': 'PHQ9','nextToNext': 'BACE','TotalPage':3});
    } else if (requiresGAD7) {
      Get.to(() => QuestionCountdownView(), arguments: {'next': 'GAD7','nextToNext': 'BACE','TotalPage':3});
    } else {
      Get.to(() => QuestionCountdownView(),arguments: {'next': 'BACE','nextToNext': 'SDRS','TotalPage':2});
    }
  }


}
