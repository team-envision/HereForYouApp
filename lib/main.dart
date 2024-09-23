import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:here_for_you_app/Components/kBottomBar.dart';


void main() {

  WidgetsFlutterBinding.ensureInitialized();
  runApp(
     GetMaterialApp(
      debugShowCheckedModeBanner: false,
      title: "Application",
      home: bottomNavigation(),
    ),
  );


}
