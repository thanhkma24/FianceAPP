
import 'dart:io';

import 'package:example/data/model/transaction_group_model.dart';
import 'package:example/data/model/transaction_model.dart';
import 'package:path_provider/path_provider.dart';
import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';

class DatabaseHandler{
  static final _dbName = 'iMoney.db';
  static final _dbVersion = 1;

  DatabaseHandler._privateConstructor();
  static final DatabaseHandler instance = DatabaseHandler._privateConstructor();

  Database? _database;

 Future<Database?> get database async{
    if(_database!=null) return _database;
    _database = await _initDatabase();

    return _database;
  }

  _initDatabase() async{
    Directory directory = await getApplicationDocumentsDirectory();
    String path = join(directory.path, _dbName);
    return await openDatabase(path, version: _dbVersion, onCreate: _onCreate);
  }

  Future _onCreate(Database db, int version) async{
    await db.execute(
        '''
      CREATE TABLE user(
      id INTEGER PRIMARY KEY AUTOINCREMENT, 
      name TEXT NOT NULL, 
      password TEXT NOT NULL, 
      walletId INTEGER FOREIGN REFERENCES wallet(id),
      transactionId INTEGER FOREIGN REFERENCES transaction(id),
      planId INTEGER FOREIGN REFERENCES plan(id),
      )
      '''
            '''
      CREATE TABLE wallet(
       id INTEGER PRIMARY KEY AUTOINCREMENT,
       walletTypeId INTEGER FOREIGN REFERENCES wallet_type(id),
       name TEXT,
       moneyTotals FLOAT NOT NULL,
       balance FLOAT,
       currency TEXT,
       status BOOL,
      )
      '''
            '''
      CREATE TABLE wallet_type(
       id INTEGER PRIMARY KEY AUTOINCREMENT,
       name TEXT
      )
      '''
            '''
      CREATE TABLE transaction(
        id INTEGER PRIMARY KEY AUTOINCREMENT,
        name TEXT,
        time DATETIME NOT NULL,
        note TEXT,
        moneyTotal FLOAT,
        transactionGroupId INTEGER FOREIGN REFERENCES transaction_group(id),
      )
      '''
            '''
      CREATE TABLE transaction_group(
       id INTEGER PRIMARY KEY AUTOINCREMENT,
       name TEXT NOT NULL,
       transactionTypeName TEXT
      )
      '''
            '''
      CREATE TABLE plan(
        id INTEGER PRIMARY KEY AUTOINCREMENT,
        name TEXT NOT NULL,
        planGroupId INTEGER FOREIGN REFERENCES transaction_group(id),
        planMoneyTotals FLOAT NOT NULL,
        timeline DATETIME,
        starttime DATETIME,
        endtime DATETIME,
        planStatus INTEGER NOT NULL,
        planLoop BOOL;
      )
      '''
    );
  }

  Future<List<TransactionModel>> getTransactions() async{
    Database? db = await instance.database;
    var transactions = await db!.query('transaction');
    List<TransactionModel> transactionList  = transactions.isNotEmpty?transactions.map((e) => TransactionModel.fromMap(e)).toList():[];
    return transactionList;
  }

  Future<int> addTransaction(TransactionModel transactionModel) async {
    Database? db = await instance.database;
    return await db!.insert('transaction', transactionModel.toMap());
  }

  Future<int> update(TransactionModel transactionModel) async {
    Database? db = await instance.database;
    return await db!.update('transaction', transactionModel.toMap(), where: 'id = ?', whereArgs: [transactionModel.id]);
  }

  Future<int> delete(int id) async{
    Database? db = await instance.database;
    return await db!.delete('transaction', where: 'id=?', whereArgs: [id]);
  }

}
