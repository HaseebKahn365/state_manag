//code for the category screen:

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:state_manag/buisiness_logic.dart';

class CategoryScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Categories'),
      ),
      body: Consumer<Parent>(
        builder: (context, parent, child) {
          return ListView.builder(
            itemCount: parent.allCategories.length,
            itemBuilder: (context, index) {
              final category = parent.allCategories[index];
              return ChangeNotifierProvider.value(
                value: category,
                child: Consumer<Category>(
                  builder: (context, category, child) {
                    return ListTile(
                      title: Text(category.categoryName),
                      trailing: Text('${category.activities.length} activities'),
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => ActivityScreen(category: category),
                          ),
                        );
                      },
                    );
                  },
                ),
              );
            },
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          _showAddCategoryDialog(context);
        },
        child: Icon(Icons.add),
      ),
    );
  }

  void _showAddCategoryDialog(BuildContext context) {
    TextEditingController _controller = TextEditingController();
    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: Text('Add Category'),
          content: TextField(
            controller: _controller,
            decoration: InputDecoration(hintText: 'Category Name'),
          ),
          actions: [
            TextButton(
              onPressed: () {
                final categoryName = _controller.text;
                if (categoryName.isNotEmpty) {
                  final category = Category(categoryName);
                  Provider.of<Parent>(context, listen: false).addCategory(category);
                }
                Navigator.of(context).pop();
              },
              child: Text('Add'),
            ),
          ],
        );
      },
    );
  }
}

//!sccreen for the activity

class ActivityScreen extends StatelessWidget {
  final Category category;

  ActivityScreen({required this.category});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider.value(
      value: category,
      child: Scaffold(
        appBar: AppBar(
          title: Text(category.categoryName),
        ),
        body: Consumer<Category>(
          builder: (context, category, child) {
            return ListView.builder(
              itemCount: category.activities.length,
              itemBuilder: (context, index) {
                final activity = category.activities[index];
                return ChangeNotifierProvider.value(
                  value: activity,
                  child: Consumer<Activity>(
                    builder: (context, activity, child) {
                      return ListTile(
                        title: Text(activity.activityName),
                        trailing: Text('${activity.records.length} records'),
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => RecordScreen(activity: activity),
                            ),
                          );
                        },
                      );
                    },
                  ),
                );
              },
            );
          },
        ),
        floatingActionButton: FloatingActionButton(
          onPressed: () {
            _showAddActivityDialog(context);
          },
          child: Icon(Icons.add),
        ),
      ),
    );
  }

  void _showAddActivityDialog(BuildContext context) {
    TextEditingController _controller = TextEditingController();
    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: Text('Add Activity'),
          content: TextField(
            controller: _controller,
            decoration: InputDecoration(hintText: 'Activity Name'),
          ),
          actions: [
            TextButton(
              onPressed: () {
                final activityName = _controller.text;
                if (activityName.isNotEmpty) {
                  final activity = Activity(activityName);
                  category.addActivity(activity);
                }
                Navigator.of(context).pop();
              },
              child: Text('Add'),
            ),
          ],
        );
      },
    );
  }
}

//screeen for the records of the activity

class RecordScreen extends StatelessWidget {
  final Activity activity;

  RecordScreen({required this.activity});

  @override
  Widget build(BuildContext context) {
    TextEditingController _controller = TextEditingController();

    return ChangeNotifierProvider.value(
      value: activity,
      child: Scaffold(
        appBar: AppBar(
          title: Text(activity.activityName),
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
              child: Consumer<Activity>(
                builder: (context, activity, child) {
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
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
