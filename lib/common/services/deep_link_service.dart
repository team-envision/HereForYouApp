import 'dart:async';

import 'package:app_links/app_links.dart';
import 'package:here_for_you_app/common/utils/snackbars.dart';
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
        logger.i('Deep link received: $uri');
        Snackbars.info(title: "Deep Link", message: uri.host);
      },
      onError: (err) {
        logger.e('Deep link error: $err');
      },
    );
  }

  static Future<void> dispose() async {
    await linkSubscription?.cancel();
    linkSubscription = null;
  }
}
