import 'package:flutter/material.dart';
import 'package:state_manag/cep_business_logic.dart';

class StudentScreen extends StatelessWidget {
  final Student student;

  StudentScreen({required this.student});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Student Dashboard'),
      ),
      drawer: Drawer(
        child: ListView(
          children: [
            DrawerHeader(
              child: Text('Hello, ${student.name}'),
              decoration: BoxDecoration(color: Colors.blue),
            ),
            ListTile(
              title: Text('Change Password'),
              onTap: () {
                // Handle change password
              },
            ),
          ],
        ),
      ),
      body: Center(
        child: Text('Courses and Exams for ${student.name}'),
      ),
    );
  }
}

class TeacherScreen extends StatelessWidget {
  final Teacher teacher;

  TeacherScreen({required this.teacher});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Teacher Dashboard'),
      ),
      drawer: Drawer(
        child: ListView(
          children: [
            DrawerHeader(
              child: Text('Hello, ${teacher.name}'),
              decoration: BoxDecoration(color: Colors.blue),
            ),
            ListTile(
              title: Text('Change Password'),
              onTap: () {
                // Handle change password
              },
            ),
          ],
        ),
      ),
      body: Center(
        child: Text('Courses and Exams for ${teacher.name}'),
      ),
    );
  }
}
