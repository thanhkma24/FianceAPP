class UserModel{
  late int id;
  String name;
  String accountName;
  String password;
  int walleId;
  int transactionId;
  int planId;

  UserModel({required this.name, required this.accountName, required this.password, required this.transactionId, required this.walleId, required this.planId});
  UserModel.withId({required this.id, required this.name, required this.accountName, required this.password, required this.transactionId, required this.walleId, required this.planId});

  Map<String, dynamic> toMap() {
    final map = Map<String, dynamic>();
    if (id != null) {
      map['id'] = id;
    }
    map['name'] = name;
    map['accountName'] = accountName;
    map['password'] = password;
    map['walleId'] = walleId;
    map['transactionId'] = transactionId;
    map['planId'] = planId;
    return map;
  }

  factory UserModel.fromMap(Map<String, dynamic> map) {
    return UserModel.withId(
        id: map['id'],
        name: map['name'],
        accountName: map['accountName'],
        password: map['password'],
        walleId: map['walleId'],
        transactionId: map['transactionId'],
        planId: map['planId']
    );
  }
}
