import 'dart:async';

import 'package:elevenia_jubelio/data/models/product_table.dart';
import 'package:sqflite/sqflite.dart';

import '../../models/cart_table.dart';

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
  static const String _tblCart = 'cart';

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
    await db.execute('''
      CREATE TABLE  $_tblCart (
        prdNo TEXT PRIMARY KEY,
        prdNm TEXT,
        dispCtgrNm TEXT,
        quantity INTEGER,
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

  Future<int> insertCartTable(CartTable cartTable) async {
    final db = await database;
    return await db!.insert(_tblCart, cartTable.toJson());
  }

  Future<int> removeCartTable(CartTable cartTable) async {
    final db = await database;
    return await db!.delete(
      _tblCart,
      where: 'prdNo = ?',
      whereArgs: [cartTable.prdNo],
    );
  }

  Future<int> updateQty(CartTable cartTable, int quantity) async {
    final db = await database;
    return await db!.update(
      _tblCart,
      {'quantity': quantity},
      where: 'prdNo = ?',
      whereArgs: [cartTable.prdNo],
    );
  }

  Future<Map<String, dynamic>?> getCartTableById(String id) async {
    final db = await database;
    final results = await db!.query(
      _tblCart,
      where: 'prdNo = ?',
      whereArgs: [id],
    );

    if (results.isNotEmpty) {
      return results.first;
    } else {
      return null;
    }
  }

  Future<List<Map<String, dynamic>>> getCartData() async {
    final db = await database;
    final List<Map<String, dynamic>> results = await db!.query(_tblCart);

    return results;
  }
}
