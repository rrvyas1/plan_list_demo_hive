import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:plan_list_demo/db/plan_collection.dart';
import 'package:plan_list_demo/models/plan.dart';
import 'package:plan_list_demo/screens/plan_screen.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await Hive.initFlutter();
  Hive.registerAdapter(PlanItemAdapter());
  await PlanList.openPlanItemBox();
  // await Hive.openBox<PlanItem>('planList');

  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: PlanScreen(),
    );
  }
}
