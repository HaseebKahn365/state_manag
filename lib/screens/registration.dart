import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:state_manag/cep_business_logic.dart';

class RegistrationScreen extends StatefulWidget {
  final bool isStudent;

  RegistrationScreen({required this.isStudent});

  @override
  _RegistrationScreenState createState() => _RegistrationScreenState();
}

class _RegistrationScreenState extends State<RegistrationScreen> {
  TextEditingController nameController = TextEditingController();
  TextEditingController idController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  bool isPaid = false;

  void register() {
    final university = Provider.of<University>(context, listen: false);
    if (widget.isStudent) {
      final student = Student(
        name: nameController.text,
        id: idController.text,
        password: passwordController.text,
        isPaid: isPaid,
        courses: [],
        exams: [],
      );
      university.addStudent(student);

      showSnackBar(context, 'Student Registered Successfully');
    } else {
      final teacher = Teacher(
        name: nameController.text,
        id: idController.text,
        password: passwordController.text,
        courses: [],
        exams: [],
      );
      university.addTeacher(teacher);

      showSnackBar(context, 'Teacher Registered Successfully');
    }
    Navigator.pop(context);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Register as ${widget.isStudent ? 'Student' : 'Teacher'}'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            TextField(
              controller: nameController,
              decoration: InputDecoration(
                labelText: 'Name',
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(30.0),
                ),
                prefixIcon: Icon(Icons.person),
              ),
            ),
            const SizedBox(height: 20),
            TextField(
              controller: idController,
              decoration: InputDecoration(
                labelText: 'ID',
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(30.0),
                ),
                prefixIcon: Icon(Icons.person_pin),
              ),
            ),
            const SizedBox(height: 20),
            TextField(
              controller: passwordController,
              decoration: InputDecoration(
                labelText: 'Password',
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(30.0),
                ),
                prefixIcon: Icon(Icons.lock),
              ),
              obscureText: true,
            ),
            const SizedBox(height: 20),
            TextField(
              controller: passwordController,
              decoration: InputDecoration(
                labelText: 'Confirm Password',
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(30.0),
                ),
                prefixIcon: Icon(Icons.lock),
              ),
              obscureText: true,
            ),
            const SizedBox(height: 20),
            if (widget.isStudent)
              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Radio(
                        value: true,
                        groupValue: isPaid,
                        onChanged: (bool? value) {
                          setState(() {
                            isPaid = value!;
                          });
                        },
                      ),
                      Text('Paid User'),
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Radio(
                        value: false,
                        groupValue: isPaid,
                        onChanged: (bool? value) {
                          setState(() {
                            isPaid = value!;
                          });
                        },
                      ),
                      Text('Free User'),
                    ],
                  ),
                ],
              ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: register,
              child: Text('Register'),
            ),
          ],
        ),
      ),
    );
  }

  void showSnackBar(BuildContext context, String message) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(message),
        duration: Duration(seconds: 2),
      ),
    );
  }
}
