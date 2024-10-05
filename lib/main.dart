import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:health_care_app/src/di/sevice_locator.dart';
import 'package:health_care_app/src/presentation/my_app.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await setPreferredOrientations();
  await ServiceLocator.configureDependencies();
  runApp(MyApp());
}

Future<void> setPreferredOrientations() {
  return SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitUp,
    DeviceOrientation.portraitDown,
    DeviceOrientation.landscapeRight,
    DeviceOrientation.landscapeLeft,
  ]);
}
