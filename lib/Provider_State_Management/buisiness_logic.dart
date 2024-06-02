import 'package:flutter/material.dart';

class Parent extends ChangeNotifier {
  List<Category> allCategories = [];

  void addCategory(Category category) {
    allCategories.add(category);
    notifyListeners();
  }

  void removeCategory(Category category) {
    allCategories.remove(category);
    notifyListeners();
  }
}

class Category extends ChangeNotifier {
  String categoryName;
  List<Activity> activities = [];

  Category(this.categoryName);

  void addActivity(Activity activity) {
    activities.add(activity);
    notifyListeners();
  }

  void removeActivity(Activity activity) {
    activities.remove(activity);
    notifyListeners();
  }
}

class Activity extends ChangeNotifier {
  String activityName;
  List<Record> records = [];

  Activity(this.activityName);

  void addRecord(Record record) {
    records.add(record);
    notifyListeners();
  }

  void removeRecord(Record record) {
    records.remove(record);
    notifyListeners();
  }
}

class Record {
  DateTime timestamp;
  int count;

  Record(this.timestamp, this.count);
}
