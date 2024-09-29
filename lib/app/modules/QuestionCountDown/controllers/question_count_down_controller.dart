import 'package:get/get.dart';
import 'package:here_for_you_app/app/modules/QuestionScreen/views/BACE_question_screen_view.dart';
import 'package:here_for_you_app/app/modules/QuestionScreen/views/GAD7_question_screen_view.dart';
import 'package:here_for_you_app/app/modules/QuestionScreen/views/PHQ9_question_screen_view.dart';
import 'package:here_for_you_app/app/modules/QuestionScreen/views/SDRS_question_screen_view.dart';
import 'package:shared_preferences/shared_preferences.dart';

class QuestionCountDownController extends GetxController {
  //TODO: Implement QuestionCountDownController

   RxInt TotalPage=(0).obs;
  RxInt CurrentPage=(1).obs;




  void handleNavigation(){
    String next = Get.arguments['next'] ?? '';
    String nextToNext = Get.arguments['nextToNext'] ?? '';
    TotalPage.value=Get.arguments["TotalPage"];
    print("Get.arguments");
    print(TotalPage.value);
    print(CurrentPage.value);
    TotalPage.value=TotalPage.value-1;
    if(CurrentPage.value<=TotalPage.value){
      print("up");
      CurrentPage.value=TotalPage.value+1;
    }else{
      print("down");
      CurrentPage.value=TotalPage.value;
    }
    print(TotalPage.value);
    print(CurrentPage.value);


    if (next == 'GAD7' && nextToNext == 'PHQ9') {
      Get.to(() => GAD7QuestionView(), arguments: {'next': nextToNext,'TotalPage':3});
    }

    else if (next == 'PHQ9'&& nextToNext == 'BACE') {
      Get.to(() => PHQ9QuestionView(), arguments: {'next': nextToNext,'TotalPage':2});
    }
    else if (next == 'GAD7'&& nextToNext == 'BACE') {
      Get.to(() => GAD7QuestionView(), arguments: {'next': nextToNext,'TotalPage':2});
    }

    else if (next == 'BACE'&& nextToNext == 'SDRS') {
      Get.to(() => BACEQuestionView(), arguments: {'next': nextToNext,'TotalPage':1});
    }
    else{
      Get.to(() => SDRSQuestionView());
    }

  }



  @override
  void onInit() {
    super.onInit();
    TotalPage.value=Get.arguments["TotalPage"];
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {
    super.onClose();
  }

}
