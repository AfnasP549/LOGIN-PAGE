import 'package:flutter/material.dart';
import 'package:my_login_project/SplashScreen.dart';
// import 'package:my_login_project/Home.dart';
import 'package:my_login_project/login.dart';

void main(){
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home:Splash(),
     theme: ThemeData(
      primarySwatch: Colors.green,
     ),
    );
  }
}