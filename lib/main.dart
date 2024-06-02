//Run the app and use changeNotfierProvider
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:state_manag/buisiness_logic.dart';
import 'package:state_manag/screens.dart';

void main() {
  runApp(
    ChangeNotifierProvider(
      create: (context) => Parent(),
      child: MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: CategoryScreen(),
    );
  }
}


//This appllication is about managing our activities
/*

Here is the buisiness logic:

class Parent extends ChangeNotifier{
  List<Category> allCategories = [];

  void addCategory
}

a parent will maintain all the categories

class Category {
  String categoryName;
  List<Activity> activities = [];
  void addActivity(Activity activity){
    activities.add(activity);
    notifyListeners();
  }

  void removeActivity(Activity activity){
    activities.remove(activity);
    notifyListeners();
  }
}



each category is gonna have activities and each activity will maintain recrords

class Activity extends ChangeNotifierProvider{
  String activityName;
  List<Record> records = [];

  void addRecord(Record record){
    records.add(record);
    notifyListeners();
  }

  void removeRecord(Record record){
    records.remove(record);
    notifyListeners();
  }

}

a record simply has and id and integer value
class Record {
  DateTime timestamp;
  int count;

  }


User interface:
On the main screen we will display all the categories in the parent;
using the floating action button we should be able to create category using the alert diaglogue box.
As the category is added. the category shoudl appear in a listview using a list tile..
The list tile will have the name of the category and on the trailing side the nuumber of activities that are inside this category

When we press on the category we should navigate to another screen and we should be able to see all the activities in that category in a listview
the list tile of the 
the floating action button is gonna be used to add activities to the category.
we are gonna use an alert dialogue box to take the inpu of the activity name and add it to the list of activities in the category

When we press on the activity in the category we should navigate to the activity screen and we should be able to see all the records in that activity in a listview
but this interface is gonna be different. 
there is a count text fiel that takes integer input to indicate the count of the record and along side we will have and add button that adds the record to the list of
records in the activity. when we press the add button we add the record of the count and also recrord the timestamp of record creation. this record will automaticaly appear in the 
listile below that is showing the records of the acctivity.

 */
