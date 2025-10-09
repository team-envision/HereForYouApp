import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:here_for_you_app/Components/kBottomBar.dart';
import 'package:here_for_you_app/app/modules/SleepDiary/views/sleep_score_view.dart';
import 'package:here_for_you_app/resources/app_resources/app_colors.dart';
import 'enter_diary_view.dart';

class SleepDiaryHomeView extends StatelessWidget {
  const SleepDiaryHomeView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.white,
      appBar: AppBar(
        backgroundColor: AppColors.white,
        title: const Text("Sleep Diary"),
        titleTextStyle: Get.theme.textTheme.titleLarge?.copyWith(
          fontWeight: FontWeight.bold,
        ),
        leading: IconButton(
          onPressed: () => Navigator.pop(context),
          icon: const Icon(
            Icons.arrow_back_rounded,
            size: 36,
            color: AppColors.black,
          ),
        ),
        leadingWidth: 90,
        centerTitle: true,
        actions: [
          IconButton(
            onPressed: () {
              Get.offAll(() => bottomNavigation()); 
            },
            icon: const Icon(
              Icons.home,
              size: 28,
              color: AppColors.black,
            ),
          ),
        ],
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          const SizedBox(height: 40),
          _buildSleepResultContainer("Sleep Results", const Icon(Icons.receipt),
            onTap: () {
              Get.to(() => const SleepScoreView());
            },),
          const SizedBox(height: 20),
          _buildSleepResultContainer(
            "Enter Your Diary",
            const Icon(Icons.inventory_rounded),
            onTap: () {
              Get.to(() => EnterDiaryView()); 
            },
          ),
        ],
      ),
    );
  }

  Widget _buildSleepResultContainer(String text, Icon icon, {VoidCallback? onTap}) {
    return GestureDetector(
      onTap: onTap, 
      child: Container(
        height: 150,
        margin: const EdgeInsets.all(15),
        decoration: BoxDecoration(
          color: AppColors.white,
          borderRadius: BorderRadius.circular(22),
          border: Border.all(
            color: AppColors.grey,
            width: 2,
          ),
        ),
        child: Padding(
          padding: const EdgeInsets.all(15.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                text,
                style: Get.textTheme.labelLarge?.copyWith(
                  fontWeight: FontWeight.w700,
                  fontSize: 23,
                ),
              ),
              Align(
                alignment: Alignment.bottomRight,
                child: icon,
              ),
            ],
          ),
        ),
      ),
    );
  }
}