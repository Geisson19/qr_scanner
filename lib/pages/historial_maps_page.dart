import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:qr_pj/models/scan_model.dart';
import 'package:qr_pj/providers/scan_list_provider.dart';

class HistorialMapPage extends StatelessWidget {
  const HistorialMapPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final ScanListProvider scanListProvider =
        Provider.of<ScanListProvider>(context);

    final List<ScanModel> scans = scanListProvider.scans;

    return ListView.builder(
      itemCount: scans.length,
      itemBuilder: (_, i) => ListTile(
        leading: Icon(Icons.map, color: Theme.of(context).primaryColor),
        title: Text(scans[i].valor),
        subtitle: Text(scans[i].id.toString()),
        trailing: const Icon(Icons.keyboard_arrow_right, color: Colors.grey),
        onTap: () {
          print(scans[i].id);
          print(scans[i].valor);
        },
      ),
    );
  }
}
