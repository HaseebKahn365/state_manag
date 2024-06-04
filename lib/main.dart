/*
This application is about the university. 
It allows the students to take exams and allows the teacher to create exams and subjects. Here are the specific details about the interface of the application.
Data storage and app usage:
We are going to have some constant data that comes with application. then as the application grows and more students and teachers register, we will store them in the program without writing to local storage or backend.

Startup:
We have the login screen with two tabs for student and teacher login.
they can use their id and password to login. Moreover, both have the options to register.
we use a Boolean to go to registration screen and based on the value of the Boolean if true we will register a student and if false we register a teacher.
during the registration we the student can be paid or free user. (selection using radio buttons) 
View of registration screen:
Central title without appbar that says Register as (student or teacher, it depends)
as for name, id and password. 
Special feature: when asking for password we have password field and confirm password field make sure that they both share the common text editing controller so that the password is entered in both places automatically.
Login screen:
when the student or teacher presses the login. Also assign a random picture under the name 1 to 6.png from the assets folder we should display alert dialogue box with success or fail icon based on credential found in the system. navigate to the proper screen.
 
*/

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:state_manag/cep_business_logic.dart';
import 'package:state_manag/screens/registration.dart';
import 'package:state_manag/screens/teacher_and_student.dart';

void main() {
  runApp(UniversityApp());
}

class UniversityApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final university = University();
    university.mockData();

    return ChangeNotifierProvider(
      create: (context) => university,
      child: MaterialApp(
        title: 'University App',
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          brightness: Brightness.light,
          primarySwatch: Colors.blue,
        ),
        home: LoginScreen(),
      ),
    );
  }
}

class LoginScreen extends StatefulWidget {
  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> with SingleTickerProviderStateMixin {
  late TabController _tabController;
  TextEditingController idController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 2, vsync: this);
  }

  @override
  void dispose() {
    _tabController.dispose();
    idController.dispose();
    passwordController.dispose();
    super.dispose();
  }

  void login(bool isStudent) {
    final university = Provider.of<University>(context, listen: false);
    if (isStudent) {
      final student = university.getStudent(idController.text, passwordController.text);
      if (student != null) {
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => StudentScreen(student: student)),
        );
      } else {
        showDialog(context: context, builder: (context) => AlertDialog(title: Text('Login Failed'), content: Text('Invalid student credentials')));
      }
    } else {
      final teacher = university.getTeacher(idController.text, passwordController.text);
      if (teacher != null) {
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => TeacherScreen(teacher: teacher)),
        );
      } else {
        showDialog(context: context, builder: (context) => AlertDialog(title: Text('Login Failed'), content: Text('Invalid teacher credentials')));
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('University Login'),
        bottom: TabBar(
          controller: _tabController,
          tabs: [
            Tab(text: 'Student'),
            Tab(text: 'Teacher'),
          ],
        ),
      ),
      body: TabBarView(
        controller: _tabController,
        children: [
          buildLoginForm(true),
          buildLoginForm(false),
        ],
      ),
    );
  }

  Widget buildLoginForm(bool isStudent) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          TextField(
            controller: idController,
            decoration: InputDecoration(labelText: 'ID'),
          ),
          TextField(
            controller: passwordController,
            decoration: InputDecoration(labelText: 'Password'),
            obscureText: true,
          ),
          SizedBox(height: 20),
          ElevatedButton(
            onPressed: () => login(isStudent),
            child: Text('Login'),
          ),
          TextButton(
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => RegistrationScreen(isStudent: isStudent)),
              );
            },
            child: Text('Register'),
          ),
          Text('Total Registered Students: ${Provider.of<University>(context).students.length}'),
          Text('Total Registered Teachers: ${Provider.of<University>(context).teachers.length}'),
        ],
      ),
    );
  }
}
