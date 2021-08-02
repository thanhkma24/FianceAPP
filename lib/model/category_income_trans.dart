class CategoryIncomeModel {
  final int id;
  final String titleIncome;
  final String desc;

  CategoryIncomeModel(this.id, this.titleIncome, this.desc);

  CategoryIncomeModel.fromMap(Map<String, dynamic> res)
      : id = res["id"],
        titleIncome = res["title"],
        desc = res["desc"];

  Map<String, Object?> toMap() {
    return {'id': id, 'title': titleIncome, 'desc': desc};
  }
}
