import 'package:example/data/model/transaction_group_model.dart';
import 'package:sqflite/sqflite.dart';

abstract class CategoryRepository {
  Future<List<TransactionGroupModel>> getAllCategory();

  Future<int> insertCategory(TransactionGroupModel transactionGroupModel);

  Future<int> editCategory(int id, TransactionGroupModel transactionGroupModel);

  Future<int> deleteCategory(int id);
}

class CategoryRepositoryImpl implements CategoryRepository {
  Database database;
  final transactionGroup = 'TRANSACTIONGROUP';

  CategoryRepositoryImpl({required this.database});

  @override
  Future<int> deleteCategory(int id) async {
    int result = await database
        .delete(transactionGroup, where: "id = ?", whereArgs: [id]);
    return result;
  }

  @override
  Future<int> editCategory(
      int id, TransactionGroupModel transactionGroupModel) async {
    int result = await database.update(
        transactionGroup, transactionGroupModel.toMap(),
        where: "id = ?", whereArgs: [id]);
    return result;
  }

  @override
  Future<List<TransactionGroupModel>> getAllCategory() async {
    final List<Map<String, dynamic>> data =
        await database.query(transactionGroup);
    List<TransactionGroupModel> listTransaction = data.isNotEmpty
        ? data.map((e) => TransactionGroupModel.fromMap(e)).toList()
        : [];
    print('xxxxxxxxxxx${listTransaction[0].name}');
    return listTransaction;
  }

  @override
  Future<int> insertCategory(
      TransactionGroupModel transactionGroupModel) async {
    final result =
        await database.insert(transactionGroup, transactionGroupModel.toMap());
    return result;
  }
}
