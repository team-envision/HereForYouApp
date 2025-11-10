import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

class BasicInfoPageState extends GetXState {
  TextEditingController ageController = TextEditingController();
  TextEditingController weightController = TextEditingController();
  TextEditingController heightController = TextEditingController();
  GlobalKey<FormState> formKey = GlobalKey<FormState>();
}
