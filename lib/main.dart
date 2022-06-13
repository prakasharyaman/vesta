import 'dart:async';
import 'package:firebase_analytics/firebase_analytics.dart';
import 'package:firebase_crashlytics/firebase_crashlytics.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'app/app.dart';
import 'package:firebase_core/firebase_core.dart';
import 'app/controller/firebase_controller.dart';
import 'firebase_options.dart';
import 'ui/countrySelect/controller/country_select_controller.dart';

void main() async {
  runZonedGuarded<Future<void>>(() async {
    // zoned method of running
    WidgetsFlutterBinding.ensureInitialized();
    await Hive.initFlutter();
    //firebase init
    await Firebase.initializeApp(
      options: DefaultFirebaseOptions.currentPlatform,
    );

// Pass all uncaught errors from the framework to Crashlytics.
    FlutterError.onError = FirebaseCrashlytics.instance.recordFlutterError;

    //firebase analytics

    FirebaseAnalytics firebaseAnalytics = FirebaseAnalytics.instance;
    FirebaseAnalyticsObserver firebaseAnalyticsObserver =
        FirebaseAnalyticsObserver(analytics: firebaseAnalytics);
    // firebase messaging
    // FirebaseMessaging.onBackgroundMessage(_firebaseMessagingBackgroundHandler);

    // put controllers
    // firebase controller to handle login ,analytics ,etc
    Get.put<FirebaseController>(
        FirebaseController(firebaseAnalytics: firebaseAnalytics));

    runApp(GetMaterialApp(
      debugShowCheckedModeBanner: false,
      title: "Vesta",
      themeMode: ThemeMode.system,
      navigatorObservers: [firebaseAnalyticsObserver],
      home: const App(),
    ));
  },
      (error, stack) =>
          FirebaseCrashlytics.instance.recordError(error, stack, fatal: true));
}
