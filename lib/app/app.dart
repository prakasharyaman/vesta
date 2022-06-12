import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

import '../ui/home.dart';
import '../ui/splash/splash.dart';
import 'controller/firebase_controller.dart';

class App extends StatelessWidget {
  const App({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetBuilder<FirebaseController>(
      builder: (controller) => Obx(
        () => controller.userModel.value.id == null
            ? const Splash()
            : const Home(),
      ),
    );
  }
}
