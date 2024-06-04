import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'dart:async';

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
      body: ChangeNotifierProvider.value(
        value: student,
        child: StudentDashboard(student: student),
      ),
    );
  }
}

class StudentDashboard extends StatelessWidget {
  final Student student;

  StudentDashboard({required this.student});

  @override
  Widget build(BuildContext context) {
    return Consumer<Student>(
      builder: (context, student, child) {
        return Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Courses',
                style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
              ),
              SizedBox(height: 10),
              Expanded(
                child: ListView.builder(
                  itemCount: student.courses.length,
                  itemBuilder: (context, index) {
                    final course = student.courses[index];
                    return ListTile(
                      title: Text(course.name),
                      subtitle: Text('ID: ${course.id} - Credit Hours: ${course.creditHours}'),
                    );
                  },
                ),
              ),
              SizedBox(height: 20),
              Text(
                'Exams',
                style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
              ),
              SizedBox(height: 10),
              Expanded(
                child: ListView.builder(
                  itemCount: student.exams.length,
                  itemBuilder: (context, index) {
                    final exam = student.exams[index];
                    return ListTile(
                      title: Text(exam.name),
                      subtitle: Text('ID: ${exam.id} - Type: ${exam.type} - Minutes: ${exam.minutes}'),
                      onTap: () => Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => ExamDetails(exam: exam, student: student)),
                      ),
                    );
                  },
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}

class ExamDetails extends StatelessWidget {
  final Exam exam;
  final Student student;

  ExamDetails({required this.exam, required this.student});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Exam Details'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Exam: ${exam.name}',
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 10),
            Text('Type: ${exam.type}'),
            Text('Duration: ${exam.minutes} minutes'),
            SizedBox(height: 20),
            Text(
              'Questions',
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            ...exam.options.entries.map((entry) {
              int questionNumber = entry.key;
              Map<int, String> options = entry.value;
              return Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text('Question $questionNumber:'),
                  ...options.entries.map((option) {
                    int optionNumber = option.key;
                    String optionText = option.value;
                    return RadioListTile(
                      value: optionNumber,
                      groupValue: exam.selectedAnswer[questionNumber],
                      onChanged: (int? value) {
                        exam.selectedAnswer[questionNumber] = value!;
                        Provider.of<Student>(context, listen: false).notifyListeners();
                      },
                      title: Text(optionText),
                    );
                  }).toList(),
                ],
              );
            }).toList(),
            ...exam.subjectiveQuestions.map((question) {
              return Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text('Question: $question'),
                  TextField(
                    onChanged: (value) {
                      // Handle subjective answer submission
                    },
                    decoration: InputDecoration(hintText: 'Enter your answer'),
                  ),
                ],
              );
            }).toList(),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                // Handle exam submission
                showDialog(
                  context: context,
                  builder: (context) => AlertDialog(
                    title: Text('Exam Submitted'),
                    content: Text('Your exam has been submitted successfully.'),
                    actions: [
                      TextButton(
                        onPressed: () {
                          Navigator.pop(context);
                          Navigator.pop(context);
                        },
                        child: Text('OK'),
                      ),
                    ],
                  ),
                );
              },
              child: Text('Submit Exam'),
            ),
          ],
        ),
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
      body: ChangeNotifierProvider.value(
        value: teacher,
        child: TeacherDashboard(teacher: teacher),
      ),
    );
  }
}

class TeacherDashboard extends StatefulWidget {
  final Teacher teacher;

  TeacherDashboard({required this.teacher});

  @override
  _TeacherDashboardState createState() => _TeacherDashboardState();
}

