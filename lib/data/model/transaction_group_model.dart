class TransactionGroupModel{
  late int id;
  String name;
  String transactionTypeName;

  TransactionGroupModel({required this.name, required this.transactionTypeName});
  TransactionGroupModel.withId({required this.id, required this.name, required this.transactionTypeName});

  Map<String, dynamic> toMap() {
    final map = Map<String, dynamic>();
    if (id != null) {
      map['id'] = id;
    }
    map['name'] = name;
    map['transactionTypeName'] = transactionTypeName;
    return map;
  }

  factory TransactionGroupModel.fromMap(Map<String, dynamic> map) {
    return TransactionGroupModel.withId(
      id: map['id'],
      name: map['name'],
      transactionTypeName: map['transactionTypeName'],
    );
  }
}
