import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:get/get.dart';
import 'package:here_for_you_app/app/modules/QuestionScreen/controllers/question_screen_controller.dart';
import 'package:here_for_you_app/resources/app_resources/app_colors.dart';

class QuestionScreenView extends GetView<QuestionScreenController>
{
  const QuestionScreenView({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.white,

    );
  }

}