class _TeacherDashboardState extends State<TeacherDashboard> {
  @override
  Widget build(BuildContext context) {
    return Consumer<Teacher>(
      builder: (context, teacher, child) {
        return Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Courses',
                style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
              ),

              //Inserting a few hard coded courses using the expand widget
              //This is a temporary solution to show the courses

              Expanded(
                child: ListView.builder(
                  itemCount: 5,
                  itemBuilder: (context, index) {
                    final course = Course(
                      name: 'Course ${index + 1}',
                      id: 'C${index + 1}',
                      creditHours: 3,
                    );
                    return ListTile(
                      title: Text(course.name),
                      subtitle: Text('ID: ${course.id} - Credit Hours: ${course.creditHours}'),
                    );
                  },
                ),
              ),

              SizedBox(height: 20),

              //oone more hard coded course

              Expanded(
                child: ListView.builder(
                  itemCount: 1,
                  itemBuilder: (context, index) {
                    final course = Course(
                      name: 'Course 6',
                      id: 'C6',
                      creditHours: 3,
                    );
                    return ListTile(
                      title: Text(course.name),
                      subtitle: Text('ID: ${course.id} - Credit Hours: ${course.creditHours}'),
                    );
                  },
                ),
              ),

              SizedBox(height: 20),

              //oone more hard coded course

              Expanded(
                child: ListView.builder(
                  itemCount: 1,
                  itemBuilder: (context, index) {
                    final course = Course(
                      name: 'Course 7',
                      id: 'C7',
                      creditHours: 3,
                    );
                    return ListTile(
                      title: Text(course.name),
                      subtitle: Text('ID: ${course.id} - Credit Hours: ${course.creditHours}'),
                    );
                  },
                ),
              ),

              Text(
                'Exams',
                style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
              ),

              //Inserting a few hard coded exams using the expand widget

              Expanded(
                child: ListView.builder(
                  itemCount: 5,
                  itemBuilder: (context, index) {
                    final exam = Exam(
                      name: 'Exam ${index + 1}',
                      id: 'E${index + 1}',
                      type: ExamType.Quiz,
                      minutes: 30,
                    );
                    return ListTile(
                      title: Text(exam.name),
                      subtitle: Text('ID: ${exam.id} - Type: ${exam.type} - Minutes: ${exam.minutes}'),
                    );
                  },
                ),
              ),

              SizedBox(height: 20),

              //Inserting a few hard coded exams using the expand widget

              Expanded(
                child: ListView.builder(
                  itemCount: 5,
                  itemBuilder: (context, index) {
                    final exam = Exam(
                      name: 'Exam ${index + 6}',
                      id: 'E${index + 6}',
                      type: ExamType.Quiz,
                      minutes: 30,
                    );
                    return ListTile(
                      title: Text(exam.name),
                      subtitle: Text('ID: ${exam.id} - Type: ${exam.type} - Minutes: ${exam.minutes}'),
                    );
                  },
                ),
              ),

              SizedBox(height: 20),

              //Inserting a few hard coded exams using the expand widget

              Expanded(
                child: ListView.builder(
                  itemCount: 5,
                  itemBuilder: (context, index) {
                    final exam = Exam(
                      name: 'Exam ${index + 11}',
                      id: 'E${index + 11}',
                      type: ExamType.Quiz,
                      minutes: 30,
                    );
                    return ListTile(
                      title: Text(exam.name),
                      subtitle: Text('ID: ${exam.id} - Type: ${exam.type} - Minutes: ${exam.minutes}'),
                    );
                  },
                ),
              ),

              SizedBox(height: 10),
              Expanded(
                child: ListView.builder(
                  itemCount: teacher.courses.length,
                  itemBuilder: (context, index) {
                    final course = teacher.courses[index];
                    return ListTile(
                      title: Text(course.name),
                      subtitle: Text('ID: ${course.id} - Credit Hours: ${course.creditHours}'),
                    );
                  },
                ),
              ),
              SizedBox(height: 20),
              ElevatedButton(
                onPressed: () => showDialog(
                  context: context,
                  builder: (context) => AddCourseDialog(teacher: teacher),
                ),
                child: Text('Add Course'),
              ),
              SizedBox(height: 40),
              Text(
                'Exams',
                style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
              ),
              SizedBox(height: 10),
              Expanded(
                child: ListView.builder(
                  itemCount: teacher.exams.length,
                  itemBuilder: (context, index) {
                    final exam = teacher.exams[index];
                    return ListTile(
                      title: Text(exam.name),
                      subtitle: Text('ID: ${exam.id} - Type: ${exam.type} - Minutes: ${exam.minutes}'),
                    );
                  },
                ),
              ),
              SizedBox(height: 20),
              ElevatedButton(
                onPressed: () => showDialog(
                  context: context,
                  builder: (context) => AddExamDialog(teacher: teacher),
                ),
                child: Text('Create Exam'),
              ),
            ],
          ),
        );
      },
    );
  }
}

