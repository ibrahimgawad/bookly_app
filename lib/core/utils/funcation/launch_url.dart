import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

import 'custom_snac_bar.dart';

Future<void> launchCustomUrl(context, String text) async {
  if (text != null) {
  Uri url = Uri.parse(text);
  if (await canLaunchUrl(url)) {
    await launchUrl(url);
  } else {
    customSnacBar(context, "connot launch $text");
  }
}
}
