import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:here_for_you_app/Components/kBottomBar.dart';
import 'package:here_for_you_app/app/routes/app_pages.dart';


void main() {

  WidgetsFlutterBinding.ensureInitialized();
  runApp(
     GetMaterialApp(
      debugShowCheckedModeBanner: false,
      title: "Application",
      // home: bottomNavigation(),
       getPages: AppPages.routes,
       initialRoute: AppPages.INITIAL,

    ),
  );


}
