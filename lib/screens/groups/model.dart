import 'package:dashboard/screens/students/model.dart';

class Group {
  late int id;
  late String name;
  List<Student> students = [];

  Group({
    required this.id,
    required this.name,
  });

  Group.fromJson(Map<String, dynamic> json) {
      id = json['id'];
      name = json["name"];
  }
}
