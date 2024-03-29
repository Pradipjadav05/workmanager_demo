import 'package:flutter/material.dart';
import 'package:workmanager/workmanager.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    // used run background task periodically
    // frequency: used to define periodic time default 15 min, f you have configured a lower frequency it will automatically change your frequency to 15
    Workmanager().registerPeriodicTask("taskTwo", "backUp",
        frequency: const Duration(minutes: 15));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Work Manager Demo"),
        centerTitle: true,
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ElevatedButton(
              onPressed: () {
                /*
                * Schedule a one off task A uniqueName is required so only one task can be registered (on demand task execute)
                * Property:
                * 1. constraint: used to define various constraint like required network connectivity, requiresStorageNotLow, requiresBatteryNotLow etc.
                * 2. initialDelay: define delay to start task
                * 3. inputData: used pass primitive data in background task
                * 4. tag: used to cancel the task
                * */
                Workmanager().registerOneOffTask("taskOne", "backUp");
              },
              child: const Text("Run Task"),
            ),
            const SizedBox(
              height: 10,
            ),
            ElevatedButton(
              onPressed: () {
                /*
                * we can cancel task by using UniqueName, cancelAll, cancelByTag methods
                * */
                Workmanager().cancelByUniqueName("taskOne");
              },
              child: const Text("Cancel Task"),
            ),
          ],
        ),
      ),
    );
  }
}
