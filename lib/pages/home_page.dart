import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:qr_pj/pages/pages.dart';
import 'package:qr_pj/providers/dv_provider.dart';
import 'package:qr_pj/providers/ui_provider.dart';
import 'package:qr_pj/widgets/widgets.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        title: const Center(child: Text("Historial")),
        actions: [
          IconButton(onPressed: () {}, icon: const Icon(Icons.delete_forever))
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

    // TODO: delete
    DBProvider.db.database;

    switch (uiProvider.selectedMenuOpt) {
      case 0:
        return const HistorialMapPage();
      case 1:
        return const AddressesPage();
      default:
        return const HistorialMapPage();
    }
  }
}
