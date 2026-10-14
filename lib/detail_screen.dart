import 'package:flutter/material.dart';
import 'students.dart';
import 'edit_screen.dart';

class DetailScreen extends StatefulWidget {
  const DetailScreen({super.key, required this.student});

  final Student student;

  @override
  State<DetailScreen> createState() => _DetailScreenState();
}

class _DetailScreenState extends State<DetailScreen> {
  late Student _student = widget.student;

  Future<void> _edit() async {
    // EditScreen-ге өту және жаңа мәліметті күту
    final updatedName = await Navigator.of(context).push<String>(
      MaterialPageRoute(
        builder: (_) => EditScreen(student: _student),
      ),
    );

    // Егер қолданушы Save баспай артқа шығып кетсе немесе ешнәрсе жазбаса
    if (updatedName == null || !mounted) return;

    // Жергілікті күйді жаңарту
    setState(() {
      _student = _student.copyWith(name: updatedName);
    });

    // Өзгерген студентті басты тізімге (StudentsScreen) қайтару
    if (mounted) {
      Navigator.of(context).pop(_student);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(_student.name),
        actions: [
          IconButton(
            icon: const Icon(Icons.edit),
            onPressed: _edit, // Қаламсап батырмасы осы функцияны шақырады
          ),
        ],
      ),
      body: ListView(
        children: [
          ListTile(
            leading: const Icon(Icons.school),
            title: const Text('Group'),
            subtitle: Text(_student.group),
          ),
          ListTile(
            leading: const Icon(Icons.mail),
            title: const Text('Email'),
            subtitle: Text(_student.email),
          ),
        ],
      ),
    );
  }
}