import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:here_for_you_app/Components/kBottomBar.dart';
import 'package:here_for_you_app/Components/kElevatedButton.dart';
import '../controllers/sleep_diary_controller.dart';

class SleepDiaryEveningView extends GetView<SleepDiaryController> {
  const SleepDiaryEveningView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        leading: IconButton(
          icon: const Icon(
            Icons.arrow_back_rounded,
            size: 32,
            color: Colors.black,
          ),
          onPressed: () => Get.back(),
        ),
        title: Center(child: const Text('Enter Diary', style: TextStyle(fontFamily: 'fontmain', fontWeight: FontWeight.bold),)),
        actions: [
          IconButton(
            icon: const Icon(
              Icons.home_filled,
              color: Colors.black,
              size: 32,
            ),
            onPressed: () {
              Get.offAll(() => bottomNavigation());
            },
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text(
                'Good Evening.',
                style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold, fontFamily: 'fontmain'),
              ),
              const SizedBox(height: 8),
              const Text(
                "Let's track your today's activities",
                style: TextStyle(fontSize: 16, fontFamily: 'fontmain'),
              ),
              const SizedBox(height: 24),
              const Text(
                'Any Naps during the day?',
                style: TextStyle(fontSize: 14, fontWeight: FontWeight.bold, fontFamily: 'fontmain'),
              ),
              const SizedBox(height: 8),
              Row(
                children: [
                  Obx(
                        () => _buildYesNoButton(
                      text: 'Yes',
                      isSelected: controller.isNapSelected.value,
                      onTap: () => controller.toggleNap(true),
                    ),
                  ),
                  const SizedBox(width: 16),
                  Obx(
                        () => _buildYesNoButton(
                      text: 'No',
                      isSelected: !controller.isNapSelected.value,
                      onTap: () => controller.toggleNap(false),
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 24),
              const Text(
                'Any Exercise during the day?',
                style: TextStyle(fontSize: 14, fontWeight: FontWeight.bold, fontFamily: 'fontmain'),
              ),
              const SizedBox(height: 8),
              Row(
                children: [
                  Obx(
                        () => _buildYesNoButton(
                      text: 'Yes',
                      isSelected: controller.isExerciseSelected.value,
                      onTap: () => controller.toggleExercise(true),
                    ),
                  ),
                  const SizedBox(width: 16),
                  Obx(
                        () => _buildYesNoButton(
                      text: 'No',
                      isSelected: !controller.isExerciseSelected.value,
                      onTap: () => controller.toggleExercise(false),
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 24),
              const Text(
                'Drinks Consumed Today?',
                style: TextStyle(fontSize: 14, fontWeight: FontWeight.bold, fontFamily: 'fontmain'),
              ),
              const SizedBox(height: 8),
              TextField(
                keyboardType: TextInputType.number,
                decoration: InputDecoration(
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(8),
                  ),
                  hintText: 'Enter number of drinks',
                ),
                onChanged: controller.updateDrinksConsumed,
              ),
              const SizedBox(height: 24),
              const Text(
                'Alcoholic Drinks today?',
                style: TextStyle(fontSize: 14, fontWeight: FontWeight.bold, fontFamily: 'fontmain'),
              ),
              const SizedBox(height: 8),
              TextField(
                keyboardType: TextInputType.number,
                decoration: InputDecoration(
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(8),
                  ),
                  hintText: 'Enter number of alcoholic drinks',
                ),
                onChanged: controller.updateAlcoholicDrinks,
              ),
              const SizedBox(height: 24),
              const Text(
                'Last Alcoholic Drink Time?',
                style: TextStyle(fontSize: 14, fontWeight: FontWeight.bold, fontFamily: 'fontmain'),
              ),
              const SizedBox(height: 8),
              Obx(
                    () => GestureDetector(
                  onTap: () => controller.selectLastDrinkTime(context),
                  child: Container(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 16, vertical: 12),
                    decoration: BoxDecoration(
                      border: Border.all(color: Colors.grey),
                      borderRadius: BorderRadius.circular(8),
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          controller.lastDrinkTime.value.isEmpty
                              ? 'Select time'
                              : controller.lastDrinkTime.value,
                          style: TextStyle(
                            color: controller.lastDrinkTime.value.isEmpty
                                ? Colors.grey
                                : Colors.black,
                          ),
                        ),
                        const Icon(Icons.access_time),
                      ],
                    ),
                  ),
                ),
              ),
              const SizedBox(height: 32),
              SizedBox(
                width: double.infinity,
                child: kElevatedButton(
                  text: "Save",
                  onPressed: () {
                    controller.saveEveningDiaryEntry();
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildYesNoButton({
    required String text,
    required bool isSelected,
    required VoidCallback onTap,
  }) {
    return Expanded(
      child: GestureDetector(
        onTap: onTap,
        child: Container(
          padding: const EdgeInsets.symmetric(vertical: 12),
          decoration: BoxDecoration(
            color: isSelected ? Colors.green.withOpacity(0.2) : Colors.transparent,
            border: Border.all(color: Colors.grey),
            borderRadius: BorderRadius.circular(8),
          ),
          child: Center(
            child: Text(
              text,
              style: const TextStyle(fontSize: 16),
            ),
          ),
        ),
      ),
    );
  }
}