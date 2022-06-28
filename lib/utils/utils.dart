import 'package:flutter/cupertino.dart';
import 'package:qr_pj/models/scan_model.dart';
import "package:url_launcher/url_launcher.dart";

launchURL(BuildContext context, ScanModel scan) async {
  if (scan.tipo == "http") {
    final Uri url = Uri.parse(scan.valor);
    if (await canLaunchUrl(url)) {
      await launchUrl(url);
    } else {
      throw 'Could not launch $url';
    }
  } else {
    print("geolocation");
  }
}
