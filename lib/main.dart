import 'package:flutter/material.dart';
import 'package:workmanager/workmanager.dart';
import 'package:workmanager_demo/home_screen.dart';

void callbackDispatcher() {
  //used to be execute the background task which contains callback handler
  Workmanager().executeTask((taskName, inputData) {
    print("Task execute: $taskName");

    return Future.value(true);
  });
}

void main() {
  WidgetsFlutterBinding.ensureInitialized();

  //initialize the work manager and call the its callback function.
  Workmanager().initialize(callbackDispatcher);
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const HomeScreen(),
    );
  }
}
