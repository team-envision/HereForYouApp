import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:here_for_you_app/Components/kElevatedButton.dart';

import '../controllers/sleep_diary_controller.dart';

class SleepDiaryMorningView extends GetView<SleepDiaryController> {
  const SleepDiaryMorningView({Key? key}) : super(key: key);

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
        title: const Center(
          child: Text(
            'Enter Diary',
            style: TextStyle(
              fontFamily: 'fontmain',
              fontWeight: FontWeight.w800,
            ),
          ),
        ),
        actions: [
          IconButton(
            icon: const Icon(
              Icons.home_filled,
              size: 32,
              color: Colors.black,
            ),
            onPressed: () {},
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text(
                'Good Morning.',
                style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                  fontFamily: 'fontmain',
                ),
              ),
              const SizedBox(height: 8),
              const Text(
                "Let's capture how your sleep was last night.",
                style: TextStyle(
                  fontSize: 16,
                  fontFamily: 'fontmain',
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 24),
              const Text(
                'Time I slept last night',
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontFamily: 'fontmain',
                ),
              ),
              const SizedBox(height: 8),
              Obx(() => _buildTimePickerField(
                hint: controller.sleepTime.value.isNotEmpty
                    ? controller.sleepTime.value
                    : '6:46 AM',
                onTap: () => controller.selectSleepTime(context),
              )),
              const SizedBox(height: 16),
              const Text(
                'Time I woke up today',
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontFamily: 'fontmain',
                ),
              ),
              const SizedBox(height: 8),
              Obx(() => _buildTimePickerField(
                hint: controller.wakeUpTime.value.isNotEmpty
                    ? controller.wakeUpTime.value
                    : '8:00 PM',
                onTap: () => controller.selectWakeUpTime(context),
              )),
              const SizedBox(height: 16),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    'Times I woke up today',
                    style: TextStyle(
                      fontSize: 15,
                      fontFamily: 'fontmain',
                      fontWeight: FontWeight.bold,
                      color: Colors.black,
                    ),
                  ),
                  const SizedBox(height: 8),
                  Obx(() => TextField(
                    controller: TextEditingController(
                      text: controller.timesWokeUpToday.value.toString(),
                    ),
                    keyboardType: TextInputType.number,
                    inputFormatters: [
                      FilteringTextInputFormatter.digitsOnly
                    ],
                    decoration: InputDecoration(
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(8),
                        borderSide: const BorderSide(color: Colors.grey),
                      ),
                      contentPadding: const EdgeInsets.symmetric(
                          horizontal: 16, vertical: 12),
                    ),
                    onChanged: (value) {
                      final intValue = int.tryParse(value) ?? 0;
                      controller.timesWokeUpToday.value = intValue;
                    },
                  )),
                ],
              ),
              const SizedBox(height: 16),
              const Text(
                'Time to fall asleep',
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontFamily: 'fontmain',
                ),
              ),
              const SizedBox(height: 8),
              Row(
                children: [
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Obx(() => _buildTimePickerField(
                          hint: controller.fallAsleepHours.value.isNotEmpty
                              ? '${controller.fallAsleepHours.value} Hr${controller.fallAsleepHours.value == "1" ? "" : "s"}'
                              : 'Hrs',
                          onTap: () =>
                              controller.selectFallAsleepHours(context),
                        )),
                        const SizedBox(height: 8),
                      ],
                    ),
                  ),
                  const SizedBox(width: 16),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Obx(() => _buildTimePickerField(
                          hint: controller.fallAsleepMinutes.value.isNotEmpty
                              ? '${controller.fallAsleepMinutes.value} Min'
                              : 'Min',
                          onTap: () =>
                              controller.selectFallAsleepMinutes(context),
                        )),
                        const SizedBox(height: 8),
                      ],
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 16), // Added padding to ensure scrolling space
              Center(
                child: kElevatedButton(
                  text: "Save",
                  onPressed: () {
                    controller.saveDiaryEntry();
                  },
                ),
              ),
              const SizedBox(height: 16), // Extra space at the bottom for scrolling
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildTimePickerField({required String hint, required VoidCallback onTap}) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
        decoration: BoxDecoration(
          border: Border.all(color: Colors.grey),
          borderRadius: BorderRadius.circular(8),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              hint,
              style: const TextStyle(color: Colors.black54),
            ),
            const Icon(
              Icons.access_time,
              color: Colors.grey,
            ),
          ],
        ),
      ),
    );
  }
}