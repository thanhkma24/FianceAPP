import 'package:example/data/model/transaction_group_model.dart';
import 'package:example/data/services/database_handler.dart';
import 'package:sqflite/sqflite.dart';

abstract class CategoryRepository {
  Future<List<TransactionGroupModel>> getAllCategory();

  Future<int> insertCategory(TransactionGroupModel transactionGroupModel);

  Future<int> editCategory(int id, TransactionGroupModel transactionGroupModel);

  Future<int> deleteCategory(int id);
}

class CategoryRepositoryImpl implements CategoryRepository {
  Database database;

  CategoryRepositoryImpl({required this.database});

  @override
  Future<int> deleteCategory(int id) async {
    int result = await database
        .delete('transaction_group', where: "id = ?", whereArgs: [id]);
    return result;
  }

  @override
  Future<int> editCategory(
      int id, TransactionGroupModel transactionGroupModel) async {
    int result = await database.update(
        "transaction_group", transactionGroupModel.toMap(),
        where: "id = ?", whereArgs: [id]);
    return result;
  }

  @override
  Future<List<TransactionGroupModel>> getAllCategory() async {
    final List<Map<String, dynamic>> data =
        await database.query('transaction_group');
    List<TransactionGroupModel> listTransaction = data.isNotEmpty
        ? data
            .map((listTransaction) =>
                TransactionGroupModel.fromMap(listTransaction))
            .toList()
        : [];
    return listTransaction;
  }

  @override
  Future<int> insertCategory(
      TransactionGroupModel transactionGroupModel) async {
    final result = await database.insert(
        'transaction_group', transactionGroupModel.toMap());
    return result;
  }
}
