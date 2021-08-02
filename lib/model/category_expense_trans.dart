class CategoryExpenseModel {
  final int id;
  final String titleExpense;
  final String desc;

  CategoryExpenseModel(this.id, this.titleExpense, this.desc);

  CategoryExpenseModel.fromMap(Map<String, dynamic> res)
      : id = res["id"],
        titleExpense = res["title"],
        desc = res["desc"];

  Map<String, Object?> toMap() {
    return {'id': id, 'title': titleExpense, 'desc': desc};
  }
}
