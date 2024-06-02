import 'package:get/get.dart';

// Parent Controller
class ParentController extends GetxController {
  var allCategories = <CategoryController>[].obs;

  void addCategory(CategoryController category) {
    allCategories.add(category);
  }

  void removeCategory(CategoryController category) {
    allCategories.remove(category);
  }
}

// Category Controller
class CategoryController extends GetxController {
  var categoryName = ''.obs;
  var activities = <ActivityController>[].obs;

  CategoryController(String name) {
    categoryName.value = name;
  }

  void addActivity(ActivityController activity) {
    activities.add(activity);
  }

  void removeActivity(ActivityController activity) {
    activities.remove(activity);
  }
}

// Activity Controller
class ActivityController extends GetxController {
  var activityName = ''.obs;
  var records = <Record>[].obs;

  ActivityController(String name) {
    activityName.value = name;
  }

  void addRecord(Record record) {
    records.add(record);
  }

  void removeRecord(Record record) {
    records.remove(record);
  }
}

// Record Model
class Record {
  DateTime timestamp;
  int count;

  Record(this.timestamp, this.count);
}
