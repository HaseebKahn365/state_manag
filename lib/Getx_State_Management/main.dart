import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:state_manag/Getx_State_Management/buisiness_logic_getx.dart';
import 'package:state_manag/Provider_State_Management/screens.dart';

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
