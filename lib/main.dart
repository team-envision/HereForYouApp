import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'app/modules/password_view/views/otp_view.dart';
import 'app/modules/password_view/bindings/password_view_binding.dart';
import 'app/modules/password_view/views/password_view_view.dart';

void main() {

  WidgetsFlutterBinding.ensureInitialized();
  runApp(
    GetMaterialApp(
      debugShowCheckedModeBanner: false,
      title: "Application",
      initialRoute: AppPages.INITIAL,
      getPages: AppPages.routes,
    ),
  );


}

class PasswordViewApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      initialRoute: '/otp',
      getPages: [
        GetPage(
          name: '/otp',
          page: () => OTPView(),
          binding: PasswordViewBinding(),
        ),
        GetPage(
          name: '/changePassword',
          page: () => ChangePasswordView(),
          binding: PasswordViewBinding(),
        ),
      ],
    );
  }
}
