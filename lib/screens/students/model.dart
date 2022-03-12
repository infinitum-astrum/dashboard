class Student {
  late int id;
  late String name;
  late int age;
  late int semester;
  late int groupId;
  late String where;
  late String when;

  Student({
    required this.id,
    required this.name,
    required this.age,
    required this.groupId,
    required this.semester,
    required this.where,
    required this.when
  });

  Student.fromJson(json) {
    id = json["id"];
    name = json["name"];
    age = json["age"];
    groupId = json["group_id"];
    semester = json["semester"];
    where = json["where"];
    when = json["when"];
  }
}