class AddCourseDialog extends StatefulWidget {
  final Teacher teacher;

  AddCourseDialog({required this.teacher});

  @override
  _AddCourseDialogState createState() => _AddCourseDialogState();
}

class _AddCourseDialogState extends State<AddCourseDialog> {
  TextEditingController nameController = TextEditingController();
  TextEditingController idController = TextEditingController();
  TextEditingController creditHoursController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: Text('Add Course'),
      content: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          TextField(
            controller: nameController,
            decoration: InputDecoration(labelText: 'Course Name'),
          ),
          TextField(
            controller: idController,
            decoration: InputDecoration(labelText: 'Course ID'),
          ),
          TextField(
            controller: creditHoursController,
            decoration: InputDecoration(labelText: 'Credit Hours'),
            keyboardType: TextInputType.number,
          ),
        ],
      ),
      actions: [
        ElevatedButton(
          onPressed: () {
            final course = Course(
              name: nameController.text,
              id: idController.text,
              creditHours: int.parse(creditHoursController.text),
            );
            widget.teacher.addCourse(course);
            Navigator.pop(context);
          },
          child: Text('Add'),
        ),
        TextButton(
          onPressed: () {
            Navigator.pop(context);
          },
          child: Text('Cancel'),
        ),
      ],
    );
  }
}

class AddExamDialog extends StatefulWidget {
  final Teacher teacher;

  AddExamDialog({required this.teacher});

  @override
  _AddExamDialogState createState() => _AddExamDialogState();
}

class _AddExamDialogState extends State<AddExamDialog> {
  TextEditingController nameController = TextEditingController();
  TextEditingController idController = TextEditingController();
  TextEditingController minutesController = TextEditingController();
  ExamType selectedType = ExamType.Quiz;
  List<TextEditingController> questionControllers = [];
  List<TextEditingController> optionControllers = [];
  TextEditingController questionController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: Text('Create Exam'),
      content: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          TextField(
            controller: nameController,
            decoration: InputDecoration(labelText: 'Exam Name'),
          ),
          TextField(
            controller: idController,
            decoration: InputDecoration(labelText: 'Exam ID'),
          ),
          TextField(
            controller: minutesController,
            decoration: InputDecoration(labelText: 'Duration (minutes)'),
            keyboardType: TextInputType.number,
          ),
          DropdownButton<ExamType>(
            value: selectedType,
            onChanged: (ExamType? newValue) {
              setState(() {
                selectedType = newValue!;
              });
            },
            items: ExamType.values.map<DropdownMenuItem<ExamType>>((ExamType value) {
              return DropdownMenuItem<ExamType>(
                value: value,
                child: Text(value.toString().split('.').last),
              );
            }).toList(),
          ),
          TextField(
            controller: questionController,
            decoration: InputDecoration(labelText: 'Enter Question'),
          ),
          ...List.generate(
            4,
            (index) {
              TextEditingController controller = TextEditingController();
              optionControllers.add(controller);
              return TextField(
                controller: controller,
                decoration: InputDecoration(labelText: 'Option ${index + 1}'),
              );
            },
          ),
        ],
      ),
      actions: [
        ElevatedButton(
          onPressed: () {
            final exam = Exam(
              name: nameController.text,
              id: idController.text,
              type: selectedType,
              minutes: int.parse(minutesController.text),
            );
            exam.addSubjectiveQuestion(questionController.text);
            for (int i = 0; i < optionControllers.length; i++) {
              exam.addOption(0, {i: optionControllers[i].text});
            }
            widget.teacher.addExam(exam);
            Navigator.pop(context);
          },
          child: Text('Create'),
        ),
        TextButton(
          onPressed: () {
            Navigator.pop(context);
          },
          child: Text('Cancel'),
        ),
      ],
    );
  }
}
