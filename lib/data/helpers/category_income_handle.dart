import 'package:example/model/category_income_trans.dart';
import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';

class CategoryIncomeHandler {
  Future<Database> initializeDB() async {
    String path = await getDatabasesPath();
    return openDatabase(
      join(path, 'iMoneyDB.db'),
      onCreate: (database, version) async {
        await database.execute(
          "CREATE TABLE category_income(id INTEGER PRIMARY KEY AUTOINCREMENT, titleIncome TEXT NOT NULL, desc TEXT)",
        );
        await database.execute(
            'Select * from category_income', categoryIncomeList);
      },
      version: 1,
    );
  }

  List<CategoryIncomeModel> categoryIncomeList = [
    CategoryIncomeModel(1, 'Lương', 'Nguồn lương'),
    CategoryIncomeModel(2, 'Đầu tư ngoài', 'Nguồn đầu tư ngoài'),
  ];

  //insert db
  Future<int> insertCategoryIncome(categoryIncomeList) async {
    int result = 0;
    final Database db = await initializeDB();
    for (var category in categoryIncomeList) {
      result = await db.insert('category', category.toMap());
    }
    return result;
  }

  //retrieve db
  Future<List<CategoryIncomeModel>> getRetrieveCategoryIncome() async {
    final Database db = await initializeDB();
    final List<Map<String, Object?>> queryResult =
        await db.query('category_income');

    return queryResult.map((e) => CategoryIncomeModel.fromMap(e)).toList();
  }

  //delete category
  Future<void> deleteCategoryIncome(int id) async {
    final db = await initializeDB();
    await db.delete(
      'category_income',
      where: "id = ?",
      whereArgs: [id],
    );
  }
}
