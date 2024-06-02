import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:state_manag/buisiness_logic_getx.dart';

class CategoryScreen extends StatelessWidget {
  final ParentController parentController = Get.find();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Categories'),
      ),
      body: Obx(() {
        return ListView.builder(
          itemCount: parentController.allCategories.length,
          itemBuilder: (context, index) {
            final category = parentController.allCategories[index];
            return ListTile(
              title: Text(category.categoryName.value),
              trailing: Obx(() => Text('${category.activities.length} activities')),
              onTap: () {
                Get.to(() => ActivityScreen(category: category));
              },
            );
          },
        );
      }),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          _showAddCategoryDialog();
        },
        child: Icon(Icons.add),
      ),
    );
  }

  void _showAddCategoryDialog() {
    TextEditingController _controller = TextEditingController();
    Get.defaultDialog(
      title: 'Add Category',
      content: TextField(
        controller: _controller,
        decoration: InputDecoration(hintText: 'Category Name'),
      ),
      confirm: TextButton(
        onPressed: () {
          final categoryName = _controller.text;
          if (categoryName.isNotEmpty) {
            final category = CategoryController(categoryName);
            parentController.addCategory(category);
          }
          Get.back();
        },
        child: Text('Add'),
      ),
    );
  }
}

//!

class ActivityScreen extends StatelessWidget {
  final CategoryController category;

  ActivityScreen({required this.category});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(category.categoryName.value),
      ),
      body: Obx(() {
        return ListView.builder(
          itemCount: category.activities.length,
          itemBuilder: (context, index) {
            final activity = category.activities[index];
            return ListTile(
              title: Text(activity.activityName.value),
              trailing: Obx(() => Text('${activity.records.length} records')),
              onTap: () {
                Get.to(() => RecordScreen(activity: activity));
              },
            );
          },
        );
      }),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          _showAddActivityDialog();
        },
        child: Icon(Icons.add),
      ),
    );
  }

  void _showAddActivityDialog() {
    TextEditingController _controller = TextEditingController();
    Get.defaultDialog(
      title: 'Add Activity',
      content: TextField(
        controller: _controller,
        decoration: InputDecoration(hintText: 'Activity Name'),
      ),
      confirm: TextButton(
        onPressed: () {
          final activityName = _controller.text;
          if (activityName.isNotEmpty) {
            final activity = ActivityController(activityName);
            category.addActivity(activity);
          }
          Get.back();
        },
        child: Text('Add'),
      ),
    );
  }
}

//! Records

class RecordScreen extends StatelessWidget {
  final ActivityController activity;

  RecordScreen({required this.activity});

  @override
  Widget build(BuildContext context) {
    TextEditingController _controller = TextEditingController();

    return Scaffold(
      appBar: AppBar(
        title: Text(activity.activityName.value),
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              children: [
                Expanded(
                  child: TextField(
                    controller: _controller,
                    decoration: InputDecoration(hintText: 'Count'),
                    keyboardType: TextInputType.number,
                  ),
                ),
                IconButton(
                  icon: Icon(Icons.add),
                  onPressed: () {
                    final count = int.tryParse(_controller.text);
                    if (count != null) {
                      final record = Record(DateTime.now(), count);
                      activity.addRecord(record);
                      _controller.clear();
                    }
                  },
                ),
              ],
            ),
          ),
          Expanded(
            child: Obx(() {
              return ListView.builder(
                itemCount: activity.records.length,
                itemBuilder: (context, index) {
                  final record = activity.records[index];
                  return ListTile(
                    title: Text('Count: ${record.count}'),
                    subtitle: Text('Timestamp: ${record.timestamp}'),
                  );
                },
              );
            }),
          ),
        ],
      ),
    );
  }
}
