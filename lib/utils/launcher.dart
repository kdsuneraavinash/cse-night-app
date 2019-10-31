import 'package:flutter/widgets.dart';
import 'package:url_launcher/url_launcher.dart';

import 'alert.dart';

class Launcher {
  static void launchUrl(BuildContext context, String url) async {
    if (await canLaunch(url)) {
      await launch(url);
    } else {
      Alert.showAlertBox(context, 'Could not launch $url');
    }
  }
}
