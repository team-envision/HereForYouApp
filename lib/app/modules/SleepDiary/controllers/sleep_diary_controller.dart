import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:here_for_you_app/Components/kBottomBar.dart';
import 'package:intl/intl.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SleepDiaryController extends GetxController {
  var selectedDate = DateTime.now().obs;
  var morningReminderTime = const TimeOfDay(hour: 6, minute: 45).obs;
  var eveningReminderTime = const TimeOfDay(hour: 20, minute: 0).obs;
  var sleepTime = ''.obs;
  var wakeUpTime = ''.obs;
  var timesWokeUpToday = 0.obs;
  var fallAsleepHours = ''.obs;
  var fallAsleepMinutes = ''.obs;

  static const String _hasSetReminderKey = 'has_set_reminder';

  Future<bool> hasSetReminder() async {
    final prefs = await SharedPreferences.getInstance();
    return prefs.getBool(_hasSetReminderKey) ?? false;
  }

  Future<void> setReminderFlag(bool value) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setBool(_hasSetReminderKey, value);
  }

  String get formattedDate => DateFormat('d of MMMM, yyyy').format(selectedDate.value);

  String formatTimeOfDay(TimeOfDay time) {
    final now = DateTime.now();
    final dt = DateTime(now.year, now.month, now.day, time.hour, time.minute);
    return DateFormat.jm().format(dt);
  }

  Future<void> selectDate(BuildContext context) async {
    final DateTime? picked = await showDatePicker(
      context: context,
      initialDate: selectedDate.value,
      firstDate: DateTime(2000),
      lastDate: DateTime(2101),
    );
    if (picked != null && picked != selectedDate.value) {
      selectedDate.value = picked;
    }
  }

  Future<void> selectMorningTime(BuildContext context) async {
    final TimeOfDay? picked = await showTimePicker(
      context: context,
      initialTime: morningReminderTime.value,
    );
    if (picked != null && picked != morningReminderTime.value) {
      morningReminderTime.value = picked;
    }
  }

  Future<void> selectEveningTime(BuildContext context) async {
    final TimeOfDay? picked = await showTimePicker(
      context: context,
      initialTime: eveningReminderTime.value,
    );
    if (picked != null && picked != eveningReminderTime.value) {
      eveningReminderTime.value = picked;
    }
  }

  Future<void> selectSleepTime(BuildContext context) async {
    TimeOfDay? picked = await showTimePicker(
      context: context,
      initialTime: TimeOfDay.now(),
    );
    if (picked != null) {
      sleepTime.value = picked.format(context);
    }
  }

  Future<void> selectWakeUpTime(BuildContext context) async {
    TimeOfDay? picked = await showTimePicker(
      context: context,
      initialTime: TimeOfDay.now(),
    );
    if (picked != null) {
      wakeUpTime.value = picked.format(context);
    }
  }

  Future<void> selectFallAsleepHours(BuildContext context) async {
    TimeOfDay? picked = await showTimePicker(
      context: context,
      initialTime: const TimeOfDay(hour: 0, minute: 0),
      builder: (BuildContext context, Widget? child) {
        return MediaQuery(
          data: MediaQuery.of(context).copyWith(alwaysUse24HourFormat: true),
          child: child!,
        );
      },
    );
    if (picked != null) {
      fallAsleepHours.value = picked.hour.toString();
    }
  }

  Future<void> selectFallAsleepMinutes(BuildContext context) async {
    TimeOfDay? picked = await showTimePicker(
      context: context,
      initialTime: const TimeOfDay(hour: 0, minute: 0),
      builder: (BuildContext context, Widget? child) {
        return MediaQuery(
          data: MediaQuery.of(context).copyWith(alwaysUse24HourFormat: true),
          child: child!,
        );
      },
    );
    if (picked != null) {
      fallAsleepMinutes.value = picked.minute.toString();
    }
  }

  void save() {
    Get.snackbar('Success', 'Sleep diary settings saved!');
  }

  void saveDiaryEntry() {
    if (sleepTime.value.isEmpty || wakeUpTime.value.isEmpty) {
      Get.snackbar('Error', 'Please select both sleep and wake-up times.');
      return;
    }
    if (fallAsleepHours.value.isEmpty || fallAsleepMinutes.value.isEmpty) {
      Get.snackbar(
          'Error', 'Please select time to fall asleep (hours and minutes).');
      return;
    }
    if (timesWokeUpToday.value < 0) {
      Get.snackbar('Error', 'Number of times woken up cannot be negative.');
      return;
    }
    Get.snackbar('Success', 'Diary entry saved successfully!');
    Get.offAll(()=>bottomNavigation());
  }

  @override
  void onInit() {
    super.onInit();
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



