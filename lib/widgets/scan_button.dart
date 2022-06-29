import 'package:flutter/material.dart';
import 'package:flutter_barcode_scanner/flutter_barcode_scanner.dart';
import 'package:provider/provider.dart';
import 'package:qr_pj/providers/scan_list_provider.dart';
import 'package:qr_pj/utils/utils.dart';

class ScanButton extends StatelessWidget {
  const ScanButton({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final ScanListProvider scanListProvider = Provider.of<ScanListProvider>(
      context,
      listen: false,
    );

    return FloatingActionButton(
      onPressed: () async {
        String barcodeScanRes = await FlutterBarcodeScanner.scanBarcode(
            "#3d8bef", "Cancelar", false, ScanMode.QR);

        if (barcodeScanRes == "-1") return;

        final createdScan = await scanListProvider.newScan(barcodeScanRes);

        launchURL(context, createdScan);
      },
      elevation: 0,
      child: const Icon(Icons.filter_center_focus),
    );
  }
}
