import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:qr_pj/models/scan_model.dart';
import 'package:qr_pj/providers/scan_list_provider.dart';
import 'package:qr_pj/utils/utils.dart' as utils;

class ListViewMain extends StatelessWidget {
  const ListViewMain({Key? key, required this.icon}) : super(key: key);

  final IconData icon;

  @override
  Widget build(BuildContext context) {
    final ScanListProvider scanListProvider =
        Provider.of<ScanListProvider>(context);

    final List<ScanModel> scans = scanListProvider.scans;

    return ListView.builder(
      itemCount: scans.length,
      itemBuilder: (_, i) => Dismissible(
        onDismissed: (direction) => scanListProvider.deleteScan(scans[i].id!),
        background: Container(color: Colors.amber),
        key: UniqueKey(),
        child: ListTile(
          leading: Icon(icon, color: Theme.of(context).primaryColor),
          title: Text(scans[i].valor),
          subtitle: Text(scans[i].id.toString()),
          trailing: const Icon(Icons.keyboard_arrow_right, color: Colors.grey),
          onTap: () {
            utils.launchURL(context, scans[i]);
          },
        ),
      ),
    );
  }
}
