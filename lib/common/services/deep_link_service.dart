import 'dart:async';

import 'package:app_links/app_links.dart';
import 'package:get/get.dart';
import 'package:here_for_you_app/app/routes/app_pages.dart';
import 'package:logger/logger.dart';

class DeepLink {
  DeepLink._();

  static Logger logger = Logger();
  static AppLinks appLinks = AppLinks();
  static StreamSubscription<Uri>? linkSubscription;

  static Future<void> initialize() async {
    await linkSubscription?.cancel();
    linkSubscription = appLinks.uriLinkStream.listen(
      (Uri uri) {
        logger.i('Deep link received (app running): $uri');
      },
      onError: (err) {
        logger.e('Deep link error: $err');
      },
    );

    try {
      Uri? uri = await appLinks.getInitialLink();
      logger.i('Deep link received (app not running): $uri');
      Get.offAllNamed(Routes.SPLASH_SCREEN);
    } catch (e) {
      logger.e('Deep link error: $e');
      Get.offAllNamed(Routes.SPLASH_SCREEN);
    }
  }

  static Future<void> dispose() async {
    await linkSubscription?.cancel();
    linkSubscription = null;
  }
}
