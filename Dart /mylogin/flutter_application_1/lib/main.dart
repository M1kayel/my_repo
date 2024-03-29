import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:get_it/get_it.dart';
//import 'package:/mylogin/app/db/preferences_service.dart';
//import 'package:mylogin/app/routes/routes.dart';
import 'package:flutter_application_1/db/preferences_service.dart';
import 'package:flutter_application_1/routes/routes.dart';

Future<void> _setupSerivces() async {
  final SharedPreferences preferences = await SharedPreferences.getInstance();
  GetIt.instance.registerFactory(() => PreferenceService(preferences));
}

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await _setupSerivces();
  runApp(MaterialApp(
    debugShowCheckedModeBanner: false,
    routes: Routes.routes,
  ));
}
