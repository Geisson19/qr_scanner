import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:qr_pj/pages/pages.dart';
import 'package:qr_pj/providers/dv_provider.dart';
import 'package:qr_pj/providers/scan_list_provider.dart';
import 'package:qr_pj/providers/ui_provider.dart';
import 'package:qr_pj/widgets/widgets.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final ScanListProvider scanListProvider =
        Provider.of<ScanListProvider>(context);

    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        title: const Center(child: Text("Historial")),
        actions: [
          IconButton(
              icon: const Icon(Icons.delete_forever),
              onPressed: () {
                scanListProvider.deleteAllScans();
              })
        ],
      ),
      body: const _HomePageBody(),
      bottomNavigationBar: const CustomNavigator(),
      floatingActionButton: const ScanButton(),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
    );
  }
}

class _HomePageBody extends StatelessWidget {
  const _HomePageBody({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final UiProvider uiProvider = Provider.of<UiProvider>(context);

    final ScanListProvider scanListProvider = Provider.of<ScanListProvider>(
      context,
      listen: false,
    );

    switch (uiProvider.selectedMenuOpt) {
      case 0:
        scanListProvider.loadScansByType("geo");
        return const HistorialMapPage();
      case 1:
        scanListProvider.loadScansByType("http");
        return const AddressesPage();
      default:
        return const HistorialMapPage();
    }
  }
}
