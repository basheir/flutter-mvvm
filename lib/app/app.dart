import 'package:flutter/material.dart';
import 'package:mvvm_project/presentation/theme_manager.dart';

class MyApp extends StatefulWidget {
  MyApp._internal(); // private named constructor

static final MyApp instance = MyApp._internal(); // single instance -- singleton

factory MyApp() => MyApp();



  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: getApplicationTheme(),
    );
  }
}