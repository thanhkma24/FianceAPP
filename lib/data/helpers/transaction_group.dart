import 'dart:io';

import 'package:example/data/model/transaction_group_model.dart';
import 'package:path_provider/path_provider.dart';
import 'package:sqflite/sqflite.dart';

class TransactionGroupHelper {
  static final TransactionGroupHelper instance = TransactionGroupHelper._instance();
  static Database? _db;
  TransactionGroupHelper._instance();

  String table = 'transaction_group_table';
  String colId = 'id';
  String colName = 'name';

  Future<Database?> get db async {
    if (_db == null) {
      _db = await _initDb();
    }
    return _db;
  }

  Future<Database> _initDb() async {
    Directory dir = await getApplicationDocumentsDirectory();
    String path = dir.path + "transaction_group.db";
    final transactionGroupDB =
        await openDatabase(path, version: 1, onCreate: _createDb);
    return transactionGroupDB;
  }

  void _createDb(Database db, int version) async {
    await db.execute(
        "CREATE TABLE $table($colId INTEGER PRIMARY KEY AUTOINCREMENT, $colName TEXT)");
  }

  //insert db
  Future<int> insertTransactionGroup(String name,String nameType) async {
    int result = 0;
    final Database db = await _initDb();
    result = await db.insert(table,new TransactionGroupModel(name: name,transactionTypeName: nameType).toMap());
    return result;
  }

  //retrieve data
  Future<List<TransactionGroupModel>> retrieveUsers() async {
    final Database db = await _initDb();
    final List<Map<String, Object?>> queryResult = await db.query(table);
    return queryResult.map((e) => TransactionGroupModel.fromMap(e)).toList();
  }

  //update data
  Future<int> updateTransactionGroup(String name, String nameType) async{
    int result = 0;
    final Database db = await _initDb();
    result = await db.update(table, new TransactionGroupModel(name: name,transactionTypeName: nameType).toMap());
    return result;
  }

  //delete data
  Future<void> deleteTransactionGroup(int id) async {
    final db = await _initDb();
    await db.delete(
      table,
      where: "id = ?",
      whereArgs: [id],
    );
  }
}
