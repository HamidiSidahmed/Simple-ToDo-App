import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:todoapp/box.dart';
import 'package:todoapp/boxclass.dart';
import 'package:todoapp/monthboxclass.dart';
import 'package:todoapp/today.dart';
import 'package:todoapp/weekboxclass.dart';

void main() async {
  await Hive.initFlutter();
  Hive.registerAdapter(boxclassAdapter());
  Hive.registerAdapter(weekboxclassAdapter());
  Hive.registerAdapter(monthboxclassAdapter());
   todo = await Hive.openBox<boxclass>("todo");
   weektodo=await Hive.openBox<weekboxclass>("weektodo");
   monthtodo=await Hive.openBox<monthboxclass>("monthtodo");

  runApp( MaterialApp(
 
    debugShowCheckedModeBanner: false,
   home: today(),));
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        
      )
    );
  }
}