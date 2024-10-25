import 'package:flutter/material.dart';
import 'package:flutter_gemini/flutter_gemini.dart';
import 'package:get/get.dart';
import 'package:here_for_you_app/Components/kBottomBar.dart';
import 'package:here_for_you_app/app/routes/app_pages.dart';

import 'CONSTS/CONSTS.dart';


void main() {

  WidgetsFlutterBinding.ensureInitialized();
  Gemini.init(apiKey: GEMINI_API_KEY);
  runApp(
     GetMaterialApp(
      debugShowCheckedModeBanner: false,
      title: "Application",
      home: bottomNavigation(),
       // getPages: AppPages.routes,
       // initialRoute: AppPages.INITIAL,

    ),
  );


}
