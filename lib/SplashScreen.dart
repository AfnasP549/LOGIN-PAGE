import 'package:flutter/material.dart';
import 'package:my_login_project/List.dart';
import 'package:my_login_project/login.dart';
import 'package:shared_preferences/shared_preferences.dart';

class Splash extends StatefulWidget {
  const Splash({Key? key}) : super(key: key);

  @override
  _SplashState createState() => _SplashState();
}

class _SplashState extends State<Splash> {
  @override
  void initState() {
    super.initState();
    checkLoginAndNavigate();
  }

  Future<void> checkLoginAndNavigate() async {
    final shr = await SharedPreferences.getInstance();
    final userLoggedIn = shr.getBool('login');
   
    if (userLoggedIn == true) {
      Navigator.of(context).push(MaterialPageRoute(builder: (ctx){
                  return List();
                },),);
    } else {
      Navigator.of(context).push(MaterialPageRoute(builder: (ctx){
                  return Login();
                },),);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(child: CircularProgressIndicator()),
    );
}}