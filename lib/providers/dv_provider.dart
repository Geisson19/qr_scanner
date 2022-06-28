import 'package:qr_pj/models/scan_model.dart';
export 'package:qr_pj/models/scan_model.dart';
import 'package:sqflite/sqflite.dart';

class DBProvider {
  static Database? _database;
  static final DBProvider db = DBProvider._();

  DBProvider._();

  Future<Database> get database async {
    if (_database != null) return _database!;
    _database = await initDB();
    return _database!;
  }

  initDB() async {
    return await openDatabase(
      "scan_qr_pj.db",
      version: 1,
      onOpen: (db) {},
      onCreate: (Database db, int version) async {
        await db.execute(
          'CREATE TABLE scans ('
          'id INTEGER PRIMARY KEY,'
          'type TEXT,'
          'value TEXT'
          ')',
        );
      },
    );
  }

  Future<int> newScan(ScanModel newScan) async {
    final db = await database;
    final response = await db.insert('scans', newScan.toMap());
    return response;
  }

  Future<ScanModel?> getScanById(int id) async {
    final db = await database;
    final response = await db.query('scans', where: 'id = ?', whereArgs: [id]);
    return response.isNotEmpty ? ScanModel.fromMap(response.first) : null;
  }

  Future<List<ScanModel>> getAllScans() async {
    final db = await database;
    final response = await db.query('scans');
    return response.isNotEmpty
        ? response.map((scan) => ScanModel.fromMap(scan)).toList()
        : [];
  }

  Future<List<ScanModel>> getScansByType(String type) async {
    final db = await database;
    final response =
        await db.query('scans', where: 'type = ?', whereArgs: [type]);
    return response.isNotEmpty
        ? response.map((scan) => ScanModel.fromMap(scan)).toList()
        : [];
  }

  Future<int> updateScan(ScanModel scan) async {
    final db = await database;
    final response = await db
        .update('scans', scan.toMap(), where: 'id = ?', whereArgs: [scan.id]);
    return response;
  }

  Future<int> deleteScan(int id) async {
    final db = await database;
    final response = await db.delete('scans', where: 'id = ?', whereArgs: [id]);
    return response;
  }

  Future<int> deleteAll() async {
    final db = await database;
    final response = await db.delete('scans');
    return response;
  }
}
