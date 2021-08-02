class TransactionTypeModel {
  late int id;
  String name;
  int? transactionGroupId;

  TransactionTypeModel({required this.name, this.transactionGroupId});

  TransactionTypeModel.withId(
      {required this.id, required this.name, this.transactionGroupId});

  Map<String, dynamic> toMap() {
    final map = Map<String, dynamic>();
    if (id != null) {
      map['id'] = id;
    }
    map['name'] = name;
    return map;
  }

  factory TransactionTypeModel.fromMap(Map<String, dynamic> map) {
    return TransactionTypeModel.withId(
      id: map['id'],
      name: map['name'],
      transactionGroupId: map['transactionGroupId'],
    );
  }
}
