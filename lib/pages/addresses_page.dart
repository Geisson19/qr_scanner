import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:qr_pj/models/scan_model.dart';
import 'package:qr_pj/providers/scan_list_provider.dart';
import 'package:qr_pj/widgets/listview_main.dart';

class AddressesPage extends StatelessWidget {
  const AddressesPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const ListViewMain(icon: Icons.link);
  }
}
