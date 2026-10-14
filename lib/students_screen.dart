import 'package:flutter/material.dart';
import 'students.dart';
import 'detail_screen.dart';

class StudentsScreen extends StatefulWidget {
  const StudentsScreen({super.key});

  @override
  State<StudentsScreen> createState() => _StudentsScreenState();
}

class _StudentsScreenState extends State<StudentsScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Students'),
      ),
      body: ListView.builder(
        itemCount: students.length,
        itemBuilder: (context, index) {
          final s = students[index];
          return ListTile(
            leading: CircleAvatar(
              child: Text(s.name[0]),
            ),
            title: Text(s.name),
            subtitle: Text(s.group),
            trailing: const Icon(Icons.chevron_right),
            onTap: () async {
              final updatedStudent = await Navigator.of(context).push<Student>(
                MaterialPageRoute(
                  builder: (_) => DetailScreen(student: s),
                ),
              );
              if (updatedStudent != null && mounted) {
                setState(() {
                  students[index] = updatedStudent;
                });
              }
            },
          );
        },
      ),
    );
  }
}