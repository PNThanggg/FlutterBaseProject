import 'package:url_launcher/url_launcher.dart';

import 'app_log.dart';

class IntentUtils {
  IntentUtils._();

  static Future<bool> openBrowserURL({
    required String url,
    bool inApp = false,
  }) async {
    if (!await launchUrl(
      Uri.parse(url),
      mode: inApp ? LaunchMode.inAppWebView : LaunchMode.externalApplication,
    )) {
      AppLog.error('Could not launch $url', tag: "Open URL");
      return false;
    }

    return true;
  }
}
