import 'package:flutter/material.dart';
import 'package:qr_pj/widgets/listview_main.dart';

class HistorialMapPage extends StatelessWidget {
  const HistorialMapPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const ListViewMain(icon: Icons.location_pin);
  }
}
