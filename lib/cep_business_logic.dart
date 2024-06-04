import 'dart:math';
import 'package:flutter/material.dart';

class University with ChangeNotifier {
  List<Student> students = [];
  List<Teacher> teachers = [];

  void addStudent(Student student) {
    students.add(student);
    notifyListeners();
  }

  void addTeacher(Teacher teacher) {
    teachers.add(teacher);
    notifyListeners();
  }

  Student? getStudent(String id, String password) {
    return students.firstWhere((student) => student.id == id && student.password == password);
  }

  Teacher? getTeacher(String id, String password) {
    return teachers.firstWhere((teacher) => teacher.id == id && teacher.password == password);
  }

  void addCourseToTeacher(Teacher teacher, Course course) {
    teacher.addCourse(course);
    notifyListeners();
  }

  void addExamToTeacher(Teacher teacher, Exam exam) {
    teacher.addExam(exam);
    notifyListeners();
  }

  void mockData() {
    final List<String> studentNames = ['Ahmed', 'Mohammed', 'Ali', 'Hassan', 'Hussein', 'Ibrahim', 'Ismail', 'Osman', 'Yusuf', 'Zayd', 'Amin', 'Bashir', 'Farid', 'Jamal', 'Karim', 'Naseem', 'Qasim', 'Rashid', 'Saeed', 'Tariq'];

    final List<String> teacherNames = ['Dr. Abdullah', 'Dr. Khalid', 'Dr. Mahmood', 'Dr. Samir', 'Dr. Tariq'];

    final Random random = Random();

    for (int i = 0; i < 100; i++) {
      final name = studentNames[random.nextInt(studentNames.length)];
      final student = Student(
        name: name,
        id: 'S${i + 1}',
        password: 'password${i + 1}',
        isPaid: random.nextBool(),
      );
      addStudent(student);
    }

    for (int i = 0; i < 5; i++) {
      final name = teacherNames[i];
      final teacher = Teacher(
        name: name,
        id: 'T${i + 1}',
        password: 'password${i + 1}',
      );
      addTeacher(teacher);

      for (int j = 0; j < 30; j++) {
        final exam = Exam(
          name: 'Exam ${j + 1}',
          id: 'E${i * 30 + j + 1}',
          type: ExamType.values[random.nextInt(ExamType.values.length)],
          minutes: 60,
        );

        for (int k = 0; k < 5; k++) {
          exam.addSubjectiveQuestion('What is the meaning of question ${k + 1}?');
          exam.addOption(k, {
            1: 'Option 1 for question ${k + 1}',
            2: 'Option 2 for question ${k + 1}',
            3: 'Option 3 for question ${k + 1}',
            4: 'Option 4 for question ${k + 1}',
          });
          exam.addCorrectAnswer(k, random.nextInt(4) + 1);
        }

        addExamToTeacher(teacher, exam);
      }
    }
  }
}

class Student with ChangeNotifier {
  String name;
  String id;
  String password;
  bool isPaid;
  List<Course> courses = [];
  List<Exam> exams = [];

  Student({required this.name, required this.id, required this.password, required this.isPaid});

  void addCourse(Course course) {
    courses.add(course);
    notifyListeners();
  }

  void addExam(Exam exam) {
    exams.add(exam);
    notifyListeners();
  }
}

class Teacher with ChangeNotifier {
  String name;
  String id;
  String password;
  List<Course> courses = [];
  List<Exam> exams = [];

  Teacher({required this.name, required this.id, required this.password});

  void addCourse(Course course) {
    courses.add(course);
    notifyListeners();
  }

  void addExam(Exam exam) {
    exams.add(exam);
    notifyListeners();
  }
}

class Course {
  String name;
  String id;
  int creditHours;

  Course({required this.name, required this.id, required this.creditHours});
}

enum ExamType { Quiz, FinalTerm, MidTerm }

class Exam {
  String name;
  String id;
  ExamType type;
  Map<int, Map<int, String>> options = {};
  Map<int, int> correctAnswer = {};
  Map<int, int> selectedAnswer = {};
  List<String> subjectiveQuestions = [];
  List<int> eachQuestionTotalMarks = [];
  List<int> correctMCQs = [];
  int minutes;

  Exam({required this.name, required this.id, required this.type, required this.minutes});

  void addSubjectiveQuestion(String question) {
    subjectiveQuestions.add(question);
  }

  void addOption(int questionNumber, Map<int, String> option) {
    options[questionNumber] = option;
  }

  void addCorrectAnswer(int questionNumber, int answer) {
    correctAnswer[questionNumber] = answer;
  }
}
