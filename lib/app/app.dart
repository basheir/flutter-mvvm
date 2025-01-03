import 'package:flutter/material.dart';
import 'package:mvvm_project/presentation/resources/routes_manager.dart';
import 'package:mvvm_project/presentation/resources/theme_manager.dart';

class MyApp extends StatefulWidget {
//   MyApp._internal(); // private named constructor

// static final MyApp instance = MyApp._internal(); // single instance -- singleton

// factory MyApp() => MyApp();

 const MyApp._internal(); // private named constructor
  final int appState = 0;
  static final MyApp instance =
      const MyApp._internal(); // single instance -- singleton

  factory MyApp() => instance; // factory for the class instance



  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp( 
      onGenerateRoute: RouteGenerator.getRoute,
      initialRoute: Routes.splashRoute,
      theme: getApplicationTheme(),
    );
  }
}