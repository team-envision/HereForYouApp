import 'dart:convert';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:here_for_you_app/app/modules/mentalScore/views/mental_score_view.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../../../models/questions.dart';
import '../views/BACE_question_screen_view.dart';

class SDRSQuestionController extends GetxController {
  RxList<String> SDRSquestions = <String>[].obs;
  RxList<String> SDRSoptions = <String>[].obs;
  RxInt currentQuestionIndex = 0.obs;
  RxInt selectedOptionIndex = (-1).obs;
  var selectedIndex = (-1).obs;

  RxMap<int,int> SDRSIndex = <int,int>{}.obs;
  String get currentQuestion => SDRSquestions[currentQuestionIndex.value];
  List<String> get currentOptions => SDRSoptions;

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
        SDRSquestions.value = questionnaire.sdrs.questions;
        SDRSoptions.value = questionnaire.sdrs.options;
      } else {
        print("Error: Loaded JSON data is null.");
      }
    } else {
      print("Error: JSON file is empty or not loaded.");
    }
  }


  void nextQuestion() {
   if(selectedOptionIndex.value!=-1){
     if (currentQuestionIndex.value < SDRSquestions.length - 1) {
        SDRSIndex[currentQuestionIndex.value]=selectedOptionIndex.value+1;
       currentQuestionIndex.value++;
       selectedOptionIndex.value = -1;
     } else {
       getResult();
       SaveToPreference(result.value);
       finishSDRS();

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
    prefs.setString('SDRS_result', result);
  }



   getResult(){
     totalScore.value=SDRSIndex.values.reduce((sum, element) => sum + element);

     if (totalScore.value >= 20) {
       result.value= "High willingness to disclose personal information.";
     } else if (totalScore.value >= 15 && totalScore.value < 20) {
       result.value="Moderate willingness to disclose personal information.";
     } else if (totalScore.value >= 10 && totalScore.value < 15) {
       result.value="Low willingness to disclose personal information.";
     } else if (totalScore.value >= 5 && totalScore.value < 10) {
       result.value="Very low willingness to disclose personal information.";
     } else {
       result.value= "Invalid score.";
     }

  }
  void finishSDRS() {

      Get.offAll(() => MentalScoreView(),);

  }





}
