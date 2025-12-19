import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:here_for_you_app/app/routes/app_pages.dart';
import 'package:here_for_you_app/app_bindings.dart';

import 'firebase_options.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  SystemChrome.setEnabledSystemUIMode(
    SystemUiMode.immersiveSticky,
    overlays: [SystemUiOverlay.bottom],
  );

  runApp(
    ScreenUtilInit(
      designSize: const Size(393, 852),
      builder: (context, child) => GetMaterialApp(
        initialBinding: AppBindings(),
        debugShowCheckedModeBanner: false,
        title: "Application",
        getPages: AppPages.routes,
        initialRoute: AppPages.INITIAL,
      ),
    ),
  );
}
