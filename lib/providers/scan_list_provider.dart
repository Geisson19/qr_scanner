import 'package:flutter/material.dart';
import 'package:qr_pj/providers/dv_provider.dart';

class ScanListProvider extends ChangeNotifier {
  final List<ScanModel> scans = [];

  final String _selectedScanType = 'http';

  Future<ScanModel> newScan(String value) async {
    final newScan = ScanModel(
      valor: value,
    );
    final int id = await DBProvider.db.newScan(newScan);

    newScan.id = id;

    if (_selectedScanType == newScan.tipo) {
      scans.add(newScan);
    }
    notifyListeners();
    return newScan;
  }

  loadScans() async {
    final List<ScanModel> loadedScans = await DBProvider.db.getAllScans();
    scans.clear();
    scans.addAll(loadedScans);
    notifyListeners();
  }

  loadScansByType(String type) async {
    final List<ScanModel> loadedScans =
        await DBProvider.db.getScansByType(type);
    scans.clear();
    scans.addAll(loadedScans);
    notifyListeners();
  }

  deleteAllScans() async {
    await DBProvider.db.deleteAll();
    scans.clear();
    notifyListeners();
  }

  deleteScan(int id) async {
    await DBProvider.db.deleteScan(id);
    scans.removeWhere((scan) => scan.id == id);
    notifyListeners();
  }
}
