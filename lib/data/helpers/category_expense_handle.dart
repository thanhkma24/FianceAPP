import 'package:example/model/category_expense_trans.dart';
import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';

class CategoryExpenseHandler {
  Future<Database> initializeDB() async {
    String path = await getDatabasesPath();
    return openDatabase(
      join(path, 'iMoneyDB.db'),
      onCreate: (database, version) async {
        await database.execute(
          "CREATE TABLE category_expense(id INTEGER PRIMARY KEY AUTOINCREMENT, titleExpense TEXT NOT NULL, desc TEXT)",
        );
        await database.rawInsert(
            'INSERT INTO category_expense(titleExpense) VALUES("Xăng xe")');
      },
      version: 1,
    );
  }

  List<CategoryExpenseModel> categoryExpenseList = [
    CategoryExpenseModel(1, 'Ăn uống', ''),
    CategoryExpenseModel(2, 'Tiền phòng', ''),
    CategoryExpenseModel(3, 'Hóa đơn', ''),
  ];

  //insert db
  Future<int> insertCategoryExpense(categoryExpense) async {
    int result = 0;
    final Database db = await initializeDB();
    result = await db.insert('categoryExpense', categoryExpense.toMap());
    // for (var categoryExpense in categoryExpenseList) {
    //
    // }
    return result;
  }

  //retrieve db
  Future<List<CategoryExpenseModel>> retrieveCategoryExpense() async {
    final Database db = await initializeDB();
    final List<Map<String, Object?>> queryResult =
        await db.query('category_expense');
    return queryResult.map((e) => CategoryExpenseModel.fromMap(e)).toList();
  }

  //delete category
  Future<void> deleteCategoryExpense(int id) async {
    final db = await initializeDB();
    await db.delete(
      'category_expense',
      where: "id = ?",
      whereArgs: [id],
    );
  }
}
