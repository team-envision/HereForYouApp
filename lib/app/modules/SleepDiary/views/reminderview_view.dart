import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:here_for_you_app/Components/kElevatedButton.dart';
import 'package:here_for_you_app/Components/sleepdiaryreminderWidgets.dart';
import '../controllers/sleep_diary_controller.dart';

class SleepDiaryReminderView extends GetView<SleepDiaryController> {
  const SleepDiaryReminderView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: const Icon(Icons.arrow_back_rounded, size: 32,),
          onPressed: () => Get.back(),
        ),
        title: Center(
          child: GoHomeButton()
        ),
        elevation: 0,
        actions: const [
          SizedBox(width: 48),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              'Let us fill this sleep diary for a week. Choose the Start Date',
              textAlign: TextAlign.center,
              style: TextStyle(
                fontFamily: 'fontmain',
                fontWeight: FontWeight.w800,
                fontSize: 25,
                color: Colors.black,
              ),
            ),
            const SizedBox(height: 32),
            const DateField(),
            const SizedBox(height: 16),
            TimeField(
              label: 'Morning Reminder',
              time: controller.morningReminderTime,
              onTap: controller.selectMorningTime,
            ),
            const SizedBox(height: 16),
            TimeField(
              label: 'Evening Reminder',
              time: controller.eveningReminderTime,
              onTap: controller.selectEveningTime,
            ),
            const Spacer(),
            SizedBox(
              width: double.infinity,
              child: kElevatedButton(text: "Save", onPressed: (){controller.save();})
            ),
          ],
        ),
      ),
    );
  }
}