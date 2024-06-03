import 'package:mobx/mobx.dart';

// Activity Store

part 'mobix_buisiness_logic.g.dart'; // Add this line

// Parent Store

class Parent = _Parent with _$Parent;

abstract class _Parent with Store {
  @observable
  ObservableList<Category> allCategories = ObservableList<Category>();

  @action
  void addCategory(Category category) {
    allCategories.add(category);
  }

  @action
  void removeCategory(Category category) {
    allCategories.remove(category);
  }
}

// Category Store
class Category = _Category with _$Category;

abstract class _Category with Store {
  _Category(this.categoryName);

  @observable
  String categoryName;

  @observable
  ObservableList<Activity> activities = ObservableList<Activity>();

  @action
  void addActivity(Activity activity) {
    activities.add(activity);
  }

  @action
  void removeActivity(Activity activity) {
    activities.remove(activity);
  }
}

class Activity = _Activity with _$Activity;

abstract class _Activity with Store {
  _Activity(this.activityName);

  @observable
  String activityName;

  @observable
  ObservableList<Record> records = ObservableList<Record>();

  @action
  void addRecord(Record record) {
    records.add(record);
  }

  @action
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
