import 'dart:io';

import 'package:example/data/model/transaction_group_model.dart';
import 'package:example/data/model/transaction_model.dart';
import 'package:path_provider/path_provider.dart';
import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';

class DatabaseHandler {
  static final _dbName = 'iMoney.db';
  static final _dbVersion = 1;
  final userTable = 'User';
  final wallet = 'wallet';
  final walletType = 'walletType';
  final transactionGroup = 'transactionGroup';
  final plan = 'plan';
  final transaction = 'transaction';

  static final DatabaseHandler instance = DatabaseHandler();

  Database? _database;

  Future<Database?> get database async {
    if (_database != null) return _database;
    _database = await _initDatabase();
    return _database;
  }

  static const createTableUser =
      'CREATE TABLE IF NOT EXISTS USER(id INTEGER PRIMARY KEY AUTOINCREMENT ,name TEXT ,password TEXT )';
  static const createTableWallet =
      'CREATE TABLE IF NOT EXISTS WALLET(id INTEGER PRIMARY KEY, name TEXT, moneyTotals REAL, balance REAL, currency TEXT, status INTEGER)';
  static const createTableWalletType =
      'CREATE TABLE IF NOT EXISTS WALLETTYPE(id INTEGER PRIMARY KEY AUTOINCREMENT,name TEXT)';
  static const createTableTransactiongroup =
      'CREATE TABLE IF NOT EXISTS TRANSACTIONGROUP(id INTEGER PRIMARY KEY AUTOINCREMENT,name TEXT,transactionTypeName TEXT)';
  static const createTableTransaction =
      'CREATE TABLE IF NOT EXISTS TRANSACTIONS(id INTEGER PRIMARY KEY AUTOINCREMENT, name TEXT, time TEXT , note TEXT, moneyTotal REAL )';
  static const createTablePlan =
      'CREATE TABLE IF NOT EXISTS PLAN(id INTEGER PRIMARY KEY AUTOINCREMENT,name TEXT, planMoneyTotals REAL,timeline TEXT,starttime TEXT,endtime TEXT,planStatus INTEGER ,planLoop INTEGER)';

  String name = 'ăn';
  String groupName = 'chi';
  static const createForeginKeyUserWallet =
      'ALTER TABLE USER ADD column walletId INTEGER REFERENCES WALLET(id)';
  static const createForeginKeyUserTransaction =
      'ALTER TABLE USER ADD COLUMN transactionId INTEGER REFERENCES TRANSACTIONS(id)';
  static const createForeginKeyUserPlan =
      'ALTER TABLE USER ADD COLUMN planId INTEGER REFERENCES PLAN(id)';

  static const createForeginKeyWallet =
      'ALTER TABLE WALLET ADD COLUMN walletTypeId INTEGER REFERENCES WALLETTYPE(id)';

  static const createForeginKeyTransaction =
      'ALTER TABLE TRANSACTIONS ADD  COLUMN transactionGroupId INTEGER REFERENCES TRANSACTIONGROUP(id)';
  static const createForeginKeyPlan =
      'ALTER TABLE PLAN ADD  COLUMN  planGroupId INTEGER  REFERENCES TRANSACTIONGROUP(id)';
  static const insertGroup =
      'INSERT INTO TRANSACTIONGROUP(name,transactionTypeName) VALUES(an,chi)';

  Future<Database> _initDatabase() async {
    Directory directory = await getApplicationDocumentsDirectory();
    String path = join(directory.path, _dbName);
    var database = await openDatabase(path, version: _dbVersion,
        onCreate: (Database db, int version) async {
      await db.execute(createTableUser);
      await db.execute(createTableWallet);
      await db.execute(createTableWalletType);
      await db.execute(createTableTransactiongroup);
      await db.execute(createTableTransaction);
      await db.execute(createTablePlan);
      await db.execute(createForeginKeyUserWallet);
      await db.execute(createForeginKeyUserTransaction);
      await db.execute(createForeginKeyUserPlan);
      await db.execute(createForeginKeyWallet);
      await db.execute(createForeginKeyTransaction);
      await db.execute(createForeginKeyPlan);
      await db.insert(
          'TRANSACTIONGROUP',
          TransactionGroupModel.withId(
                  id: 1, name: 'Kiếm tiền', transactionTypeName: 'thu')
              .toMap());
      await db.insert(
          'TRANSACTIONGROUP',
          TransactionGroupModel.withId(
                  id: 2, name: 'Ăn', transactionTypeName: 'thu')
              .toMap());
      await db.insert(
          'TRANSACTIONGROUP',
          TransactionGroupModel.withId(
                  id: 3, name: 'Giao dịch', transactionTypeName: 'thu')
              .toMap());
      await db.insert(
          'TRANSACTIONGROUP',
          TransactionGroupModel.withId(
                  id: 4, name: 'Làm freelancer', transactionTypeName: 'thu')
              .toMap());
    });
    return database;
  }

  Future<List<TransactionModel>> getTransactions() async {
    Database? db = await instance.database;
    var transactions = await db!.query('transaction');
    List<TransactionModel> transactionList = transactions.isNotEmpty
        ? transactions.map((e) => TransactionModel.fromMap(e)).toList()
        : [];
    return transactionList;
  }

  Future<int> addTransaction(TransactionModel transactionModel) async {
    Database? db = await instance.database;
    return await db!.insert('transaction', transactionModel.toMap());
  }

  Future<int> update(TransactionModel transactionModel) async {
    Database? db = await instance.database;
    return await db!.update('transaction', transactionModel.toMap(),
        where: 'id = ?', whereArgs: [transactionModel.id]);
  }

  Future<int> delete(int id) async {
    Database? db = await instance.database;
    return await db!.delete('transaction', where: 'id=?', whereArgs: [id]);
  }
}
