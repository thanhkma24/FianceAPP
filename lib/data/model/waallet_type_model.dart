class WaalletTypeModel{
  late int id;
  String name;

  WaalletTypeModel({required this.name});
  WaalletTypeModel.withId({required this.id, required this.name});

  Map<String, dynamic> toMap() {
    final map = Map<String, dynamic>();
    if (id != null) {
      map['id'] = id;
    }
    map['name'] = name;
    return map;
  }

  factory WaalletTypeModel.fromMap(Map<String, dynamic> map) {
    return WaalletTypeModel.withId(
        id: map['id'],
        name: map['name'],
      );
  }
}