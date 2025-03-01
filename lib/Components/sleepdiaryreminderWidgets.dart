import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../app/modules/SleepDiary/controllers/sleep_diary_controller.dart';
import 'kBottomBar.dart';

class GoHomeButton extends StatelessWidget {
  const GoHomeButton({super.key});

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: () {
        Get.offAll(() => bottomNavigation());
      },
      style: ElevatedButton.styleFrom(
        foregroundColor: Colors.black,
        padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 8),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(20),
          side: const BorderSide(
            color: Colors.black,
            width: 2,
          ),
        ),
      ),
      child: const Text(
        'Go Home',
        style: TextStyle(fontSize: 15, fontFamily: 'fontmain'),
      ),
    );
  }
}


class DateField extends GetView<SleepDiaryController> {
  const DateField({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text(
          'Start Date',
          style: TextStyle(
            fontSize: 15,
            fontFamily: 'fontmain',
            fontWeight: FontWeight.bold,
            color: Colors.black,
          ),
        ),
        const SizedBox(height: 8),
        Obx(() => GestureDetector(
          onTap: () => controller.selectDate(context),
          child: Container(
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
            decoration: BoxDecoration(
              border: Border.all(color: Colors.grey),
              borderRadius: BorderRadius.circular(8),
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(controller.formattedDate),
                const Icon(Icons.calendar_today),
              ],
            ),
          ),
        )),
      ],
    );
  }
}


class TimeField extends GetView<SleepDiaryController> {
  final String label;
  final Rx<TimeOfDay> time;
  final Future<void> Function(BuildContext) onTap;

  const TimeField({
    super.key,
    required this.label,
    required this.time,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          label,
          style: const TextStyle(
            fontSize: 15,
            fontFamily: 'fontmain',
            fontWeight: FontWeight.bold,
            color: Colors.black,
          ),
        ),
        const SizedBox(height: 8),
        Obx(() => GestureDetector(
          onTap: () => onTap(context),
          child: Container(
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
            decoration: BoxDecoration(
              border: Border.all(color: Colors.grey),
              borderRadius: BorderRadius.circular(8),
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(controller.formatTimeOfDay(time.value)),
                const Icon(Icons.access_time),
              ],
            ),
          ),
        )),
      ],
    );
  }
}