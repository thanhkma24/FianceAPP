class Plan{
  late int id;
  int planGroupId;
  String name;
  double planMoneyTotals;
  DateTime timeline;
  DateTime starttime;
  DateTime endtime;
  int planStatus;
  bool planLoop;

  Plan({required this.planGroupId, required this.name, required this.planMoneyTotals, required this.timeline,
    required this.starttime, required this.endtime, required this.planStatus, required this.planLoop});

  Plan.withId({required this.id,
    required this.planGroupId,
    required this.name,
    required this.planMoneyTotals,
    required this.timeline,
    required this.starttime,
    required this.endtime,
    required this.planStatus,
    required this.planLoop});

  Map<String, dynamic> toMap() {
    final map = Map<String, dynamic>();
    if (id != null) {
      map['id'] = id;
    }
    map['name'] = name;
    map['timeline'] = timeline.toIso8601String();
    map['planGroupId'] = planGroupId;
    map['planMoneyTotals'] = planMoneyTotals;
    map['starttime'] = starttime;
    map['endtime'] = endtime;
    map['planStatus'] = planStatus;
    map['planLoop'] = planLoop;
    return map;
  }

  factory Plan.fromMap(Map<String, dynamic> map) {
    return Plan.withId(
        id: map['id'],
        name: map['name'],
        timeline: DateTime.parse(map['time']),
        starttime: DateTime.parse(map['time']),
        endtime: DateTime.parse(map['time']),
        planGroupId: map['planGroupId'],
        planMoneyTotals: map['planMoneyTotals'],
        planStatus: map['planStatus'],
        planLoop: map['planLoop']
    );
  }
}
