import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'app/app.dart';
import 'ui/home/controller/home_controller.dart';

void main() {
  Get.put(HomeController());
  runApp(GetMaterialApp(home: const App()));
}
