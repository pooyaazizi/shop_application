import 'package:url_launcher/url_launcher.dart';

abstract class UrlHandler {
  void openUrl(String uri);
}

class UrlLauncher implements UrlHandler {
  @override
  void openUrl(String uri) {
    launchUrl(
      Uri.parse(uri),
      mode: LaunchMode.externalApplication,
    );
  }
}
