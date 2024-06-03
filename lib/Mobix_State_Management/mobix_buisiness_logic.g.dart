// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'mobix_buisiness_logic.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$Parent on _Parent, Store {
  late final _$allCategoriesAtom =
      Atom(name: '_Parent.allCategories', context: context);

  @override
  ObservableList<Category> get allCategories {
    _$allCategoriesAtom.reportRead();
    return super.allCategories;
  }

  @override
  set allCategories(ObservableList<Category> value) {
    _$allCategoriesAtom.reportWrite(value, super.allCategories, () {
      super.allCategories = value;
    });
  }

  late final _$_ParentActionController =
      ActionController(name: '_Parent', context: context);

  @override
  void addCategory(Category category) {
    final _$actionInfo =
        _$_ParentActionController.startAction(name: '_Parent.addCategory');
    try {
      return super.addCategory(category);
    } finally {
      _$_ParentActionController.endAction(_$actionInfo);
    }
  }

  @override
  void removeCategory(Category category) {
    final _$actionInfo =
        _$_ParentActionController.startAction(name: '_Parent.removeCategory');
    try {
      return super.removeCategory(category);
    } finally {
      _$_ParentActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
allCategories: ${allCategories}
    ''';
  }
}

mixin _$Category on _Category, Store {
  late final _$categoryNameAtom =
      Atom(name: '_Category.categoryName', context: context);

  @override
  String get categoryName {
    _$categoryNameAtom.reportRead();
    return super.categoryName;
  }

  @override
  set categoryName(String value) {
    _$categoryNameAtom.reportWrite(value, super.categoryName, () {
      super.categoryName = value;
    });
  }

  late final _$activitiesAtom =
      Atom(name: '_Category.activities', context: context);

  @override
  ObservableList<Activity> get activities {
    _$activitiesAtom.reportRead();
    return super.activities;
  }

  @override
  set activities(ObservableList<Activity> value) {
    _$activitiesAtom.reportWrite(value, super.activities, () {
      super.activities = value;
    });
  }

  late final _$_CategoryActionController =
      ActionController(name: '_Category', context: context);

  @override
  void addActivity(Activity activity) {
    final _$actionInfo =
        _$_CategoryActionController.startAction(name: '_Category.addActivity');
    try {
      return super.addActivity(activity);
    } finally {
      _$_CategoryActionController.endAction(_$actionInfo);
    }
  }

  @override
  void removeActivity(Activity activity) {
    final _$actionInfo = _$_CategoryActionController.startAction(
        name: '_Category.removeActivity');
    try {
      return super.removeActivity(activity);
    } finally {
      _$_CategoryActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
categoryName: ${categoryName},
activities: ${activities}
    ''';
  }
}

mixin _$Activity on _Activity, Store {
  late final _$activityNameAtom =
      Atom(name: '_Activity.activityName', context: context);

  @override
  String get activityName {
    _$activityNameAtom.reportRead();
    return super.activityName;
  }

  @override
  set activityName(String value) {
    _$activityNameAtom.reportWrite(value, super.activityName, () {
      super.activityName = value;
    });
  }

  late final _$recordsAtom = Atom(name: '_Activity.records', context: context);

  @override
  ObservableList<Record> get records {
    _$recordsAtom.reportRead();
    return super.records;
  }

  @override
  set records(ObservableList<Record> value) {
    _$recordsAtom.reportWrite(value, super.records, () {
      super.records = value;
    });
  }

  late final _$_ActivityActionController =
      ActionController(name: '_Activity', context: context);

  @override
  void addRecord(Record record) {
    final _$actionInfo =
        _$_ActivityActionController.startAction(name: '_Activity.addRecord');
    try {
      return super.addRecord(record);
    } finally {
      _$_ActivityActionController.endAction(_$actionInfo);
    }
  }

  @override
  void removeRecord(Record record) {
    final _$actionInfo =
        _$_ActivityActionController.startAction(name: '_Activity.removeRecord');
    try {
      return super.removeRecord(record);
    } finally {
      _$_ActivityActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
activityName: ${activityName},
records: ${records}
    ''';
  }
}
