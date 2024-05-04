import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:tpappmobile/Pages/LogInServices/View/loginpage.dart';
import 'package:tpappmobile/Sqlite/sqlite.dart';



void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  DatabaseHelper db = DatabaseHelper();
  await db.initDB();
  runApp( MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'Tp Hajj',
      debugShowCheckedModeBanner: false,
      home: loginPage(),
    );
  }
}
