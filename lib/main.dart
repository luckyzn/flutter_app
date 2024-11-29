import 'package:flutter/material.dart';
import 'package:flutter_app/pages/login.page.dart';

import 'package:flutter_app/widgets/notification_service.dart';
import 'package:get/get.dart';
void main() {
  WidgetsFlutterBinding.ensureInitialized();
  NotificationService().iniciarNotifications();
  runApp(
       const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});
    
  @override
  State<MyApp> createState() => _MyAppState();

}

class _MyAppState extends State<MyApp> {
  bool isSwitched = false;


  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      theme: ThemeData.light(),
      darkTheme: ThemeData.dark(),
      debugShowCheckedModeBanner: false,
      home: const LoginPage()
    );
  } 
}

