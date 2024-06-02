import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:state_manag/buisiness_logic_getx.dart';
import 'package:state_manag/screens_getx.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // Initialize the ParentController
    Get.put(ParentController());

    return GetMaterialApp(
      home: CategoryScreen(),
    );
  }
}
