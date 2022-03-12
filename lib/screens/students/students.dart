import 'package:fluent_ui/fluent_ui.dart';
import 'package:dashboard/main.dart';
import 'package:flutter/material.dart' as m;

const Widget spacer = SizedBox(height: 5.0);

class StudentsPage extends StatefulWidget {
  const StudentsPage({Key? key}) : super(key: key);

  @override
  _StudentsPageState createState() => _StudentsPageState();
}

class _StudentsPageState extends State<StudentsPage> {
  late int _selected;

  @override
  void initState() {
    _selected = 0;
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return ScaffoldPage.scrollable(
      header: const PageHeader(title: Text('Students')),
      children:
          //  groups.length < 2
          //     ? [
          //         Text(
          //           'No students added yet',
          //           style: TextStyle(color: Colors.grey[100]),
          //         ),
          //       ]
          //     :
          [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            PillButtonBar(
              selected: _selected,
              onChanged: (i) => setState(() => _selected = i),
              items: List.generate(groups.length, (index) {
                return PillButtonBarItem(text: Text(groups[index].name));
              }),
            ),
            IconButton(icon: const Icon(FluentIcons.add), onPressed: () {}),
          ],
        ),
        m.DataTable(
          columns: const [
            m.DataColumn(label: Text("ID")),
            m.DataColumn(label: Text("Name")),
            m.DataColumn(label: Text("Age")),
            m.DataColumn(label: Text("Semester")),
            m.DataColumn(label: Text("Where?")),
            m.DataColumn(label: Text("When?")),
          ],
          rows: groups[_selected].students.map((student) {
            return m.DataRow(cells: [
              m.DataCell(Text(student.id.toString())),
              m.DataCell(Text(student.name)),
              m.DataCell(Text(student.age.toString())),
              m.DataCell(Text(student.semester.toString())),
              m.DataCell(Text(student.where)),
              m.DataCell(Text(student.when))
            ]);
          }).toList(),
        ),
      ],
    );
  }
}
