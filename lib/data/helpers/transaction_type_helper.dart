import 'dart:io';

import 'package:example/data/model/transaction_type_model.dart';
import 'package:path_provider/path_provider.dart';
import 'package:sqflite/sqflite.dart';

class TransactionTypeHelper {
  static final TransactionTypeHelper instance = TransactionTypeHelper._instance();
  static Database? _db;
  TransactionTypeHelper._instance();

  String table = 'transaction_type_table';
  String colId = 'id';
  String colName = 'name';
  String colTransactionGroupId= 'transactionGroupId';

  Future<Database?> get db async {
    if (_db == null) {
      _db = await _initDb();
    }
    return _db;
  }

  Future<Database> _initDb() async {
    Directory dir = await getApplicationDocumentsDirectory();
    String path = dir.path + "transaction_type.db";
    final transactionTypeDB =
        await openDatabase(path, version: 1, onCreate: _createDb);
    return transactionTypeDB;
  }

  void _createDb(Database db, int version) async {
    await db.execute(
        "CREATE TABLE $table($colId INTEGER PRIMARY KEY AUTOINCREMENT, $colName TEXT, $colTransactionGroupId INTEGER, FOREIGN KEY (transactionGroupId) REFERENCES transaction_group_table (id) ON UPDATE SET NULL ON DELETE SET NULL))");
  }

  //insert db
  Future<int> insertTransactionType(String name,int idGroup) async {
    int result = 0;
    final Database db = await _initDb();
    result = await db.insert(table,new TransactionTypeModel(name: name, transactionGroupId: idGroup).toMap());
    return result;
  }

  // Future<int> addTransactionType() async {
  //   TransactionTypeModel firstType = TransactionTypeModel(name: 'Thu');
  //   TransactionTypeModel secondType = TransactionTypeModel(name: 'Thu');
  //   List<TransactionTypeModel> listOfTransactionType = [firstType, secondType];
  //   return await insertTransactionType(name, idGroup);
  // }

  //update
  Future<int> updateTransactionType(String name, int idGroup) async{
    int result = 0;
    final Database db = await _initDb();
    result = await db.update(table, new TransactionTypeModel(name: name, transactionGroupId: idGroup).toMap());
    return result;
  }

  //delete type
  Future<void> deleteTransactionType(int id) async {
    final db = await _initDb();
    await db.delete(
      table,
      where: "id = ?",
      whereArgs: [id],
    );
  }
}
