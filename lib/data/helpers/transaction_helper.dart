import 'dart:io';

import 'package:example/data/model/transaction_model.dart';
import 'package:path_provider/path_provider.dart';
import 'package:sqflite/sqflite.dart';

class TransactionHelper {
  static final TransactionHelper instance = TransactionHelper._instance();
  static Database? _db;
  TransactionHelper._instance();

  String table = 'transaction_table';
  String colId = 'id';
  String colName = 'name';
  String colTime = 'time';
  String colStartTime = 'startTime';
  String colEndTime = 'endTime';
  String colNote = 'note';
  String colMoneyTotal = 'moneyTotal';
  String colStatus = 'status';
  String colLoopStatus = 'loopStatus';
  String colTransactionTypeId = 'transactionTypeId';

  Future<Database?> get db async {
    if (_db == null) {
      _db = await _initDb();
    }
    return _db;
  }

  Future<Database> _initDb() async {
    Directory dir = await getApplicationDocumentsDirectory();
    String path = dir.path + "transaction.db";
    final transactionDB =
        await openDatabase(path, version: 1, onCreate: _createDb);
    return transactionDB;
  }

  void _createDb(Database db, int version) async {
    await db.execute(
        "CREATE TABLE $table($colId INTEGER PRIMARY KEY AUTOINCREMENT, $colName TEXT, $colTime TEXT, $colStartTime TEXT, $colEndTime TEXT, $colNote TEXT, $colMoneyTotal TEXT, $colStatus TEXT, $colLoopStatus TEXT, $colTransactionTypeId INTEGER, FOREIGN KEY (transactionTypeId) REFERENCES transaction_type_table (id) ON UPDATE SET NULL ON DELETE SET NULL)");
  }
  
  Future<List<Map<String, dynamic>>> getTransactionMapList() async {
    Database? db = await this.db;
    final List<Map<String, dynamic>> result = await db!.query(table);
    return result;
  }

  Future<List<TransactionModel>> getTransactionList() async {
    final List<Map<String, dynamic>> taskMapList = await getTransactionMapList();
    final List<TransactionModel> transactionList = [];
    taskMapList.forEach((taskMap) {
      transactionList.add(TransactionModel.fromMap(taskMap));
    });
    return transactionList;
  }
  
   Future<int> insertTransaction(TransactionModel transactionModel) async {
    Database? db = await this.db;
    final int result = await db!.insert(table, transactionModel.toMap());
    return result;
  }
  
   Future<int> updateTransaction(TransactionModel transactionModel) async {
    Database? db = await this.db;
    final int result = await db!.update(table, transactionModel.toMap(),
        where: "$colId = ?", whereArgs: [transactionModel.id]);
    return result;
  }

  Future<int> deleteTransaction(int id) async {
    Database? db = await this.db;
    final int result =
        await db!.delete(table, where: "$colId = ?", whereArgs: [id]);
    return result;
  }
}
