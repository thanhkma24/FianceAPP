class WalletTypeModel{
  late int id;
  String name;

  WalletTypeModel({required this.name});
  WalletTypeModel.withId({required this.id, required this.name});

  Map<String, dynamic> toMap() {
    final map = Map<String, dynamic>();
    if (id != null) {
      map['id'] = id;
    }
    map['name'] = name;
    return map;
  }

  factory WalletTypeModel.fromMap(Map<String, dynamic> map) {
    return WalletTypeModel.withId(
      id: map['id'],
      name: map['name'],
    );
  }
}
