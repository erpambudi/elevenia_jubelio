import 'dart:async';

import 'package:elevenia_jubelio/data/models/product_table.dart';
import 'package:sqflite/sqflite.dart';

class DatabaseHelper {
  static DatabaseHelper? _databaseHelper;
  DatabaseHelper._instance() {
    _databaseHelper = this;
  }

  factory DatabaseHelper() => _databaseHelper ?? DatabaseHelper._instance();

  static Database? _database;

  Future<Database?> get database async {
    _database ??= await _initDb();
    return _database;
  }

  static const String _tblCache = 'products_cache';

  Future<Database> _initDb() async {
    final path = await getDatabasesPath();
    final databasePath = '$path/elevenia_jubelio.db';

    var db = await openDatabase(databasePath, version: 1, onCreate: _onCreate);
    return db;
  }

  void _onCreate(Database db, int version) async {
    await db.execute('''
      CREATE TABLE  $_tblCache (
        prdNo TEXT PRIMARY KEY,
        prdNm TEXT,
        dispCtgrNm TEXT,
        prdSelQty TEXT,
        selPrc TEXT
      );
    ''');
  }

  Future<void> insertProductCacheTransaction(
      List<ProductTable> products) async {
    final db = await database;
    db!.transaction((txn) async {
      for (final product in products) {
        final productJson = product.toJson();
        txn.insert(_tblCache, productJson);
      }
    });
  }

  Future<List<Map<String, dynamic>>> getCacheProducts() async {
    final db = await database;
    final List<Map<String, dynamic>> results = await db!.query(_tblCache);

    return results;
  }

  Future<int> clearProductCache() async {
    final db = await database;
    return await db!.delete(_tblCache);
  }
}
